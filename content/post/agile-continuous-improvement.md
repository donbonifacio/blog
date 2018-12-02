---
title: "Agile as a side effect of continuous improvement"
categories: ["Ramblings"]
date: 2018-09-04T16:37:31+01:00
draft: false
small_images:
- "/img/development.png"
---

<img src='/img/development.png' style='float:right; width:200px;margin-left:15px'/>

I never paid much attention to the _agile movement_. I've worked with SCRUM and
other methodologies and always had some issues with them. They always felt
more like a control structure than an improvement by itself. I do remember the
first time we used SCRUM. It felt like a breeze. That wasn't because of SCRUM
itself but rather because using any kind of organisational model when we have
none, is always an improvement.

But I did feel much constraints using it. I'd say that maybe we never used it
properly. But I do feel that SCRUM is great at some things, like managing risk,
but not good at others: like
[productivity](/post/productivity-index/). It helps a lot when we need to build
tailor made software to a specific client. When we are sharing the risk with the
client and the client pays by the sprint.

<div style='clear:both'></div>
<!--more-->

In this flow, things like demos
and sprint deliverables make sure that we're building the right thing. But my
typical experience is different: we usually have a huge backlog of things to do
and it's not so much about the _risk_ of doing the wrong thing, it's more about
the ability to delivery value _faster_.

# Agile in 2018

I admit that I may not have had the best experience with agile methodologies and
even that I may not have the best understanding about it. But trying to know
more about it and seeing _certifications_ after a couple of days never gave me
much assurance that it would bring me additional value (it's ironic for me
saying that, because I always [suggest](/post/learning-index/) SCRUM certifications to my mentees on their
[training plans](/post/quarterly-training-plan/)).

The other day I saw a talk from Martin Fowler: [Agile in 2018](https://www.infoq.com/presentations/agile-2018#.W4jd_dJGsfw.twitter).
Even if I don't follow _agile_ that much, I always try to [question my
beliefs](/post/how-to-convince-others-that-we-are-right/)
and try to [learn more](/post/learning-index/). So I put that talk on the screen to see what was going
on.

And I was amazed. I am _completely_ aligned with **everything** that Martin
Fowler said. The things about _agile_ today being more of a business model and bypassing the
[agile manifesto](http://agilemanifesto.org/) agreed with my past experience. And the focus on quality and
continuous improvement completely match my work mindset.

I found it interesting that without reading or following Martin's teachings, I
was so aligned with them. That's when I wondered whether the _agile manifesto_ is
not an innovation by itself but rather it's a side effect of pushing to be
[better every day](/post/work-smart-vs-work-hard/) as a software developer.

# The quest for quality

Quality processes like TDD, [RFCs](/post/rfc-driven-development/),
[zero bug policies](/post/zero-bug-policy/), pair programming, [code reviews](/categories/code-reviews/), having an automatic
build pipeline with continuous integration... all these things are sometimes
hard to sell. Sometimes I feel that it's important for a team to feel the pain
of [bad
code](/post/code-patterns-that-are-a-recipe-for-trouble/) before understanding the value of these processes.

It's hard to buy solutions to problems we never had before.

I also had some resistance to these processes. It took [many bad
experiences](/post/project-no-one-wants-to-work-at/)
before I started to want something better:

* Getting a change request that was so hard to incorporate because the code was
  hard to change
* Getting bugs all the time, because [I though that my code was
  okay](/post/bug-that-was-not-our-mistake-except-it-was/)
* Pushing that quick fix to production that put the [application
  down](/post/production-incident-training-program/)
* Doing that fix that was wrong, but the one guy with business context
  wasn't aware of it

So many change requests were troublesome. At first I blamed the _product
people_. They should have provided proper specs and if something needs to be changed
it's _their_ responsibility. But after going trough this dance so many times
something clicked: I realised that _I_ also needed to be responsible. That it
was _me_ that was wasting time and being a bottleneck.

So I started to focus on building code that is easier to change. On how to make
code that has high quality and low defects. The technical part comes here. We
need experience and training to be better at writing code. We need to _decide_
that from that point on, our
[goal](/post/importance-of-setting-goals/) will be to aim for flawless software.

# It's not just about code

But having code that is easy to change is not enough. Sometimes we have
dependencies that we don't control. Or a change may require modifying
database structure that implies data migrations and application downtime. And
let's not forget that simple change that needs to be accounted for on the
frontend or by a different team.

Building software is hard. When we realise that the quality of our code is not
enough, we try to reach the [next level](/post/leveling-up-developers/): we need to anticipate what's coming.
It's not about deep planning. It's about just _knowing_ what's ahead and having a
clearer picture of the future of what we're building looks like.

This is why client interaction is so important. We can we iterate daily with out
client we can try to understand the end game and prepare our code to be easy to
change in that direction. This is another line on the agile manifesto that just
comes from trying to be better. We get to some bumps, and we change our way of
working to overcome them.

# It's not just about the client

I mean that sometimes we don't have _a client_. We may have thousands of them.
How do we sit with a client when we are working on a SaaS project that has 10K
clients. We can pick some of them and work directly with them, but there's
always the danger of building tailor made software for a subset of our
clients.

So we need to adapt. We need to have a way of making informed decisions. We
start to gather data and try to get value from it. We need to understand what
our customers value and work as a team to deliver value. But we also need to
know the direction our company is heading to.

# Summary

My point is that maybe if we left several teams that couldn't communicate with
each other, that had a deep focus on continuous improvement and being better,
they would reach similar practices to those that are advocated by the agile
manifesto. Or maybe they would reach some others. Because each team is unique,
because our experience and the type of problems we face force us to see the
world from a different point of view.
