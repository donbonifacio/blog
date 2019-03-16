---
title: "Less opinions, more hypotheses"
date: 2019-03-19T17:11:39Z
categories: ["Ramblings", "Executing", "Technical Leadership", "Decision Logs"]
small_images:
- "/img/debates.png"
---

<img src='/img/debates.png' style='float:right; width:200px;margin-left:15px'/>

I really like heated debates. It's great to discuss different strategies of
doing things and struggle until we align on a course of action. A healthy and
productive team should have heated debates from time to time. But the main point
should not be [about being right](/post/how-to-convince-others-that-we-are-right/).

I think a lot on how to make these discussions more productive and how to take
the most out of every participant. I've been trying to pay attention on how we
present our ideas and opinions and how other people react and give feedback.

<div style='clear:both'></div>
<!--more-->

Communicating our ideas clearly is hard. Sometimes we're discussing and
advocating for the same things and don't even notice it.
Other times we start to get a little mad, start
to talk louder and lose patience. This may happen because we have an emotional
attachment to _our_ ideas. We're in for a tough ride when we start to discuss
people rather than ideas.

So how could we change the way we discuss things to focus more on the problems
and opportunities and less on how we _want_ to address them?

# Example scenario

Let's consider the following scenario where two people discuss a mobile approach
for a web app that they are developing.

> **Person A**: I think we should bet on our mobile version. We're lagging behind
> with our current version.

> **Person B**: Oh I can get that. How much time would it take to build a mobile
> version?

> **Person A**: Maybe  couple of months. It's a lot of work to deliver perfect
> work.

> **Person B**: But that's too much, we'll need to delay other important work.
> I've just seen the metrics and we only have 5% of the users that access the
> app via a mobile browser. Maybe its not worth it.

> **Person A**: Oh but the thing is: if we _had_ a proper mobile version we'd
> have much more people. They don't use the mobile version because it's crappy.

This could take some time to decide and if they aren't aligned then one of them
will leave this discussion unhappy. And how can we know who is right? The thing
is: they both can be right. There is no way of knowing without making an
_experiment_.

# Changing the way we talk

To try to make these discussions more productive I'm trying to change they way I
talk. I'm actually trying to use other vocabulary that focus on validating an
hypothesis instead of an opinion. Example:

* The hypothesis on the table is that improving our mobile version will give us
  more customers
* How can we conduct an _experiment_ to validate it?
  * We could send a survey to our current clients asking for mobile interest
  * We could add a form to the mobile version saying that we're working on a new
    mobile version and we're looking for early adopters (and check if it generates
    interest)
  * We could develop a basic/small/better mobile version and assess if we start getting more
    users via mobile

Just by communicating an idea as an hypothesis we're _questioning_ it. And we
open the door for other people to question it. Trying to figure out how to run
an experiment can actually be very useful to learn more about the problem at
this point.

# The good, the bad and the ugly

If we start from a point where _we_ question our idea, then we can start right
way by trying to identify the idea's shortcomings. It's all about trade offs.
And if we're honest about them we can discuss them from the start.

We should also ask ourselves the following questions:

* **What's the cost of doing nothing?** If we don't follow this new idea what
  will we have to forfeit? Is that acceptable?
* **What's the cost of doing something?** We should also consider the _cost_ of
  following an idea. If in fact the mobile version is successful, we'll need to
  start considering a mobile implementation for all future features. This means
  that we'll need to make the frontend team _slower_ while delivering _more_.
  We'll have to purchase mobile equipments for tests and will have to decide
  what will we actually support. Again, it's all about trade offs.

By doing _quick_ experiments we can iterate and get better step by step.

## Can too much experimentation be bad?

If we're considering a development team we need to be careful with too much
experimentation. I've seen this several times when the development team isn't
able to keep up with the backlog, and so all work has a smaller scope. We're
always doing a bare minimal. Could be for experiments or because the business
demands it. Either way we may be going towards an end product that starts to
feel half baked.

Developers may start to [lose satisfaction](/post/satisfaction-index/) because
they may feel that they aren't delivering polished work or because they don't
feel that they're having impact.

# Summary

Changing the way we talk to focus more on the problems and opportunities on the
table instead of what we think of them seems to be very promising. It's a bit of
a mindset shift and so it may be hard to acquire.

And sometimes the best way may be to bypass all that and just follow our
instinct. It's never easy to pick a direction when we don't know where we're
going. But the more tools we have on our tool belt, the better.
