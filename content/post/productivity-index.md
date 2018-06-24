---
title: "What impacts our productivity?"
date: 2018-06-05T20:03:44+01:00
draft: false
images:
- "/img/productivity-index.png"
discuss:
  - ["How to Improve Your Productivity as a Working Programmer", "http://malisper.me/how-to-improve-your-productivity-as-a-working-programmer/"]
---

![Productivity index](/img/productivity-index.png)

I see productivity as value added per unit of time. There are many factors that
impact our personal productivity and at the end of the day we're always part
of something bigger, like a team and a company.

<!--more-->

# Productivity challenge

There's a challenge I like to make to my mentees from time to time. Imagine that
we had a deliverable that was estimated in 10 days. I'll ask for the following:

> Can you do it in 8 days?

There are some rules to this challenge. You can't work extra hours. And the most
important isn't to deliver in 8 days, but actually have a sense of what would
be required for you to deliver in 8 days.

How would this be possible? My goal here is simple: usually our productivity
is not that related with _how much work we can do on a given day_, but with
several other practices and responsibilities that we have.

# What impacts our productivity?

Our ability to produce things naturally depends on our craft skills and work speed. But
there are a lot of extra things that will impact what we can deliver. Specially
things that aren't directly related with with what we need to deliver.

* **Dependencies**: do we have dependencies? Managing dependencies may be hard
  and cumbersome. If we need something to deliver our work we should be
  responsible to make it happen as fast as possible. We may need context on the
  status of the dependency and even help if necessary.
* **Unknowns**: we may have some unexpected bumps what will delay our work.
  These are hard things to detect beforehand but if we invest some time in
  planning we may detect them and account for them.
* **Risky parts**: some times we already know what might be riskier, like using
  a new technology, requiring some research with trial and error, or needing
  to change some part of the project in need of refactoring.
* **Quality requirements**: what do we need to deliver? Sometimes it's not just
  a feature, but also documentation, upgrade guides and assets to other teams.
  We need to gather all this to have a clear picture of what is the end game.
* **Unrelated meetings**: we may have meetings that are not related with what
  we need to deliver. Could be status of other features, decisions to make,
  even all hands meetings. All these impact the time we have to work and we
  should account for them.
* **Recruitment**: we may also have recruitment responsibilities, and need to
  make interviews.
* **Support**: we may be responsible for being on call or solve urgent support
  tickets that may arrive.
* **Waiting for pull request reviews**: depending on the team, we may have a lot
  of pull requests to attend to. If the pull requests are complex we may need
  to wait and iterate on them.

As we can see there's a lot going on. We'll need to be very organised to make
everything work. Properly using the resources we have at our disposal is very
important.

# How can we handle all these extra tasks?

Some teams have a SCRUM master or a technical project manager that may help on
several of these topics. The bottom line is: we need to consider what tasks are
possible to delegate to our teammates.

We need to make a plan to try to anticipate what we need to do and if we see
right away that we need some help, we should talk to our manager and explain
our point of view. There are some things we can do to account being late:

* We can split our work in milestones, and we can have a clear picture of our
  progress
* We can have a plan B in case we're running late. For example, negotiate
  decreasing scope.

See more in [dealing with deadlines](post/dealing-with-deadlines/).

From my experience the most problematic thing when we're running late isn't
being late, but it's actually dealing with expectations. I may not mind if someone
tells me that they need a couple more days to deliver something. But it will
be frustrating to expect something at a given day and not getting it.

With so many things going on it's easy to invest some time in something else
and be late. There's this saying:

> Saying yes to something is saying no to something else.

I believe we need to be clear when new things come on our way. _Okay, I can grab
that support ticket, but that will delay my current commitment. Is that okay
with you?_

## Site note about generativity

I see this happening a lot. Someone may not be delivering directly, but may be
boosting the rest of the team to deliver. I've seen this called _generativity_.
This is hard to detect and usually it's more prevalent in people with specific
personality traits. They may feel bad because they aren't delivering and may
not feel recognised.

See: [do you feel recognised at your company?](/post/recognition-index/)

But their impact on the global deliverables may be significant. Managers need
to have special care in detecting these patterns and value them.

# About adding value

I always try to see productivity as added value. We may be working a lot and
doing many things but not actually delivering value. Some examples:

* We did a shiny new feature, but no one uses it
* We did a complex refactor on a system that is rarely used
* We're doing periodic manual tasks, and not focusing on automating them
* We're waiting for our tests/build/CI to run with success
* We improved the performance of a component that isn't a bottleneck

We may say that getting value out of our deliverables isn't our responsibility.
And we may be right, there might be someone with more responsibility on that.
But there's a rule I like to follow:

> Everything is everyone's responsibility.

This will make the difference to have a healthy and productive environment. We
should own the value of what we're doing. We should understand the impact and
question everything. What does success look like after we deliver what we're
doing? How are we going to make sure that we achieve success?

I remember a day I was browsing support tickets and I saw someone suggesting
a new feature. The thing is, _I_ had implemented that feature years ago. But
somehow, our clients didn't know about it. That's why it's important to understand
what success is. If we're releasing a new feature, lets also understand how
are we going to _sell it_.

# About quality

Quality is an attribute of our deliverables. We may be fast and finish everything
but introduce technical debt and create something that will be very hard to
change in the future. This may lead to bugs and breaking things elsewhere and
ultimately will impact the team's productivity.

See: [that project where no one wants to work at](/post/project-no-one-wants-to-work-at/).

Sometimes we need to be pragmatic and make trade-offs. That's part of the game.
But even so we need to plan for mending things we've done poorly. Or maybe hide
quick implementations behind good abstractions.

What's delivering with quality? That will depend a lot based on the team and
on the company. Here's a definition:

* Code is simple and easy to change
* Code was peer reviewed
* Code is properly [covered with tests](/post/100-percent-test-coverage/)
* The feature is behaving as requested
* There are no severe bugs detected by the quality squad
* Was delivered on time

Some teams may have a _definition of done_ that may have more requirements, like
providing documentation. It's important to be aligned on what quality is and
try to go for it.

# Understand what makes us productive

We need to know the environment and requirements that make us more productive.
For example, staying at home, in a calm and silent mood. Or being at the office
with all the noise. Starting working earlier or work late at night. Each one of us
should know how to take the most out of us.

# Summary

There are a lot of things that impact our productivity. I try to challenge my
mentees to understand clearly what are those things and try to balance against
them. We need to focus on delivering value and understand the impact of what're
doing. This will make us much more motivated and confident of our skills.

Here's the full list of indexes that I like to track on my 1on1s:

* [Learning Index](/post/learning-index/)
* [Recognition Index](/post/recognition-index/)
* [Comfort Zone Index](/post/comfort-zone-index/)
* [Productivity Index](/post/productivity-index/)
* [Satisfaction Index](/post/satisfaction-index/)
