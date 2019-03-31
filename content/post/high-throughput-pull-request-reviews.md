---
title: "High throughput pull request reviews"
categories: ["Code Quality", "Code Reviews"]
date: 2019-04-02T10:30:42Z
small_images:
- "/img/development.png"
discuss:
  - ["Candid-yet-humane peer reviews", "https://medium.com/feedzaitech/candid-yet-humane-peer-reviews-f5e4093ee58f"]
  - ["Why Good Developers Write Bad Unit Tests", "https://mtlynch.io/good-developers-bad-tests/"]
---

<img src='/img/development.png' style='float:right; width:200px;margin-left:15px'/>

I always liked doing _deep_ reviews on pull requests. I'd try to have an
ownership mindset. If I _approve_ a pull request, then it's as if _I_ was the
author. I'd need to have full responsibility and would be able to fix or change that
code. This approach requires a significant time investment per pull request. And
sometimes generated discussions and I always liked to [discuss
opinions](/post/less-opinions-more-hypotheses/), approaches and iterate on
making great code.

But when I started being an engineering manager, I started to be overwhelmed
with pull requests to review. I remember a time where I'd start by day having 20
PRs to review, and from different _areas_ (backend, frontend, quality, ops).

I needed to find a way to be effective and be able to add value.

<div style='clear:both'></div>
<!--more-->

With so many _new_ responsibilities a manager has it may be hard to be up to date
on what's happening on the trenches. And I didn't want to stop doing reviews.
They allow me to have context on what's happening and are a powerful tool to
help me [leveling up developers](/post/leveling-up-developers/).

# The need for speed

Having so much PRs to review means that there's a lot of context to be aware of.
And naturally I'm not able to have it all. Other than the context, we might also
have different technologies or ways of doing things. I have more of a _backend_
background, and reviewing frontend code, or selenium or infrastructure PRs
requires not only context on _why_ but also on _how_ to do things.

Even with a [diverse background](/post/from-rails-to-clojure-to-java-to-rails/)
I figured out that I wouldn't be able to keep up with that much context.

Even so, could I add value?

# Focus on the why and the what

After so many years focusing on the _how_ of a PR, I started to change my focus
to the _whys_ and the _whats_. I'd need to pick up a PR and have an idea of why
it was required and what it was trying to accomplish. If that information was
available I'd be able to cross reference with other things going on and could
detect some road-blocks.

So I started to _champion_ some good practices that not only helped me but would
also add value to the team as a whole.

* **Good PR descritions** - If I get a PR without a description and with a
  _basic_ commit history, it will be hard to understand the point. I could see the
  _how_ and figure out, but that would be slower. So first _rule_ is to always
  have a proper information that addresses the _whys_ and _whats_.
* **Small PRs** - Grouping changes into smaller batches greatly improve my
  capacity to follow them. Bigger PRs should pay a tax (at least in having me
  nagging about them).
* **CSS and "visual PRs"** - It's hard for me to read CSS and understand what's
  going on. Having some pictures on the pull request description (like before
  and after) helps a lot. Using images is also great for example on
  infrastructure changes.

Okay these are all good (standard?) practices. Sometimes it's hard to have the
discipline to invest on properly explaining and building the required
information for other people to better understand our work. The [author will need
to be slower](/post/developer-speed-versus-team-speed/). But this will make the
team go faster.

These practices are also very useful for deep reviews. But to be faster I'd need
to focus on _things_ that would require less time from me. So I started to focus
on the following:

* Would I be able to fix this if needed?
* Is this easy to change/remove in the future?
* Is this easy to understand?
* Is this easy to test?
 * Can I clearly understand the test scenarios

I could actually just review the tests on the PR to have the answer to these
questions. And by having less context I'm actually able to directly see things
that are harder to understand, and can help trying to simplify them. This is a
complex shift for me. This means that I could approve [bad
code](/post/code-patterns-that-are-a-recipe-for-trouble/), as long as it was
confined to a place that's easy to change and that doesn't impact the project
and future changes.

I struggle a bit with this approach. But it's also about letting go and trusting
my teammates. I've come to realise that having hard reviews is less effective than
trusting and fostering a continuous improvement mindset.

## Tools can help

I shrug whenever I see developers commenting on things that a linter would pick
up. Linters can be cumbersome sometimes but foster a more _standard_ code base.
And this is great for me because I have less _patterns_ to process.

Having [good test coverage](/post/100-percent-test-coverage/) and a build
pipeline that inspires confidence is also very important. If I see that green
build I'm confidant that probability of the changes being correct is bigger. And
so I can focus on "easy to change and learn" aspects.

# Trust by default

From my experience deep reviews are great for developers to _align_ on how to
do things. If we have a healthy environment we start [having good discussions](/post/how-to-convince-others-that-we-are-right/) and
we start to grow. With time I started to notice that I actually couldn't tell
which developer was the author of a given pull request. There's always some
personal quirks and ways of doing things, but we start to have a standard
overall way of doing things. And this is great, not just for me, but for the speed
of the team.

When developers have the same beliefs and are aligned on how to do things,
trust starts to grow. Sometimes I pick up a review and I see that a specific
developer already approved. And I have that feeling that I actually _don't_ need
to review. Because if I trust both the author and the reviewer, can I really add
more value?

I do believe that more eyes provide more value. But that's an investment and we
need to be aware of it.

When we're at this point we can start to have what I call "inverse review
process". It's the developers themselves that will add a comment to the pull
request on a trickier code block. It's like flagging some part of the PR and
asking reviewers to pay more attention to that. And then we see ourselves
discussing the more complex scenarios and the reviews are more productive.

# Reviewing reviews

I may be able to consume PRs faster but we can't depend on specific people to
give the approval check. If we're always depending on a couple of developers to
review something it may slow us down. I started to focus on improving the
overall reviewer level of teams. What can I do so that I actually don't feel the
need to review anything?

And this basically means focusing on having everyone else being _better_ than me
at reviewing. So I start to review reviews. I pay attention on how the reviewers
approach the PR and how they provide and handle feedback. And in private I'll try
to _push_ them to be better.

For example, a _mean_ thing I sometimes do is to go to a private chat with
someone that approved a PR and say: _"hey, you totally missed a bug on that PR you
reviewed"_. I may do this when reviewers just mark the PR approved without any
feedback and I can see that there's room for improvement. After saying that,
reviewers will go back and provide a _deep_ review and add much more value. And
will get back to me and say: _"where's the bug? I couldn't find it."_. And I'll
just say that was my mistake (if you've worked with me and I've done this to
you, sorry about that :o).

# Summary

Peer review is very important for the overall quality of our deliverables. But
can also have a significant impact on our speed. The PR's author should have the
reviewers in mind and make their life easier. This means properly stating they
whys and whats and making sure that the changes are easy to understand.

When we align on processes and trust each other, we start to go much faster.
It's hard work to get there, but it's totally worth it.
