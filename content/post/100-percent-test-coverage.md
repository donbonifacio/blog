---
title: "Why should we aim for 100% code coverage?"
date: 2018-02-03T17:36:55Z
draft: false
categories: ["Testing", "Code Quality", "Code Reviews", "Programming"]
tags: ["Java", "Javascript", "Ruby"]
images:
  - "/img/onboarding-template.png"
discuss:
  - ["Reddit", "https://www.reddit.com/r/programming/comments/82ef92/why_should_we_aim_for_100_code_coverage/"]
  - ["Hacker News", "https://news.ycombinator.com/item?id=16528733"]
---

I never worked on a project with 100% code coverage. I've worked on several
projects with a high coverage and a test suite that gave confidence to the team.
But even on those projects sometimes we'd have a nasty bug in production that
could have been easily detected with a simple test.

This is a tricky subject and usually developers don't care much about this or
think that it's not worth the cost, or even that is not that useful. I've
gathered here several arguments in favor for a full coverage.

<!--more-->

## What 100% coverage is not

It's definitely not a statement that the program is [without bugs](/post/bug-that-was-not-our-mistake-except-it-was/)
(see [Zero bug policy](/post/zero-bug-policy/) ). It's simply
a data point that states that all lines are covered. It won't detect
[bad code patterns](/post/code-patterns-that-are-a-recipe-for-trouble/) for example.
If we have some part of
the program that is not covered we do know that if something changes we'll
need to perform some manual validation. And we won't be confident that our
changes don't break anything.

On the other hand we can also have low confidence on covered code. We could
have tons of tests and be afraid to push something into production. The truth
is that our tests just cover a predefined set of combinations
and use cases. This can be mitigated with [generative testing](https://www.pivotaltracker.com/blog/generative-testing/)
or [mutation testing](/post/mutation-testing/) but ultimately there's always the chance that we missed something.

## So what do we have to gain?

We have to gain that we know that a new patch won't break scenarios that we assume
that are already correct. Well, this argument is more about having tests than
having full coverage. But with a full coverage you know that the probability
of damaging something that is already working is smaller.

And do consider that sometimes code is broken without the interference of a
human. Imagine a complex merge that changed some logic somehow. Having that
code covered yields a better assurance that we're ok.

When I'm attacking bug issues and I have a bug with an exception, I always
try to change some line on the code, run the test suite, and check if a test
complains. When it does, it's great. Because if I already have a test for that
line I know several things:

* I already have a test with context prepared
* I can replicate the environment/scenario for that bug easily

If I don't have already a test _near_ that problem, I may be into a challenge
to build the specific context that generated the problem. This is usual on code
that uses third party services/components or complex code. It's very hard to
create the context to test, and we neglect on that.

But these are exactly the scenarios where we should really need to create a test.
We all have touched that code that uses PayPal to process payments and it's very
hard to test and uses callbacks and etc. And when there's a bug? We're in trouble.

**If something is hard to test, it will be hard to maintain.**

And hard to maintain translates to poor
[productivity](/post/productivity-index/) and confidence. From my
experience projects with good coverage but not 100% miss the following:

* Complex scenarios that are hard to test
* Simple and basic code that is not important

> "I can’t recall ever getting a call to help a department or program get its
> application back on the rails and discovering a nice, healthy unit test
> suite." - [Interview with Erik
> Dietrich](/post/consultant-interview-erik-dietrich/)

## Isn't 99% enough?

No. Do consider the [broken windows theory](https://en.wikipedia.org/wiki/Broken_windows_theory).
If 99% is good, won't 98% also be good? Specially when we just got an integration
that is complex to test? How do we know if that missing 1% is harmless? Going
back on the previous example, the missing coverage will be:

1. Code that is hard to test, and that's the main reason it should be tested
1. Code that is not that important

From my experience code that _is not that important_ is actually quick to test.
And having that tested _just because_ do allow us to have the maximum threshold.
And stay there.

## Changing code means changing tests

But if we have everything covered that means that _every time_ we need to change
code we also need to change tests - if you put it this way... yes, it's
cumbersome.

But I'm going to put it another way: **start by changing the tests**. Refactor the
tests for the new reality, see that red mark of failed tests and only then
go to the code and work for the green. I do believe this is the best practice.
But I also reckon that sometimes it's just changing a line... and that line
may impact several tests. However I do believe the _pros_ outweigh the _cons_.

## Easy detection of unreachable code

With a full coverage we'll easily detect code that is not being used anymore,
because that code will be marked as not covered. Let's not be looking at some
method and be considering implications on refactoring something that is not used.

There are IDEs that detect unreachable code and warn developers. But even with
those tools I've seen unnecessary code being on the repository. It can be
because of a developer distraction or an automatic merge.

## Tracking statistics

Having more tests can mean a slower test suite and a longer feedback loop to
know if everything is ok. I do believe that we should track the overall speed
of the test suites over time and should favor pure unit tests. Splitting the
logic in pure functions and functions with side effects does help here.

If we have these stats, we can have a picture of how much time is added to the
test suite, per developer, per year and extrapolate that. We can see if the
way we're working now will make the test suite minutes or hours longer in
a year or two. And if it's alarming, we can start right away improving the way
we work.

## Code Examples

Next we have some examples of code blocks that from my experience are more
susceptible of not being fully covered. And some discussion about the
implications of full coverage. The examples are simplified and biased
just to make a point.

### Covering code that is never exercised

I believe this is the bigger menace when having non covered code. It's that inner
condition that it's very rare and we end up not creating a test for it. Example:

```javascript
if (someCondition && anotherCondition) {
  collection.forEach((element) => {
    if (someRareCondition(element)) {
      // operate...
    }
    if (evenRarerCondition(element)) {
      // operate...
    }
  });
}
```

We can have a huge bug here and we're not aware of it. It may only show itself
on rare occasions, on production environment, and users may not even report it.

### Threading

When we have code that uses threads, sometimes it's harder to build test
scenarios and specially to test some edge cases. Consider the following
`shutdownAndAwaitTermination` method that is given by example on the official
Java's [ExecutorService](https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/ExecutorService.html)
class:

```Java
void shutdownAndAwaitTermination(ExecutorService pool) {
   pool.shutdown(); // Disable new tasks from being submitted
   try {
     // Wait a while for existing tasks to terminate
     if (!pool.awaitTermination(60, TimeUnit.SECONDS)) {
       pool.shutdownNow(); // Cancel currently executing tasks
       // Wait a while for tasks to respond to being cancelled
       if (!pool.awaitTermination(60, TimeUnit.SECONDS))
           System.err.println("Pool did not terminate");
     }
   } catch (InterruptedException ie) {
     // (Re-)Cancel if current thread also interrupted
     pool.shutdownNow();
     // Preserve interrupt status
     Thread.currentThread().interrupt();
   }
 }
```

* Should we test what happens when `shutdown` takes more than 60 seconds? **Yes.**
* Should we test what happens when `shutdownNow` takes more than 60 seconds? **Yes.**
* Should we test when the _shutdown_ flow is interrupted? **Yes**.

And why? Because sometimes our code will be interrupted on some weird situations,
and sometimes things take longer than expected. And we want to know that our
system remains in a correct state on those occasions.

### Typos on dynamic languages

This is common on dynamic languages like Ruby or JavaScript. It's an innocent
mistake that can be easily caught with code coverage. Check out this example:

```ruby
def cached_organisation
  if defined? @organization
    @organisation
  else
    @organisation = slow_fetch_organisation
  end
end
```

Can you spot the error? Could you spot the error if tired? Naturally there are
ways to do things that bypass these problems. But this shows how a simple
coverage metric could show problems on code. And those problems could actually
be undetected for a long time without it.

### Covering code that will never run

It may be rare but sometimes we have code that _will never run_. And we know it.
Notice this example:

```java
public void process() {
  try {
    final URL url = new URL("https://wikipedia.org/");
    solidMethod(url);
  } catch (final MalformedURLException e) {
    throw new RuntimeException(e);
  }
}
```

The exception will never be caught. But we should handle it, unless we're
willing to handle it upstream. On this situation, do we really need a test
to simulate this exception just for coverage?

I'll ask the question in another way. How much complicated and time consuming
is to write a test for this edge case? I'd say that it's pretty fast and
effortless.

And we have the advantage that if in the future we actually have this method
with an invalid URL, we have an example of how it will behave.

### Necessary unrelated boilerplate

We may have to deal with boilerplate that is not directly associated with
the logic that we are testing. And we may need to have that boilerplate on
many places. Consider for example code that interacts with a database:

```java
public void save(final Model model)
  final DatabaseConnection connection = connectionPool.getConnection();
  try {
    connection.startTransaction();
    final Model freshModel = connection.queryFetchAndBuildModel();
    verifyVersions(model, freshModel);
    connection.update(model);
    connection.commit();
  } catch (final DatabaseException ex) {
    logger.error("Error getting model with id {}", modelId, ex);
    connection.rollback();
    throw ex;
  } finally {
    connectionPool.returnConnection(connection);
  }
}
```

Having full coverage on code like this means that, for every method that
uses that `connectionPool` we need to build a test that simulates an
exception.

We can however create an abstraction for this usage:

```java
// new method at connection pool
public void withTransaction(final Consumer<Connection> consummer)
  final DatabaseConnection connection = connectionPool.getConnection();
  try {
    connection.startTransaction();
    consumer.accept(connection);
    connection.commit();
  } catch (final DatabaseException ex) {
    logger.error("Error running transaction.", ex);
    connection.rollback();
    throw ex;
  } finally {
    connectionPool.returnConnection(connection);
  }
}

// simpler usage
public void save(final Model model)
  connectionPool.withTransaction((connection) -> {
    final Model freshModel = connection.queryFetchAndBuildModel();
    verifyVersions(model, freshModel);
    connection.update(model);
  });
}
```

With this approach we can have unit tests that verify the behaviour of
`withTransaction` and we don't need to do that on every test that uses
`withTransaction`. Note that on this example the _log_ message actually lost
context. How to keep that context is left as an exercise for the reader.

### When it's just a minor branch

Continuing with the previous example, imagine that we have an earlier
condition to bail out:

```java
// simpler usage
public void save(final Model model)
  connectionPool.withTransaction((connection) -> {
    if (invalid(model)) {
      connection.rollback();
      return;
    }
    connection.update(model);
  });
}
```

That `if` branch can be very innocent. But we know that even if we call
`rollback` inside, the `withTransaction` will still call `commit` outside.
We should have thrown an exception here.

And this is the type of bug that is very hard to detect even in tests. Because:

* we may mock and test things around it
* we may not go in detail on our integration tests
* we may use a database engine that doesn't mind a `commit` after a `rollback`

But then, some day at the database engine used at production, we have an
exception: _"You may not commit after rollback"_.

This will be an easy fix. But we'll be wondering how many more problematic
code paths we have on our code base. Bottom line: if we support several
database engines, we should run the full test suite against _all_ of them.

### When not all possible scenarios are covered

We can have code that is already full covered for a specific context, but not
for all contexts. If we had a library that handles i18n tokens and we were
going to test that all available keys have a non empty string as value:

```javascript
// library
const tokens = {
  "en": {
    "name": "Name",
    "age": "Age"
  },
  "pt": {
    "name": "Nome",
    "age": "Idade"
  }
};

function localize(lang, token) {
  return tokens[lang][token];
}

function getAllTokens(lang) {
  return tokens[lang];
}

// test
describe("language tokens", () => {
  test("should have non empty strings as values", () => {
    getAllTokens("en").forEach((key, value) => {
      expect(value).toBeNonEmptyString();
    });
  });
});
```

In this case we already have 100% code coverage but we should perform the test
for each defined language. Dynamic languages can make this easy because we
can dynamically generate tests.

```javascript
// test
describe("language tokens", () => {
  ["en", "pt"].forEach((lang) => {
    test("should have non empty strings as values for language: " + lang, () => {
      getAllTokens(lang).forEach((key, value) => {
        expect(value).toBeNonEmptyString();
      });
    });
  });
});
```

### When you have several filtering conditions

This one is related to the previous example. We could have already covered
code that is not fully exercised. For example, imagine that you have coverage
for:

```ruby
def search
  return if something? || something_else?
end
```

If we have a test that prepares `something?` we can have line coverage here.
There are tools that also check for branch coverage and would detect that
`something_else?` was not tested. But if we don't have branch coverage this
could actually be forgotten.

Here's another example that the tooling wouldn't catch:

```ruby
Client.where(active: true, ready: false)
```

This will build a dynamic SQL query. Having line coverage here is different
than testing if the code behaves properly using `active`, then using `ready`
and even using a combination of the two.



### When you need to add tests just because of tooling

Sometimes you may have code that is already covered but that the tooling that
you use does not detect it. For example, consider a React component with a
render method like the following.

```javascript
render() {
  return (
    <div ref={(componentRef) => this._componentRef = componentRef} />
  );
}
```

Ideally you would extract that lamdba to an external function call. But like
it is, you could have tests that already cover that line but tooling that
does not detect it.

And you would need to create a specific test just to mark that as covered:

```javascript
describe("render", () => {
  test("should trigger refs", () => {
    const root = mount(<Component />);

    expect(root.getDOMNode()).toBe(root.find("Component").getDOMNode());
  });
});
```

Again, we can make a test function that handles that, and we can call it
easily and directly whenever we need.


```javascript
function smokeTestComponentMount(component) {
  const root = mount(component);

  expect(root.getDOMNode()).toBe(root.find(component.displayName).getDOMNode());
}
```

And then:

```javascript
describe("render", () => {
  smokeTestComponentMount(<Component />);
});
```

## Summary

There are many advantages on having 100% cove coverage, but that can mean
more work and be heavy on the development process. I do believe that a patch
that has tests that fully cover the changes have more quality and we should
aim for that. It may be hard, we may need to learn new ways to work, and we
may need to question our beliefs.

But I'm sure that it will make us better software craftsmen.
