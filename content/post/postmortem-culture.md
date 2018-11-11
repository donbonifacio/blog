---
title: "Postmortem culture"
date: 2018-11-14T08:33:20Z
categories: ["Utilities", "Postmortems"]
draft: false
small_images:
- "/img/production-incidents.png"
---

<img src='/img/production-incidents.png' style='float:right; width:200px;margin-left:15px'/>

Things go wrong. This is something that we can try to control, anticipate an
plan for. But ultimately we will fail and we won't be prepared for it. If we
consider the amount of interactions we have, the amount of changes by so many
people, and the limited amount of resources we have, it should be clear that if
we don't hit some bumps, we're just going too slow.

One thing that we can do though, is to better handle problems _after_ they
happen with a good **postmortem culture**.

<div style='clear:both'></div>
<!--more-->

# What's a postmortem?

A _postmortem_ is a _written_ review of a problem that happened. We gather around
considering the root causes and what led to the problem, and we figure out a
course of actions that will prevent us from having that problem again. This is
the most important part of it: we don't want to experience _that_ problem again.

Typically we have postmortems when we have a production incident (see
[production incident training program](http://localhost:1313/post/production-incident-training-program/)).
For example, the application was down because of some reason and the customers
were not able to use it. Companies and teams may have a process for when failure
happens to create a postmortem document. There are many [postmortem
templates](https://github.com/dastergon/postmortem-templates) that we can adapt
to our reality.

But for me postmortems are a tool that can be used for more things that outages.
Some other examples might include:

* The application is okay, but a specific feature is down
* We missed an important [deadline](/post/dealing-with-deadlines/)
* We tried some new process that didn't work out
* Bet on some library or provider and it didn't work out for us
* We failed to met some KPI on the quarter

So, _whenever_ we fail, we should register it. And this should start from the
_leadership_ giving the example. I believe that postmortems are a great tool to
handle failure and that they shouldn't be restricted to developers and
production incidents.

## Typical postmortem information

Here are some suggestions for typical postmortem information to gather:

* Incident or background of the problem overview
* Timeline
* Contributing factors
* Impact
* Corrective actions
* **How are we going to make sure this doesn't happen again?**

Postmortems should be easy to understand and discuss. They should not be
_pointing fingers_. The postmortem process should be something that is desirable
and seen in a positive way. Okay, we failed, we
[learned](/post/learning-index/) from it and we'll have a [goal](/post/importance-of-setting-goals/)
to prevent this problem to happen again. If we focus on _blaming_ people and
processes we may end up having some resistance to postmortems. And this will
impact our path to be better.

## Consider who's the audience

Sometimes the audience is just our teammates and peers. We create a postmortem
to address a problem and we share with the team. But I believe that this kind of
information should be _highly_ shareable.

We should _share_ our postmortems with other teams that interact with us, and
even with clients. This means that we may need to be careful with our language
and the information we register. If we need to share the postmortem with clients
we may consider having a second version of it that was edited for simplicity and
maybe less detailed.

From my experience clients welcome postmortems. They are very sympathetic when
companies admit they failed and have a plan to prevent it.

## Review postmortems

A good exercise, specially when [onboarding new
teammates](/post/onboarding-template/), is to review old postmortems and debate
on the root causes and the proposed solutions.

There are companies that have a postmortem club, just like regular book reading
clubs. This will foster knowledge and will people will have more context to deal
with future incidents.

Being on call and having production down can be daunting and force us to leave
our [comfort zone](/post/comfort-zone-index/). Because we may not know what's
happening and need to discover the solution _right there_. So a good
[training](/post/quarterly-training-plan/)
approach is to review past incidents. Even if we don't know how to handle a
specific issue, we gain from knowing the tooling and processes used on previous
incidents.

# Summary

Problems happen and they way we deal with them makes all the difference.
Postmortems are a tool that can help us to address and solve problems. Making it
part of our culture means that it should be a natural process when something
happens and that should start from the top.
