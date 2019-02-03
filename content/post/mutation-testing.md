---
title: "First impressions: mutation testing"
date: 2018-10-31T08:02:20+01:00
draft: false
categories: ["Code Quality", "Testing", "Programming"]
small_images:
- "/img/debates.png"
discuss:
  - ["Twitter", "https://twitter.com/donbonifacio/status/1057564857409638400"]
  - ["Reddit", "https://www.reddit.com/r/programming/comments/9syxz3/first_impressions_mutation_testing/"]
---

<img src='/img/debates.png' style='float:right; width:200px;margin-left:15px'/>

I was curious about [Mutation
Testing](https://en.wikipedia.org/wiki/Mutation_testing) and the value we can
take out of it. So I took an hour to play with it and try to understand it
better.

## What's mutation testing?

In mutation testing we have a program that changes our application's code and
then runs the tests. If no tests fails, it means that we may have a problem. In
practice this means that we don't have a _full_ coverage on that code. This is
not about the typical [100% code
coverage](/post/100-percent-test-coverage/) metric. Because we can have some code
that is 100% covered and still find problems with mutation testing.

<div style='clear:both'></div>
<!--more-->

I picked a small utility module that we have, but that it's used everywhere. The
module already has 100% code coverage. So it was a nice starting point.

I used [Mutant](https://github.com/mbj/mutant) for ruby (see my [interview with Mutant's author](/post/consultant-interview-markus-schirp/)). The first interesting
thing I noticed was that I didn't have a command to run against _the full_
module. The CLI kind of hinted that I should run it against a specific
namespace.

Fortunately my module only has one namespace. When I ran it I got a feeling that
this choice was due to the time it takes to perform the operation. This small
module has a test suite that takes 0.5 seconds to complete. Mutant will run the
tests for each mutation, so even with a fast test suite, it will take some time.

The first run showed that we had dozens of things to improve. This was really
cool. The idea that a working piece of code with 100% test coverage could have
so many problems detected by an automatic tool was very promising.

## Problems that were detected

I spent about 20 minutes fixing the issues and getting all _mutants_ killed. At
the end I got the following output:

```
Active subjects: 0
Mutant configuration:
Matcher:         #<Mutant::Matcher::Config match_expressions: [Result]>
Integration:     Mutant::Integration::Rspec
Jobs:            4
Includes:        ["lib/"]
Requires:        ["result"]
Subjects:        14
Mutations:       442
Results:         442
Kills:           442
Alive:           0
Runtime:         23.55s
Killtime:        68.34s
Overhead:        -65.54%
Mutations/s:     18.77
Coverage:        100.00%
```

The process was not that _agile_. I'd make changes and then would need to wait
~30s to see how I was going.

I can put all the changes I made on two bags: assumptions and fragile code.

### Finding problems with assumptions

I feel that almost all issues found were related with assumptions not being
covered on tests. For example, imagine that we have a function that returns a
[result object](/post/result-based-apis/), with some value and a success flag:

```ruby
def failure(value = {})
  { success: false, value: value }
end
```

And that I'd have a test for the basic usage:

```ruby
context 'when we have a failure result' do
  it 'is marked as failed' do
    result = failure
    expect(result[:success]).to be(false)
  end
end
```

Okay, we have that 100% code covered. But Mutant would change the code to the
following:

```diff
def failure(value = {})
-  { success: false, value: value }
+  { success: false, value: nil } # or self, or false, or ...
end
```

And no test would fail. This was _fixed_ by enforcing the default behaviour on
the test:

```ruby
context 'when we have a failure result' do
  it 'is marked as failed' do
    result = failure
    expect(result[:success]).to be(false)
    expect(result[:value]).to eql({})
  end
end
```

We had _lots_ of scenarios like this. I struggled a bit to understand the value
of these changes. But okay, many times assumptions are the cause of many
problems. And if we don't test those assumptions and make them explicit, we may
have someone changing the assumptions without breaking the test suite, but then
we can have breakages elsewhere.

It does also feel like the code is better tested.

### A problematic example

But there was one _mutant_ that caught something interesting. We have a function
that receives a collection of results and returns _success_ if they all
succeeded. And _failure_ it least one failed. If it failed, we also return the
results that failed:

```ruby
def from_results(results)
  # ... when something failed
  return failure(failed_ones)
end
```

And the test:

```ruby
context 'when we have a collection with one failure' do
  it 'is marked as failed' do
    result = from_results(success, failure)
    expect(result[:success]).to be(false)
  end
end
```

The problem is actually very similar to the previous one. It changed the source
code in the following way:

```diff
- return failure(failed_ones)
+ return failure([])
```

And nothing complained, because we weren't testing the return value. I found
this interesting because this was actual _logic_ that wasn't being tested.
Meaning that someone could make some mistake changing this function, run the test
suite, and be confident that everything was fine. But could be breaking
functionality without being warned of it.

This made me realize that mutant testing can indeed help us produce better code.

## Summary

I created the pull request with this patch as a [RFC](http://localhost:1313/post/rfc-driven-development/)
and brought the [discussion](/post/decision-logs/) to the team. It's true that this brought value, but
we also need to understand the cost: in a very small project it takes a lot of
time to verify it. And this project doesn't have databases or complex logic.

Putting this on every build could make our build times much slower. We could
also only run this every day or every week, but that would not be practical. The
best process would be to use it on development time. When we're working on
something we run Mutant on that part and improve our code.

But if it isn't verified by the build and relies on the developer's discipline,
it may not be enforced as it should be.

And it's quite an investment. I didn't try it on a big module with database
operations. In this regard I feel that mutation testing is a bit like generative
testing. Very specific and useful on some scenarios, but on my day to day
typical work, it's very hard to use and take value from.

I'll try to keep using it and gain more experience with it. Even if this is
something heavy that yields few improvement points, I feel that it brings enough
value to be considered. It's another tool on the quest for [zero
bugs](/post/zero-bug-policy/).

> "I can’t recall ever getting a call to help a department or program get its
> application back on the rails and discovering a nice, healthy unit test
> suite." - [Interview with Erik
> Dietrich](/post/consultant-interview-erik-dietrich/)
