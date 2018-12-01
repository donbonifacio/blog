---
title: "Zero bug policy"
date: 2018-10-23T18:00:39+01:00
draft: false
categories: ["War Stories", "Ramblings", "Technical Leadership"]
small_images:
- "/img/values-and-habits.png"
discuss:
  - ["Twitter", "https://twitter.com/donbonifacio/status/1056074993698791424"]
---

<img src='/img/values-and-habits.png' style='float:right; width:200px;margin-left:15px'/>

Bugs are a tricky subject. We all write code with bugs and they have a
considerable impact on our
[productivity](/post/productivity-index/) and on the value added by our
deliverables. So we come up with several strategies to _handle_ the bug stream
and have a ongoing effort to balance bug house keeping and new features.

I'm a big advocate for a **zero bug policy**. This means that we should
_usually_ have 0 registered bugs. Whenever I present this idea I'm met with
skepticism. This is seen as an utopia and not possible. My impression is that
developers interpret in a way that would generate _punishment_ when new bugs are
added.

But that is not the point. The point is to embrace that we'll always have bugs,
but also aim for a process that will minimize as much as possible the amount of
bugs we produce. This will make us leave our [comfort
zone](/post/comfort-zone-index/) and question our
[beliefs](/post/how-to-convince-others-that-we-are-right/).

It's not about _"writing code that never has bugs"_. It's more about _"what do
we need to change in our day to day work to minimize bugs"_.

<div style='clear:both'></div>
<!--more-->

## Game plan

First we need to **decide** that we're going to do something about the bugs. Then we
can plan for it. But if we don't have the team committed to this, it will be
harder. Step by step we can make small changes that will help us in controlling
the bug stream.

### 1. Always address the root cause

This is mostly common with bugs related with bad data. There was a bug that
somehow _created_ invalid data on the database. So the bug report focuses on
fixing that data. We can go to the database and simply correct the data and the
bug is solved.

But that won't fix the root cause. Meaning that we'll have more bugs related to
the issue. We need to find and address the root cause _first_. This means time
investment. And sometimes it's not easy to find it and fix it, specially when
we're dealing with concurrency issues. But fixing the bug source once and for
all should be our main objective.

### 2. Can't solve it? Instrument

Sometimes we can't find the root cause, because we lack context or additional
information. We can try to contact the customers that had the bug and try to
understand what they were doing at that time.

Another approach is simply to identify _where_ the bug is happening and
instrument the code. We can add more logs or [enhance the error messages](/post/code-patterns-that-are-a-recipe-for-trouble/#exceptions-without-context). So next
time we have that bug we'll have more material to help us fix it.

### 3. Really fix the bug

All patches that fix a bug should have a [test that covers the
bug](/post/bug-that-was-not-our-mistake-except-it-was/). This
regression test will make sure this doesn't happen ever again, even if somehow
we mess up somewhere else. These tests can be very hard to write. It's an
investment. It can be just a unit test or we may need to create a flow that
launches the app and with side processes does some heavy loading looking for
concurrency issues.

We should also add proper documentation to the test, explaining what was
happening and what was our approach.

> "I can’t recall ever getting a call to help a department or program get its
> application back on the rails and discovering a nice, healthy unit test
> suite." - [Interview with Erik
> Dietrich](/post/consultant-interview-erik-dietrich/)

### 4. Bugs on design phase are easier to solve

If we can detect bugs before starting development, that would be ideal. This is
part of the process of aiming for zero bugs. We try to find strategies to
prevent bugs and we try them out.

One strategy is to have a [RFC development
process](/post/rfc-driven-development/) and have it peer reviewed.
Bonus points if the QA squad contributes to that review.

### 5. Transform bugs in features

We need to properly categorize bugs. If a bug fix is something big, or if the fix
requires complex changes on the product, we should _close_ the bug and create a
proper feature to address it.

Going for zero bugs, means zero bugs impacting the users. It doesn't mean
solving all the product problems, and we need to separate those concepts. We'll
always have improvement points and problems to solve. But we can aim for zero
bugs.

### 6. Retrospectives for bugs

If we are having a flow of specific bugs, if we delivered a new feature and the
bugs spiked, we need to do a retrospective on what happened and how it could
have been prevented. It's an iterative process.

We may fail several times at it and it will question our processes. But it's
very important to [learn](/post/learning-index/) about what we're doing wrong and make it better.

### 7. Everyone is responsible for the quality

In some teams we have a QA squad that is responsible for testing the application.
I don't believe this is the best approach. I believe that all developers are
responsible for delivering bug free code, and for testing it. QAs should be
responsible for making sure that everything is okay, and that is not just
tests. It's much more.

Also, having the QAs doing tests usually creates a ping pong that is not
productive:

1. Developers create a feature and change code, submits it for testing
1. The tester finds bugs, send the feature back
1. Go back to 1)

This is not ideal and we need to be careful and try to minimize as much as
possible this flow.

### 8. Elect a bug groomer

We should have a designated _bug groomer_. Someone that is responsible for
reviewing all new bugs. The groomer will properly categorize them and maybe even
convert them to features of improvements if that makes sense.

Usually, I advocate for the QA team to be encharged of the bug grooming. They
have a wider context and ultimately they are responsible for making sure that
the applicant is without bugs.

### 9. Beware of the dark support vibe

Doing support and being responsible for fixing bugs can be daunting. We may experience
the frustration of our customers. Day after day dealing with problems and
feeling bad by the impact we're having on our customers can be a heavy burden.
It will impact the developer's
[satisfaction](/post/satisfaction-index/).

This is a reason to rotate the support developers. But ideally we'd be able to
switch the focus of the support squad from fixing bugs to making improvements.
Having zero bugs, will mean that all the time is allocated in making us perform better.

### 10. We should fix bugs right away

Sometimes we don't have anyone allocated to bugs. We may receive bug reports and
_schedule_ them to be fixed on _the next sprint_. This will add a huge delay to
the solution and can be troublesome. We should aim to fix the bugs right away
and don't let them stack.

### 11. Consider other testing methodologies

Having confidence in our test suite is very important. But there is always some
bug on an edge case we're not considering yet. We can be
[reactive](/post/reactive-proactive-forecasting/) and fix it
with a regression test when it is registered. But we can also try to find those
scenarios with other techniques.

We can see if we can take value from [generative
testing](https://en.wikipedia.org/wiki/QuickCheck) or [mutation
testing](/post/mutation-testing/).

### 12. Take care of the test suite healthiness

If we have long builds it will impact our confidence and our productivity. We
should aim for a maximum build time. This will depend on several factors. For
some teams 20 minutes is too long. For other, 2 hours is acceptable.

We can create mechanisms to improve this, for example to detect what _modules_
were changed and just test them and their dependencies. Having a 2 hour build
running because we changed some markdown documentation is not that useful.

Flaky tests are also very problematic. We need to invest on fixing them, and
even consider them bugs.

### 13. Embrace immutability and pure functions

Functional programming has several techniques that harden our code and make it
more robust. Embracing immutability means that we're removing the possibility of
a full class of bugs.

Using pure functions allow us to create code that is easier to test. If the code
is easier to test and to maintain, we may argue that we'll have less bugs.

### 14. Beware of integrations

When we depend on a service from another squad, the integration is almost always
troublesome. We have assumptions that are put to the test and fail almost every
time. We should manage this risk and try to integrate as soon as possible, and
maintain a healthy communication channel with the other squads.

We can focus on contract based testing, or start to plan right away integration
tests.

### 15. Track runtime exceptions

Usually bugs are reported by the users. But we an be more proactive regarding
that and register every runtime exception/error. There are several tools for
that. Because many times users don't complain at all and we end up not knowing
all of our problems.

A great user experience related to bugs, is when a customer experiences a bug,
having someone from our side contacting them: _"We noticed that you experienced
some problems with the application. We've adddressed and fixed them. Could you
try again?"_.

Let's try to do this before they file a bug.

## Success stories

I was able to _implement_ this policy a couple of times already. It's something
that usually takes some time. We need to change our habits and work towards that
[goal](/post/importance-of-setting-goals/). It's not easy and requires discipline and a plan.

### Typical SaaS project

I worked on a project that had [many quality
issues](/post/project-no-one-wants-to-work-at/). That resulted in several
bugs being registered every day. The project also had an awesome _support_ squad
and mindset. Meaning that all bugs would somehow affect the support squad and
the development team. At some time we had 2 developers doing full time support
work. This was very frustrating work and no one wanted to do it.

So we rotated every two weeks. That gave us a nice balance between fixing things
and building new things.

Some day we decided that we'd need to stop this. It made us reconsider all our
quality practices. Just by _deciding_ that we would have a controlled bug
intake, we started to change our processes and way of work. Week by week we
managed to decrease the bug flow to a point where we didn't require a full time
developer.

I eventually left this team, but when I met them for lunch a year later I was
joking around with one of them and said: _"Damn, for that you should go to the
support duty another month"_. And they replied: _"Oh, we don't have that
anymore. We do have bugs from time to time but it's very calm now"_.

### Deploys and downtime

On another project, it was common to the have [application down](/post/production-incident-training-program/). Deploys added downtime and we
had some issues that made the app unresponsive and forced us to perform new
deploys. This was impacting our delivery speed. The first step was starting to
track the amount of times we were down and the amount of time. The data showed
us that we had a problem.

We started to question our process and consider improvements to it. Sometimes it
only took simple patches to make improvements. Other times we actually had to
invest in new features and improvements to improve the healthiness of the
application. All this was after we settled for a process with incident reports
and [postmortems](/post/postmortem-culture/), where we discussed what would be necessary to fix issue by
issue for good.

After this hardening period, we managed to have 3 sprints without **any**
downtime. But that was not it. When we started to have no downtime issues, we
focused on the next level: SLAs for bugs.

The work is never done, but we can always aim higher.

### Long lived branches

On another team I had, it was usual to have a very well defined quarter. We'd know
exactly what we'd need to deliver on the next months. Usually the features would
take at least one month to implement. In our flow, we would create a long lived
branch per feature and each squad would work on their feature in isolation.

When the features were finished, we'd merge them upstream, and the QA squad
would do their tests and quality flows.

The problem was that the upstream merge was always problematic. The first ones
to merge were okay. But the other ones would have to deal with tons of conflicts.
We'd actually need to invest days in doing the merge. And then more days to fix
the bugs that were introduced by the merges.

This is actually not a success story.

I was unable to motivate the team to
change our process. Sometimes we're doing things for years and it's hard to
question what we do and aim to change. Sometimes we believe that what we're
doing _is the best possible, even if it has flaws_. And so we settle for it.

There are several changes we could do to minimize this specific problem. Maybe
they wouldn't solve everything, or maybe they would introduce new problems. But
without that iteration process we wouldn't be able to be better.

## Summary

I don't think that a zero bug policy is a silver bullet and that everything
starts to work great and we start having bug-free code. But I do believe that if
we **decide** to have no bugs, that our processes [will be much
better](/post/work-smart-vs-work-hard/) and that
we will in fact experience less bugs. And that will give us time to build new
things and to make improvements to our code base.

It's a roller coaster of good practices that starts with a simple decision.
