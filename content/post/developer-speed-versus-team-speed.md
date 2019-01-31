---
title: "Developer speed versus team speed"
date: 2019-01-29T18:00:46Z
draft: false
categories: ["Ramblings", "Code Reviews", "Executing", "Culture"]
small_images:
- "/img/values-and-habits.png"
discuss:
  - ["Reddit", "https://www.reddit.com/r/programming/comments/alcjif/developer_speed_versus_team_speed/"]
---

<img src='/img/values-and-habits.png' style='float:right; width:200px;margin-left:15px'/>

I was always very focused on _speed_ and [productivity](/post/productivity-index/),
but mostly from _my point of view_. Developing features _fast_ and with
quality is still one of my favorite problems to solve. But now that I'm more of
a manager, I have to deal with new insights. How can I balance developers that
are so fast that they slow the team down?

Usually developers frown on processes. They want to be left alone working on
their tasks and concentrated. And indeed that's the best use of their time. The
problems arise when we have several _developer threads_ working in parallel and
we need to sync them. So a new favorite problem to solve is how to make
developers productive individually while potentiating the team and the overall
output of the team. But for that... I need processes.

<div style='clear:both'></div>
<!--more-->


# When we need to go slower to go faster

Let me share an example. I was helping the frontend squad and implemented some
logic. While doing that I totally destroyed a visual element. As I'm not that
_productive_ with visual _things_ (read CSS and having good taste) I created a task for
my colleague to fix what I had broken. This was a minor issue, but we were
missing this task to complete a business requirement.

A week or two went by and then I saw a pull request where my colleague removed
that broken component. I asked why, and she said that she had talked with the
product designer and maybe that was not _that important_.

So here's the example of a very fast interaction. The developer went to know
more about the bug, talked with someone, and fixed it right away. There was
collaboration and autonomy. So where's the problem? And the problem is context.

We had a requirements document that had that specific use case defined. So even
if this fix was indeed very fast, the problem is that not all stakeholders were
aware of it. So what could have happened?

* Other developers would accept the pull request: the code was okay, it was a
  simple fix, and because they lack context on the feature they can only analyse
  the contents of the pull request
* Sometime _later_, the product manager could ask for this missing feature. We
  would discuss about it and could probably end up doing it anyway, and so that
  quick fix pull request would have been for nothing
* The QA analyst could have registered a bug because the functionality was not
  present as specified

So we could end up in the ping pong situation where we bounce back and forth to
deliver something. And this is something that I try to avoid, because I believe
this is the biggest culprit for slowdown on a healthy team. What should have
been done?

* The developer talked with the product designer for context: that's great
* Upon the feedback, the best course of action would be to _share_ this change.
  Mainly going to the requirements document and register and [discuss the change](/post/how-to-convince-others-that-we-are-right/).

Well, this would be slower, but everyone would be on the same page. No
unnecessary code would need to be done, _but_ we'd need to wait until all the
parties agreed on a course of action.

But that could by itself be cumbersome. So where do we draw the line? How can we
take the best out of autonomy and being agile, while having all interested
parties agreeing on the course of action?

Well that's something I'm still trying to solve. One approach is to have parties
aligned beforehand ([RFC driven development](/post/rfc-driven-development/),
[decision logs](/post/decision-logs/)) and
then have a culture of trust that each teammate will do the best possible to
deliver the feature the with most possible added value. This is ongoing work and it's
hard to achieve.

# Are we slower when we collaborate?

There's another example I'd like to mention. I've been seeing a _trend_ on
Twitter, from developers that I respect a lot, that state that we should not
have pull requests. That it's more important to put things in `master` and that
we can later fix things if necessary. And sometimes, I actually do that. I may
be in a _hurry_, so I create a pull request, the build passes, and I merge it
leaving a note saying that I will update things later if anything comes up on a
review.

But then we have the problem of context. And that other problem of the quality
of our deliverables. One thing that makes software development slower is trying
to change code that is hard to understand and too complex. On a mature team
with good pull request reviews this problem occurs less times, because we have
our peers trying to understand right away what's happening.

This is another example of a process that could be so fast (oh everything is
green, merge away and advance) and also so slow: starting the day and no one
took a look at the pull request, or someone actually did and we have dozens of
comments to address or discuss.

And what about documentation? This will depend on the DoD of each team, but
having documented code (to be used by JavaDocs, JsDocs, etc) and even
documenting what was done (how the integration works, how to simulate things,
the overview of the data structures) is another example of a process that might slow us
down but may boost a teammate in the future.

# What can we do?

Collaboration is hard and communication is hard. From my experience, mature
teams that are working for a while are able to bypass most of these issues.

* They are aligned and aware of what's going on
* They discuss things when they are unsure of specific details
* They really _understand_ what they need to do before doing it
* They did so many code reviews that sometimes the code is so similar that we
  can't tell from the pull request who is the author
* They know that [learning](/post/learning-index/) what the project does and how it does it may be a
  huge bottleneck. Both for newcomers as for teammates

But this takes time and investment to build. We need a mindset of constant
improvement and [leveling
up](/post/leveling-up-developers/). So what puzzles me is: how can we
make this faster? What kind of processes can we implement to be [more
optimised](/post/work-smart-vs-work-hard/)?
And by optimised I mean: having a healthy and highly productive team that
delivers value consistently.
