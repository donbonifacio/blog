---
title: "That project where no one wants to work at"
date: 2018-03-30T10:10:46+01:00
draft: false
categories: ["Leadership", "Frustration Debt", "Ramblings", "Code Quality"]
images:
  - "/img/project-no-one-wants.png"
---

<img src='/img/project-no-one-wants.png' style='float:right; width:200px;margin-left:15px'/>

There are projects that one one wants to work at. There could be many reasons
for that and I list here some that I've seen. Being aware of these problems
is the first step to start fixing them. And most importantly, by being aware
of these problems we can start from day one implementing processes that prevent
these kind of things from happening.

<div style='clear:both'></div>
<!--more-->

## How is that project defined

### Low quality

Usually these projects are defined by overall low quality: on the code base,
on the tools and processes and maybe on some members of the team. Sometimes
it's very hard to prevent low quality if we're aiming for very fast time
to market. This coupled with less experienced developers, harsh
[deadlines](/post/dealing-with-deadlines/) and a bad leadership
is a recipe for failure.

We may not see problems at the beginning. The team may seem to go fast and
delivers on time. But all that tech debt will start pilling up and will affect
the team's productivity and healthiness.

Sometimes we do need to rush do deliver something. But we should not allow the
team to grow a mindset of get things done no matter what. Because that will
be very hard to turn around.

Be very careful with [code patterns that are a recipe for trouble](/post/code-patterns-that-are-a-recipe-for-trouble/).

### Lots of bugs

With low quality usually we have lots of bugs to attend to. We start to have
our bug tracker filled with bugs and lots of complaints and start to have some
clashes with the support crew.

Having blocker bugs in production that affect
clients is always frustrating and we start spending more time on bug fixes
than on features and improvements. We need to be very careful not to get on this
spiral.

### Very complex, lack of context, hard to maintain

Complexity will mean that code is not easy to change or fix. We may have lots
of code copy pasted and changing on one place means changing on several places.
Naturally we will forget some place and may only be warned by some angry customer
in production.

Usually we also don't have documentation stating why things are the way they are.
So it's very difficult for a developer new to a part of the code base to
understand what's happening. This brings risk and slows down development.

We may only get this in parts of the project, like that payment processment
module that no one understands, and no one knows how it works and the developer
that implemented it left the company 2 years ago.

See [developer speed versus team speed](/post/developer-speed-versus-team-speed/).

### Very bad reputation

Developers on other projects are aware of the bad reputation and refuse to
work on the project. They may not know what are the challenges or the problems
but even so that bad rep will spread all over the place.

This will start a negativity spiral around the project. Other developers will
say bad things and criticism will be easy. This will frustrate the current
developers because the project and themselves may actually be the target of
mockery.

This usually starts with teams that interact directly and that depend on that
project. Even without context it's easy for someone to reply to an email
or go to slack and say something like: _that new release is very bad, full
of bugs, they did an awful job_.

The truth is, sometimes that was the best possible.

### No test suite

Not having a test suite on these kind of projects means that every change we
make has a very high risk of breaking things. And we may only know about that
when we push to production. We may have developers that don't think that tests
are valuable and that fight against them.

There's also the idea that tests add to the development speed and are
cumbersome. But it's not just the development speed we need to consider. The
time we spend in QA fixing bugs and the impact of bugs in production should also
be accounted for.

And sometimes we do have a team of developers that know all the project and
the implications of every change and can maintain an application without tests.
This breaks when we add someone new to the team. It's easy for someone to
make assumptions and change things that shouldn't be changed. And without tests,
it's easy for those problems to impact production.

> "I can’t recall ever getting a call to help a department or program get its
> application back on the rails and discovering a nice, healthy unit test
> suite." - [Interview with Erik
> Dietrich](/post/consultant-interview-erik-dietrich/)

### Very slow feedback loops

Even if we have a test suite and a CI pipeline, having one that takes lots of
time (hours) will impact the velocity of the team. The team should set the
maximum time for feedback and try to have the CI pipeline bellow that. When
we submit a patch, ideally we want to know if everything is ok on the next
minute. But this can be tricky if we have a slow test suite or lots of
integration tests.

If we need to wait, we have two options:

* We just wait, not doing much else
* We context switch and start doing other things

I've seen developers with 2-4 _patch threads_ just because of this. And it starts
to affect their speed and ability to reason about what they're doing.

We can also have manual validations. This can add to the feedback slowness and
we need to be careful with it also.

### It's a mystery how to setup and deploy

This is when you need a couple of days and the help of your team members to put the
project working on a new machine. Usually because there's always specific context
and patches, or some tricks you need to perform. This is very frustrating specially
when current developers get a new machine or when you need o upgrade your machine
and are afraid that it you'll need days to get back on track.

This goes hand to hand with hard to deploy mechanisms. If we don't have an
automatic way to deploy artifacts we'll have to do it manually and that's always
error prone. Sometimes we actually don't know how to deploy. This can happen
on smaller services that are deployed once, and then we only need to do a fix
a couple of months later:

* Where is the service running?
* What kind of machines and services does it use?
* How do I update it?

### Problematic team members

We may have one ore more team members that are problematic and that no one
wants to work with them. Could be because they like the way things are going
and don't want to improve the quality/experience of the project. Or because
they have a strong clashing personality and [rule all the
decisions](/post/how-to-convince-others-that-we-are-right/).

They can also be technically excellent but generate a bad mood.

### Old or not sexy tech stack

Having a project that has an old stack means that the dependencies are old
and that an upgrade will be very complicated. So that upgrade never happens.
This means that if we want to use new dependencies for something, we may not
be able because the project is too outdated.

The used language/framework may also stop having support and new patches.

This is bad specially for hiring, because developers consider their careers
and the added value of developing on old stacks is not that good. And current
developers will also start to consider if they're loosing track of new things
and what's their market value.

## How to turn the ship around

### Face the problem

Understanding and listing the problems is the first step. We need to be
concious of the problems and start to make a plan to fix them. All these problems
impact the recruitment of talent and affect the time developers want to stay
at the project. If we think about it, having developers on these kind of projects
that are ok and don't want to move, is a big red flag.

We need to go step by step. Knowing the team's biggest pains allows us to know
what adds more to the frustration and we can add motivation to the team if
we give them resources to fix them.

### Allow developers to make a plan and fix things

If we are fortunate enough, we may have developers that really want to fix
things and turn the ship around. We need to invest in that, we need to provide
them with resources (usually time) and let them come up with a plan to fix
things. We need to be careful not to plan for the long term, but to break the
plan and advance patch by patch.

This will balance the frustration with developing with the _bad_ problems and
the motivation of fixing and implementing the _good_ parts of the system.

### Turn the ship around

Here's the [goal](/post/importance-of-setting-goals/):

* Let's make that project no one wants to work at a reference project where
  _everyone_ wants to work at

This is actually a huge accomplishment and if we're lucky to have a team that
is willing to make this happen, they will be very fulfilled then they reach
that goal.

We do need to be careful with the size of these improvements. Improving code,
tooling and processes is great but not for a _very_ long time. Developers may
forget about [their drive](/post/satisfaction-index/) and realise that it's just too much for them to
change, and start considering their future.

The full team needs to be aligned on this. Having part of the team that falls
back to previous practices will cause discussions and frustration.

### How to prevent this?

This should be our focus. Sometimes it's not easy to see these problems coming
and when we realise it's already too late. What can we do about this?

* **Go for a [zero bug policy](/post/zero-bug-policy/)**: all bugs should be resolved right away. If
  something is not that important, should be removed from the bug tracker and
  moved somewhere else (product backlog?).
* **Use quality inducing techniques**: like code reviews or pair programming.
* **Use linters**: let's make sure that all the code base follows the same
  guidelines and that we don't have different developers with different
  styles contributing to a mess of a code base.
* **Regular 1on1s**: perform regular 1on1s with the team and try to detect
  problems before they arise. There are indicators that predict problems and
  this is the place to gather them (see [my framework for 1on1s](/post/1on1-framework/))
* **Measure the time to do things**: for example, if we measure how much time we increase
  on the unit tests per month, we can estimate how much the test suite will
  take in a couple of years. If that's problematic we can start changing the way
  we do testing right now ([should we aim for 100% code coverage?](/post/100-percent-test-coverage/)).
* **Make deploy instructions mandatory**: every project should have instructions
  on how to deploy and about the environments. Ideally we should have the
  deploy commands automated.
* **Document application flows**: specially the most complicated ones. Assume
  that someone new will join the project. How can she or he understand what's
  happening and be able to change and improve it?
* **Try to regularly upgrade dependencies**: This can be troublesome and we may
  need to invest time in upgrading that dependency with breaking changes. But
  if we don't do it sooner, we'll never do it later. Also, try to minimise
  dependencies.
* [We need to learn how to work smarter](/post/work-smart-vs-work-hard/).
