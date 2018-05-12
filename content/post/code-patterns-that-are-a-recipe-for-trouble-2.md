---
title: "Code patterns that are a recipe for trouble (part 2)"
date: 2018-05-12T08:35:56+01:00
draft: false
categories: ["Testing", "Code Quality", "Code Reviews"]
tags: ["Java", "Javascript", "Ruby", "Clojure"]
images:
  - "/img/bad-code-patterns.png"
---

![Bad code patterns](/img/bad-code-patterns.png)

In [part 1](/post/code-patterns-that-are-a-recipe-for-trouble/) we went through
several patterns related with writing code that is more maintainable. This article
focus on code patterns in testing and also concerning readability and style.

<!--more-->

# Testing

## Using sleep in tests

Using `sleep`s in tests is very troublesome. We usually use `sleep` when we
need to wait for some _async_ operation and we don't know when it is going to
be finished. This yields two problems:

* We'll need to wait more time than required, just to be safe
* We may wait less time than was necessary, and we have a flaky test

So, how to know what is the best sleep time? Let's consider the following
example:

```java
@Test
public void testSocketConnection() throws Exception {
  final Connector connector = new Connector();
  connector.start();

  Thread.sleep(1000);

  assertTrue(connector.isRunning());
}
```

Now, from my experience, this test will **always be flaky**. It may work 99%
of times, but there will be a time where it will run on some slower machine that
is doing other things, and the `connector` won't be ready after that delay.

And this compounds. We start having several tests that use `sleep` and we may have
a test suite that spends minutes just sleeping. And the probability of having
one test that is flaky starts to increase.

On these scenarios we should have a way to know when the resource is ready. This
can be tricky to implement. Even conceptually: do we need to add code specifically
to use on tests? Isn't that an _antipattern_? Well, it is. But I like to try to
transform this in a feature. For example, in this scenario we can improve our
`Connector` class to allow it's clients to know when it is ready to operate.

```java
@Test
public void testSocketConnection() throws Exception {
  final Connector connector = new Connector();

  final Future isReady = connector.start();
  isReady.get();

  assertTrue(connector.isRunning());
}
```

## Tests without a description

In some languages is not that common to have a description on the test. For
example, in Ruby I almost never saw it. But when I went from [Ruby to Java](/post/from-rails-to-clojure-to-java-to-rails/)
I noticed that they always added proper descriptions to the tests and I really
started to like it.

Why is that important? We may have tests that do lots of things. And while we
can always read the test and understand _how_ it works, it may be difficult to
know _why_ the test exists and _what_ it does. This is particularly important
when we change some code and we have a test failing and we don't know why.

And at that time we'll need to understand what a test is doing.
Having a proper description really helps.

```js
describe('Payment flow', () => {
  //  Scenario:
  //    - Given
  //      * condition 1
  //      * condition 2
  //    - When
  //      * something happened
  //    - Then
  //      * Expect an error
  it('failed credit card', () => {
    // ...
  })
})
```

## Tests that have duplicated code blocks

Some tests are more prone to this if they test that objects are in a state
that we expect. And if we deal with some lists, we will just copy paste some
blocks. For example:

```ruby
test 'an object is in a state that we expect' do
  model1 = # ...
  model2 = # ...

  # Test for model1
  expect(model1.prop1).to eql(1)
  expect(model1.prop2).to eql('2')
  expect(model1.prop2).to eql(3.0)

  # Test for model2
  expect(model2.prop1).to eql(1)
  expect(model2.prop2).to eql('2')
  expect(model2.prop2).to eql(3.0)
end
```

This code pattern will make other developers with changes to copy paste it
to new tests. This is error prone because we may neglect to change something. And
if by any change our props change, we'll need to change everywhere.

Because of this I usually advocate for testing utilities that wrap common
testing blocks.

```ruby
test 'an object is in a state that we expect' do
  model1 = # ...
  model2 = # ...

  expect_equal(model1, prop1: 1, prop2: '2', prop3: 3.0)
  expect_equal(model2, prop1: 1, prop2: '2', prop3: 3.0)
end

def expect_equal(model, props)
  props.each_pair do |key, value|
    expect(model.send(key)).to eql(value)
  end
end
```

## No test class for simple classes

This one is really close to home for me. I may create a simple class that
has some logic. That logic may come from a refactor from another class, and
may already be [fully covered](/post/100-percent-test-coverage/). So I don't
feel the need to create a new test class for it, because I'm being lazy.

The problem is that somewhere down the line I'll have to change something related
to that class. And as usual I'll go for the test class to create a scenario and
will be very annoyed then that class doesn't exist.

If I had already created a test class, with proper examples and easy to understand,
I would have saved precious time for future me.

# Readability

We spend a lot of time reading and interpreting code. Many times I think it's
more productive to be more descriptive and go for code that is easier to
understand.

##  Ifs with multiple conditions or negated conditions

As a rule, whenever I have an `if` condition with more than one _test_, I'll
move that into a properly named function. For example:

```js
if (user && (user.status == 'active' || user.status == 'lead' )) {
  // ...
}
```

To:

```js
if (isSuitableForCampaign(user)) {
  // ...
}

const isSuitableForCampaign = user =>
  user && (user.status == 'active' || user.status == 'lead' )
```

I reckon that sometimes I'm lazy to do this. But the truth is: the code is
much more easy to read and understand and it's so much easy to unit test that
`isSuitableForCampaign` function.

If I need a `!`, I'll also try to move that info the function. And something
that I find very hard to read and always need to stop a little to understand
is related with using `unless` in Ruby.

```ruby
def operate
  return false unless a != b || c
  # ...
end
```

With just one condition I find it ok, but with more than one it's harder to read.

## Variable names at dynamic languages

In dynamic languages we don't have types and it's very useful when we convey
some meaning into the variable names. On the other hand it's troublesome when
we have names that convey a different meaning.

```js
function operate(status) {
  // ...
}
```

What's `status`? I'd say it's a `string`. But we may receive instead
`["active", "old"]`. So the name should have been `statuses`. Having names
in plural hints that we receive a collection.


# Style

This is very opinion-based, and I understand that the following topics are
prone to discussion.

## If without braces

Or even a `for`. Example:

```js
if (condition)
  something();
```

There are many arguments pro and against this. I do believe that removing braces is
more error prone. You can have code like:

```js
if (condition)
  something();
  somethingElse();
```

We may argue that this is easy to spot. But there are [famous bugs](https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/)
because of code like this. Sometimes we're tired and don't see things properly.
Or this could also be the result of a complex automatic merge.

But mostly I like the braces for consistency. If I use braces most of the time,
my brain starts to detect those patterns. Whenever I see an `if` without them,
my brain detects a weird pattern and I have that small delay in stopping and
understanding what's happening.

There are languages without braces like Python where this isn't an issue. But
on those languages our brain is already used to that. So I go for the most
common approach and try to be consistent.

## Ternary operator

I'm usually against using the ternary operator. Again it's mainly for consistency.
This may be harder to argue in languages where `if` doesn't return anything,
like Java and Javascript.

```js
function getOperation() {
  // ...
  return options.operation ? options.operation : 'noop';
}
```

We can ignore the _"ternary is a bad thing"_ and focus on: _"can we make this
better?"_

```js
function getOperation() {
  // ...
  return getOrDefault(result, 'noop');
}

function getOrDefault(result, defaultValue) {
  if (result.operation) {
    return result.opeation;
  }

  return defaultValue;
}
```

More verbose, but the `getOperation` is now easier to read and understand. And
we have a nice _pure_ `getOrDefault` function to test. Some say that a line
should do only one thing. And the ternary does several. It may be easier and
faster to write, but for being better to understand, sometimes if we replace it with a
a properly named function is better.

And what about just using the ternary on that `getOrDefault`? I'll go for
consistency here, but honestly I don't have a strong argument. I might
argue that it's easy to have a ternary that becomes more complex over time.
But again, we can have bad practices even without ternaries.


## Non functional style code

I'm a fanboy of functional programming. Representing want we're trying to achieve
in a declarative way brings several advantages. We can focus on what is being
done instead of how it's being done.

```js
let collection = [...Array(10).keys()];
let sum = 0;
for (let i = 0; i < collection.length; ++i) {
  if (odd?(i)) {
    sum += i + 1;
  }
}
```

We actually need to read everything and try to understand what is happening.
Another approach would be:

```clj
 (->> (range 10)
      (filter odd?)
      (map inc)
      (reduce +))
```

We spend a lot of time reading and interpreting code and there are things that
make our interpretation harder. If we have several variables to account for,
if the variables are mutable, if they are used on several scopes, etc. With
a more functional approach we limit all these factors.

## Good commit messages

This is not a code pattern... but it's something associated with creating
code blocks. It has happened a lot to me to see a line of code where some
bug is and I'm not able to understand what's happening. Then I'll do a _blame_
to see the commit message and I'll just get _"Fix bug"_. Or it's a line
on a huge patch of unrelated things.

It's very important to have commit messages that explain _why_ the commit
exists. Sometimes it's obvious, but other times we might waste a lot of
time because no one has context on that anymore.

I always advocate for following these [commit message guidelines](https://chris.beams.io/posts/git-commit/).


# Summary

Some items on this article may be debatable. And that's okay. We should always
question our beliefs, reach a common ground, or learn new techniques or
different points of view. There's no right or wrong. There's only
improvement points.
