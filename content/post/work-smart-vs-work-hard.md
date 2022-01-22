---
title: "Working smart versus working hard"
date: 2018-07-11T08:26:16+01:00
draft: false
categories: ["Leadership", "Ramblings"]
images:
- "/img/work-smart.png"
---

![Working hard versus working smart](/img/work-smart.png)

I believe we can split _work_ into two categories: creative work, and regular
work. To have a healthy work day we should be able to do both. But regular
work is much easier and less demanding. I think both of them can be productive
but working smart yields the best results mid to long term.

<!--more-->

Creative work is more engaging but is also tiring. And we need to have a relaxed
mind to be able to achieve it. When we talk about _working hard_ we talk more
about quantity than quality. We're more focused on short term output. But
continuously having more work than we can handle makes us more tired and therefore
less prone to do creative work. We start leaning for regular work all the time.
We may accomplish some milestones but we may endanger future work and
[productivity](/post/productivity-index/) (see [developer speed versus team
speed](/post/developer-speed-versus-team-speed/)).

This may happen when we have demanding sequence of [deadlines](/post/dealing-with-deadlines/).
If we're pushing release after release it's hard to take some time to improve
things, take care of technical debt and attend to bugs and improvements. We
always have the pressure to deliver more. This can lead to physical and
psychological burnout.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">When we feel stress our bodies release cortisol. Cortisol impairs  rational thinking &amp; decision making. In a toxic culture we are biologically more likely to make a bad decision or do something that is  ethically questionable. Healthy corporate cultures matter  <a href="https://twitter.com/hashtag/goodleadership?src=hash&amp;ref_src=twsrc%5Etfw">#goodleadership</a></p>&mdash; Simon Sinek (@simonsinek) <a href="https://twitter.com/simonsinek/status/994997571679608832?ref_src=twsrc%5Etfw">May 11, 2018</a></blockquote>

# Typical examples of working hard and not smart

When we don't have the energy to do creative work we settle for tasks that
are less demanding. This compounds and in some time starts to look like
there just isn't any other way. _"We always did things that way"_. Here are
some examples:

* We have a slow test suite. If we get a [flaky test failing](/post/code-patterns-that-are-a-recipe-for-trouble-2/#using-sleep-in-tests), we just re-run
  the suite instead of trying to understand the problem and fix it.
* There is a support ticket with corrupted data on the database. We just change
  the data instead of [fixing the root
  cause](/post/zero-bug-policy/#1-always-address-the-root-cause) that led to that problem.
* We have a feature to implement. We start coding right away instead of doing
  [some planing](/post/rfc-driven-development/).
* We made some changes and some unit tests are failing and we don't understand
  why. We just comment them out.
* We have a production bug and we quickly create that one-liner pull request
  that fixes it. But we don't [replicate the issue with a unit test](/post/zero-bug-policy/#3-really-fix-the-bug).
* When production is down we fix it and don't take the time to create an
  incident report and share what happened. We don't track the number of
  outages we had.
* In a similar way, we don't create a [postmortem](/post/postmortem-culture/) with things went bad and we
  don't take the time to understand our problems and fix them.
* We may have manual periodical tasks that take 10+ minutes and we don't take the time
  (couple of days) to automatise them
* We have lots of status meetings that delay us, but we don't question them
  because that's already part of our way.
* We may be interrupted several times and change tasks if something urgent
  comes up. But it's our sprint commitments that take the fall.

Sometimes we have tasks that take our time and they feel like work, but
it's not really _productive work_. We are working but are we providing the
best value we can?

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Interviewer: Tell me about your qualifications. <br><br>Candidate: I&#39;m very quick at math. <br><br>Interviewer: What&#39;s the square root of 700?<br><br>Candidate: 4. <br><br>Interviewer: That&#39;s not even close. <br><br>Candidate: Yeah, but it was quick.</p>&mdash; Jeremiah Lowin (@jlowin) <a href="https://twitter.com/jlowin/status/995068743540707329?ref_src=twsrc%5Etfw">May 11, 2018</a></blockquote>


Working smarter is taking the time to fix root causes, to constantly iterate
in making our processes better and more productive. But we need time and
a relaxed mind to accomplish that.

# Negative spiral

Whenever we stop working smart and go for band-aids, we are just delaying the
inevitable. We don't fix that root cause and then we need to handle several
related issues that never seem to end. Or we assume that the test suite _must_
be slow, so we don't bother adding more slow tests to it. Having years of
development with this mindset is very hard to counteract. We may lead ourselves
to a [project no one wants to work at](/post/project-no-one-wants-to-work-at/).

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">If you&#39;re an engineering manager, the quickest way to say &quot;fuck you&quot; to your reports is to prove that you _just_ care about getting the work, no matter how shitty, done, but are not at all invested in their technical growth or career long term.</p>&mdash; ✨Shubheksha✨ (@ScribblingOn) <a href="https://twitter.com/ScribblingOn/status/1004282178333634560?ref_src=twsrc%5Etfw">June 6, 2018</a></blockquote>


# Turning around

Working smart is a choice. We make a stand and fight for extra time. Every
sprint we try to gain extra time. And we use that time to make us more
efficient.

This is like a muscle. We need to train it and it will be hard when we start.
But it's our choice to:

* When we have a bug: understand the root cause, replicate the issue with a
  test and create a patch.
* Before starting a new task, we take some time to understand what we're going
  to do and ask for [some reviews](/post/high-throughput-pull-request-reviews/).
* Etc...

This can be hard to bootstrap. But all this investment will pay off. We just
need to have a higher threshold for the quality we want to deliver.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Typical software company: 1. Backlog of stuff somebody decided the team should do -&gt; 2. “Product” role who really is just a project manager -&gt; 3. Designers and programmers overloaded with ill-defined work being asked to work faster and faster instead of smarter.</p>&mdash; Ryan Singer (@rjs) <a href="https://twitter.com/rjs/status/989857605123223552?ref_src=twsrc%5Etfw">April 27, 2018</a></blockquote>



# Working hard is good too...

I do believe that bursts of hard work are very important. They force us to leave
our [comfort zone](/post/comfort-zone-index/). They put to the test our practices
and productivity. They make us realise what are our improvement points. All
of this will make us grow.

But his should be like a wave. We should have _hard work periods_ and _smart work periods_.
Because there's a thin line between a healthy work load and burning out, or
even compromising our future productivity.

# How can we work smarter?

Working smart is not about accomplishing less. It's about accomplishing more
with the time we have. How can we deliver more than we are delivering by
performing less work? This is working smarter.

This is very personal. In my case I need some good batches of uninterruptible
hours for creative work. It helps be to have a daily routine that fosters those
hours without interruptions.

For example: I can book meetings just on the afternoon, and so I _know_ that
I can work concentrated on the mornings. I may turn off other kinds of input
(like production bugs), but I'll need to know that someone will attend them.
Sometimes we do need to have a few people that are interruptible, if that
makes the rest of the team able to concentrate on doing work.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I think 80% of companies who say they need to hire more engineers actually don’t.<br><br>They need to<br>- motivate better<br>- communicate better<br>- plan better<br>- retain better<br>- train better<br><br>Hiring more can often be throwing money to cover up deeper managerial/product issues at the company</p>&mdash; shawn swyx wang 🌟 (@swyx) <a href="https://twitter.com/swyx/status/995155886724218880?ref_src=twsrc%5Etfw">May 12, 2018</a></blockquote>


# Summary

Working hard is easier to do and to sell. Sometimes we have so much work load
that there isn't any other option. But we do need to realise that always working
hard may bring some fruits in the short term but will definitely make us slower
and compromise our future.

{{< youtube qBTRatvT2cU>}}
