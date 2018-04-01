---
title: "Dealing with deadlines"
date: 2018-03-24T16:35:36Z
draft: false
categories: ["Soft Skills", "Leadership", "Postmortems", "Frustration Debt"]
---

![Deadling with deadlines](/img/dealing-with-deadlines.png)

I usually like to ask the following question when I'm interviewing developers:

> Imagine that you have a task that you estimated to be 2 weeks. It's now
> two weeks from the deadline and you realise that you've made a mistake and
> that the task will take 3 weeks to do. What do you do?

The question is vague on purpose and usually shows how mature the developer is.

<!--more-->

# The typical answers

There are some that just block and don't have any feedback to say. But the
majority actually say the following two things:

* That this change of estimate should be communicated as soon as possible
* That this shouldn't have happened in the first place

And these are two great responses. I'm usually happy with them. Some people
look at me in that specific way while they think: _are you expecting me to say
that I would work overtime?_. Well, I'm actually not.

Ideally what I should have after that question would be a role play where the
developer would try to get more information about this problem. That's why
the scenario is so vague, to see who sticks with it, and who questions it and
tries to learn more.

# Gathering information

The first thing to understand is **why** we have the deadline in the first place.
It's always important to understand the impact of what we have to do, and there
are several possible sources for a deadline:

* **It's a hard deadline because of something that we can't control**: for example
  a law that demands changes on applications from a specific date on.
* **Because there's some event that we can't miss**: if we're launching something
  new before a high sales period (black Friday), we could miss out by missing
  the deadline.
* **Because there's someone or some team that depends on us**: in this scenario
  we should check their status. It's very frustrating to finish a complex feature
  in a deadline and then no one takes up on that for some days/weeks.
* **Because upper management believes the team isn't being productive and wants
  to push it**: this is very dangerous and we need to understand if we're on
  this situation and how to get trust back.

# Planning for the deadline

Assuming that we actually have the deadline and need to do something about it,
it's time to lay down our options.

* **Can we change the scope?** Is there room to decrease the scope? Doing less
  while delivering the same results? Could we deliver some iteration of a feature
  and then improve on it after the deadline?
* **Can we choose other people?** Is there is someone with better context on that
  feature that could be more productive? Could we have a replacement or even
  better some pairing on the feature? This would assume that something else
  would have less priority. Also, if we have someone junior or recent on the
  team, that will also have impact on the productivity.
* **Can we parallelise the effort?** Sometimes tasks are sequential and adding
  someone doesn't help that much. But if we have tasks that are independent and
  that can be made side by side by other developers, let's consider it. In this
  scenario it's useful to have a hands-on engineering manager, because he or
  she can actually lend a hand.

If we're on a tight spot we can also review the amount of unrelated work that
the people
allocated with that effort have. Sometimes we are in a hurry and still have 
other obligations like doing recruitment meetings or attending status meetings
or global company events. If that's the case we need to protect the developers
and don't take precious time with things that are not as urgent.

**And if we actually need overtime?** From my experience, if we have a tight deadline
and we have a healthy team that understands the impact of their work, they will
be the first ones to be volunteers to get things done. If that's not the case,
then there will be added frustration that will pile up on the **frustration debt.**

# And if we fail the deadline?

If we have a healthy team that is productive and had a commitment to deliver
something on a specific date, and that wasn't possible, then a _postmortem_ is
in order. Usually we do postmortems when production is down, but I believe we
should do postmortems whenever something failed.

So let's deliver late but also deliver a postmortem that explains what happened:

* Why where we late? Didn't we properly manage dependencies?
* Did we provide a bad estimate? Why?
* Did we find some part of the code base that was harder to change?
* Did we introduce breaking changes that were not expected?

And the most important part of a postmortem, how will we prevent this from
happening again?

* Next time we should have a plan B from the start
* When planning, always assume that we'll be late and plan for it
* Let's plan for some refactorings to make the code easier to change
* Let's review our global process to see what is slowing us down

# What if we don't fail the deadline but we should have failed it?

Sometimes we push and are able to delivery something. But that may have bugs,
add technical debt and the team may not be proud and comfortable with the
deliverables. There's always some line that states the amount of bugs that are
_allowed_. Let's make sure that everyone agrees on that line.

We should also consider the speed impact that launching a buggy version has.
Because bugs will still need to be solved and that is time that will be taken
from the next developments.

And the other issue is: what if we achieve the deadline but at the cost of the
team being tired and frustrated? Is that trade-off worth it? That will always
hurt the healthiness of the team. And add to the frustration debt.

# Summary

This is never an easy topic and usually the developers are the ones that get
the short stick and need to deal with it. But that leaves scars and it's
the management's responsibility to make sure that doesn't happen. Whenever there's
a deadline that is hard to achieve, I always assume is the actual management
that should be held responsible.
