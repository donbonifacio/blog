---
title: "Code patterns that are a recipe for trouble (part 1)"
date: 2018-05-08T08:35:56+01:00
draft: false
categories: ["Testing", "Code Quality", "Code Reviews"]
tags: ["Java", "Javascript", "Ruby", "Clojure"]
images:
  - "/img/bad-code-patterns.png"
discuss:
  - ["Reddit", "https://www.reddit.com/r/programming/comments/8i565u/code_patterns_that_are_a_recipe_for_trouble/"]
  - ["Twitter", "https://twitter.com/donbonifacio/status/994133030657806336"]
---

![Bad code patterns](/img/bad-code-patterns.png)

Sometimes I notice that I have just wasted one hour or so because of some bug in my code,
or something that I did wrong. When that happens I try to step back, understand
what I did and try to come up with a change in my way of working that will
prevent it from happening again.

<!--more-->

The funny thing is that over the years I've gathered several guidelines that I use,
and sometimes when my teammates question me about them, I actually don't
remember the _whys_. I just _know_ that it's a best practice and that I should
follow it. But on this article I tried to go through several of those practices
that I follow and tried to justify them.

There's also a [part 2 with more patterns](/post/code-patterns-that-are-a-recipe-for-trouble-2/),
mostly related with testing, readability, and style. Using these patterns could
turn a project into something that [no one wans to work at](http://localhost:1313/post/project-no-one-wants-to-work-at/).

# Maintainability

## Exceptions without context

Whenever I see code throwing an exception without additional information, I frown.
Something like:

```ruby
def operate
  raise "Ups something went wrong" if damage?
end
```

With the exception we get a stack trace and the information that something
was wrong. But most of the time we lack the context to understand the problem.
Data like the current user, the current object's data, what were we trying
to accomplish and what were we expecting. As a rule of thumb all custom
exceptions should have data describing what was happening.

```ruby
def operate(operator)
  raise OperationDamagedException.new(self, operator) if damage?
end
```

This will allow us to have much more information.

When something goes wrong it's useful to have information to troubleshoot. In
several languages (Ruby, JavaScript) there isn't much attention to logging,
while in others logging is a very important thing (Java).

For example, in Java I was used to see code like this:

```Java
try {
  // ...
} catch (final IOException ex) {
  LOGGER.error("Something bad happening and here you have info.", ex);
  throw new BusinessException(ex);
}
```

And this is actually much better. But the problem is that we'll have to search
the logs for when this happened and that may not be easy. Actually, it may
actually be very complex to get the logs if we don't have access to the
production environment.

But we always get the exception. So I always push for better error reporting,
and try to sell logging mainly for app's behaviour.

## Constructors with lots of default arguments

This is something that I have seen in Java code bases. Java code and tooling
allow for easy refactor and sometimes that allows for this kind of pattern. For
example, imagine that we have a POJO that we use in many places, and on
unit tests we start having:

```Java
@Test
public void test1() {
  final Entity entity = new Entity(1, null, null, false, "", Optional.empty());
  // ...
}

@Test
public void test2() {
  final Entity entity = new Entity(1, null, null, false, "", Optional.empty());
  // ...
}

// And so on
```

When we change the arguments in any way we'll need to update all those places
where we just wanted a dummy `Entity`. This is code that may be easy to refactor
but is not _easy to change_.

We should instead have something like:

```Java
class Entity {
  public static Entity empty() {
    // Even better if this can be a static immutable instance
    new Entity(1, null, null, false, "", Optional.empty());
  }
}
```

Now if we change the `Entity`'s' constructor, all code that uses it doesn't
need to be changed. Note that we may have a more _"Java-ish"_ way of doing this, by
creating a _builder_ class. And that builder class could have that _"empty"_
method.

Honestly this may be my biggest complaint about coding in Java. Having to
create those builder classes is always cumbersome. Yes, our IDE may help,
but if we want code that is properly documented we still need to go and take
care of all the builder's methods.

Anyway, we could make this more simpler by just creating a constructor with
no parameters. But whatever the approach we take, a question remains: are
we adding code just for tests? And yes, we are. We are changing the class's
API just because of tests. Now on this scenario I'd rather focus on _testability_,
and wouldn't mind.

But there are better options, mainly by creating a factory class just for tests,
that could use some _faker_ logic, for example.

## Arrays of statuses

This is mostly common on languages that don't have `enum`s. It goes like this:

```Ruby
class Invoice
  validate :status, inclusion: { in: [:draft, :sent, :paid] }
end

def pay!(invoice)
  return if invoice.status == :paid
end
```

The problem is that these statuses start to leak. We'll start using them
by name on several places. They are prone to typos and it's hard to maintain.
Imagine that you add a new `:rejected` status. It's better to abstract
these concepts on specific constants.

```Ruby
class Invoice
  STATUSES = ([:draft, :sent] + PAID_STATUSES).freeze
  PAID_STATUSES = [:paid].freeze

  validate :status, inclusion: { in: STATUSES }
end

def pay!(invoice)
  return if invoice.status.in?(Invoice::PAID_STATUSES)
end
```

Now the `Invoice` class is the owner of the _statuses_ concept and it's easy
to change without being concerned about code that uses it.

But we can also do better. Because in the future we'll have this change request:

> We want a rejected status, but just for Portuguese speaking users.

Now just constants won't do the trick, and we have constants all over the place.
We can refactor, but it would be better to prepare for this from the start.

```Ruby
class Invoice
  STATUSES = ([:draft, :sent] + PAID_STATUSES).freeze
  PAID_STATUSES = [:paid].freeze

  def self.statuses(context = {})
    return STATUSES + [:rejected] if portuguese?(context)
    STATUSES
  end
end
```

This way we have a good default, but can augment it with additional information.

## High level classes with closed API

I'm talking about classes that represent services, interactors, use cases,
and overall higher level interfaces. Classes that form an API that is public
and used as boundaries to other layers. In dynamic languages we may have
arbitrary arguments and that's great for maintainability. If we define a
strict API we'll have the following scenario:

```ruby
class ProcessPayment
  def initialize(account, amount)
    # ...
  end

  def call
    # ...
  end
end

ProcessPayment.new(account, 10.0).call
```

Imagine now that this class is used all over the place, that we have a library
with it and even external clients use it. And now we want change it's API in
a non breaking way. We want to add the amount's currency. We could just add
another optional argument. But what if we want to add data for an invoice?
Another optional argument?

We may end up with:

```ruby
class ProcessPayment
  def initialize(account, amount, currency, invoice_data, include_taxes)
    # ...
  end
end

ProcessPayment.new(account, 10.0, :EUR, { vat: 1234 }, false).call
```

This will be very hard to maintain. And when we're at this situation, if we
want to change the order or the semantics of an argument, it can be complicated
without a breaking change. We could always create additional factory methods. But
that's more code to maintain and test.

Another options is to assume that the argument list will be changed.

```ruby
class ProcessPayment
  def initialize(args)
    # ...
  end
end

ProcessPayment.new({
  account: account,
  amount: 10.0,
  currency: :EUR,
  invoice_data: { vat: 1234 },
  include_taxes: false
}).call
```

This is much more readable and easy to maintain. But we'll need to consider
proper documentation and validations. In a typed language this could be a
POJO just for the arguments.

## Not using an hash for optional parameters

This is related with the previous pattern. Sometimes we have methods that
have some options and we just add more parameters for them. I actually do this
some times and I usually regret it.

Example:

```js
function getSettingsFor(user, bypassCache) {
  // ...
}

const settings = getSettings(user, true);
```

Seeing that `true` there is already a smell. Because we'll never know what that
_boolean_ does unless we read the docs. For these scenarios is much better
to augment the function to receive options:

```js
function getSettingsFor(user, options) {
  // ...
}

const settings = getSettings(user, { bypassCache: true, includeHolidays: false });
// Or just:
const settings = getSettings(user)
```

## Using a hash instead of a typed object

Following on the previous example, if we're using a strongly typed language,
using a map/hash/dictionary may actually be bad for maintenance. We may
start to get things like:

```Java
final Map<String, Object> options = new ImmutableMap.Builder<String, Object>()
   .put("bypassCache", true)
   .put("includeHolidays", false)
   .put("ignore", ImmutableList.of("Profile", "Account"))
   .build();

final Settings settings = getSettings(user, options);
```

Java developers may already be getting the shivers just by seeing raw `String`s.
In this scenario we could create a POJO with all those information, and it will
be much more splicit.

```Java
final Options options = Options.Builder()
  .setBypassCache(true)
  .setIncludeHolidays(false)
  // ...
  .build()

final Settings settings = getSettings(user, options);
```

It's interesting that I find this typed approach better on typed languages, but
for example in Clojure I don't miss it. Having a data map with the information
and a spec to validate that I'm getting what I expect would be preferable for me.

## Easy access to heavyweight functionalities

This is very common on Rails applications. ActiveRecord makes it very easy
to get data and persist it on the database. And you can use it everywhere. For
example, you could see something like this on a simple property of a PORO:

```Ruby
def can_get_drivers_license?
  requirements = self.user.country.driver_settings.license.requirements
  age > requirements.min_age if requirements.present?
  age >= 18
end
```

I added a big _train_ on purpose. Without knowing the code, I don't know
if that will perform one query with several joins, or if that will perform several
queries. Each object may be fully loaded, even if we don't need it. That code
will also get a connection from a pool and connect to somewhere.

There are a lot of things going on. And when that happens, it means that the
probability of changing something is bigger and it will be hard to maintain
this code.

In these scenarios I actually advocate for having some constraints. For example,
if we have a class that performs queries that receives the connection pool, we
wouldn't be able to use it here, because we wouldn't have a connection. This would
force us to think about our data model and where to fetch the required data.

And it would make the `can_get_drivers_license?` a _pure_ method, that is very
easy to test.

```Ruby
def can_get_drivers_license?(requirements = nil)
  age > requirements.min_age if requirements.present?
  age >= 18
end
```

It may be fast to use ActiveRecord but we need to consider the cost of doing
so and try to minimise the dependencies we have on it.

## Big methods

There is a rule that says that [each method should only have 5 lines](https://robots.thoughtbot.com/sandi-metz-rules-for-developers).
This would be harder to accomplish on some languages. And while it might bee
too extremist, I already felt the need to enforce it.

But the main point is that we should split things in smaller methods/functions,
preferably _pure_. For example, I'd argue that most code in a _branch_ could
be a specific method. This can be cumbersome. We'll need to extract it, and
write documentation for it, and add a test. Example:

```js
function operate(users) {
  return users.filter(user => {
    return user.isSomething && user.isReady;
  })
}
```

Against:

```js
function isUserReasy(user) {
  return user.isSomething && user.isReady;
}

function operate(users) {
  return users.filter(isUserReady);
}
```

This is much more easy to read and to change. Having `filter(isUserReasy)`
communicates directly what that line is doing. We may have simple logic inside
the lambda, but we will still need to read, parse and interpret that in our minds
And sometimes it's not that easy to really _understand_ what's happening.


## Tightly coupled code

Code that _knows_ more than it should is very hard to change and adapt to
change requests. Consider for example a very common thing in Rails applications:
the ability to _easily_ send an email.

```ruby
def process_order
  # ...
  UserNotifier.order_placed(user.email, order).deliver_later
end
```

To understand the problems of this line that seems so innocent, let's consider
some change requests. The first one is: **users can define in preferences
what emails they'd like to receive**.

Now we'd have to go to **all** places where we user mailers and we'd need to
have the user preferences somehow, that we might not even have. We should
obviously now create an abstraction that handles emails and hides those
details.

Then another change request: **we won't do emails anymore, we'll use a tool
for that**. Marketing and product teams want ownership on the emails and want
to build the templates and manage everything. For that they have an app that
receives events, and then they can do everything by themselves.

Ok, so now we have to convert all those mailer calls to something like:

```ruby
def process_order
  # ...
  publish(:order_created, {
    user: user,
    order: order
  })
end
```

And we can create a nice _event bus_ for this and have everything decoupled. But
this refactor may be painful. What data does `UserNotifier.order_placed` used?
We don't know. We'd have to go to that method and associated template and see
if somehow we also need to send information that we're not expecting.

This is a simple scenario where coupling doesn't seem that problematic. But
from experience, but be very troublesome to refactor.

##  Several conditions or loops that mutate variables

I think this is the recipe more close to the concept of spaghetti code.
Basically because when you start this way, it will be harder to step back and
refactor. And you'll have new changes just following that format and things
get messy.

```js
let status;
let error;

if (condition1) {
  status = 404;
  error = "Error 404 detail";
} else if(condition2) {
  status = 403;
  error = "Error 403 detail";
} else {
  if (condition4) {
    status = 402;
    error = "Error 402 detail";
  }
}

// use status and error
```

This tends to get big, and very hard to maintain. Usually whenever we have
a variable being mutated we should be aware and check we if really need that.
The amount of variables available and if they can be mutated contribute a lot
to code that is harder to maintain.

## Switch logic

Sometimes `switch` has a bad rep. But I find it useful on several occasions. I
believe the biggest problem comes from using a `switch` to process logic.

```js
switch(operation) {
  case 'add':
    validate();
    performAdd();
    break;
  case 'sub':
    validateMinus();
    performSub();
    registOp();
    break;
  default:
    error();
}
```

When we have this, we know that several things will happen:

* To change this code we may actually need to read the full method for context
* It's not easy to find the spot to change
* What happens when we need to change several branches?
* It might be useful to add other things here that are similar to `operation`,
  but not quite the same. But because we already have context prepared, we just
  copy paste and go on.
* This will get bigger and bigger

It's very hard to get the full picture and understand changes. We could use
an hierarchy with polymorphism or a map from _operation_ to function. By splitting
the logic we can have a better view of the global picture, while also being
able to dive in a specific operation logic.

# Summary

Writing code that is easy to read and change is very hard. We usually don't
think about that because we're focus on the moment and want to build something.
There are some practices and patterns that can help us to write better code
by default, on the first try. But we need to always be practicing and trying
to improve our coding skills.
