---
title: "We should track our decisions in a decision log"
date: 2019-01-16T09:20:37Z
draft: false
categories: ["Planning", "Executing", "Technical Leadership", "Decision Logs"]
small_images:
- "/img/debates.png"
---

<img src='/img/debates.png' style='float:right; width:200px;margin-left:15px'/>

When we need to make decisions we may schedule a meeting, or start some POC or
just lead by example. We'll need to properly explain our idea, present pros and
cons and communicate it well to all interested parties. A process we've been
using for this is to create a **decision log** document.

This is similar in concept to a [RFC](/post/rfc-driven-development/) but the
semantics are different. While on a RFC the focus is on _how_ we're doing
something and specific details, the decision log is all about presenting ideas
and reach an outcome.

<div style='clear:both'></div>
<!--more-->

Should we use some new technology? VueJS or ReactJS? Should we use a specific
language for that specific service? Should we enforce all pull requests to run
a build pipeline? How many people should review pull requests? Could we change
the sprint duration?

There are always lots of questions and decisions like these. A good way to handle
them is to register them on a decision log and then bring them for discussion.
We're currently using this with good results. This is specially useful on a
remote team with working hours that don't overlap. We need to communicate async
and have everything registered for our future selves.

> My mantra for remote teams is: "What is not written does not exist". -
> [Interview with João Cavalheiro](/post/manager-interview-joao-cavalheiro/)

# The process

When someone wants to discuss a new decision the first step is to create the
decision log document. Giving proper context, presenting pros and cons and
clearly explaining _why_ we need a decision.

This should be [time boxed](/post/dealing-with-deadlines/). And we should summon
all the interested parties. Naturally we may have some people that don't really
_care_ about some decision. But we should also have a [healthy
discussion](/post/how-to-convince-others-that-we-are-right/). The
document should be updated with the feedbacks that other people present.

When we reach the decision time, we should have a proper document that will
explain to future developers (and ourselves) why something was decided.

## Who decides on the outcome?

This depends on who are the main stakeholders. If the decision requires
investment in time or money we may need approval from higher-ups. If this is the
scenario we should adapt the communication. Less technical talk and more focus
on added value.

If the decision is in the scope of the team, we may need to consider power
dynamics. Do we have a _team_ leader that is responsible and _wants_ to decide?
On my teams I usually delegate the outcome for the creator of the decision log.
I will expect all feedback to be taken into account on the decision.

## What about changes to the decision logs?

The great thing of having this document is that we start referencing it whenever
we need to explain something. We may be reviewing a pull request with something
that doesn't comply with a decision log, and we link it for context. The pull
request's author will have all the discussion and clearly understand _why_
something should be followed. An example would be a decision log for adding code
documentation to all _public_ methods, JavaDoc style.

But we may have people that didn't pay much attention on that decision log and
that don't _agree_ with the decision. This is tricky and denotes a problem in
the process. Because this feedback should have been already taken into
account.

When this happens I suggest the creation of _another_ decision log. This may
seem too formal and slow. But having a track record of the timeline of all
decisions regarding some topic should be the main
[goal](/post/importance-of-setting-goals/).

# Tracking results

Having the decisions detailed is great but we can do better. Each decision log
should be a living document and we should revisit it from time to time. If for
example we decide to use a specific database for a specific context, we should
register on the document what ended up happening. For example after the first
month we could write our first impressions. After a year we should register a
review of the solution, and include all that we have learned so far.

This allows us to iterate and improve. Registering our findings will contribute
to our [continuous learning process](/post/learning-index/). If we don't
register this information it will be lost. We may have something that didn't
work out on one scenario, but is hugely successful on another scenario. Having
this on the decision logs will help on understanding the different use cases.

# Summary

I'm going to start registering on the blog several decision logs that I've
created and also the results over time. Topics like:

* Having a formal QA process without manual tests
* Enforcing 100% code coverage on some projects
* Enforcing strict linting rules on the build pipelines
* [Using result based APIs](/post/result-based-apis/)
* Following a zero bug policy

I'll write _why_ I believe some action is important, the pros and cons, and
after some time I'll review those decisions. What were the benefits and the
drawbacks? Would I do it again? How could these decisions be better?

