---
title: "Manager Interview: Nuno Silva - Sky"
date: 2018-05-15T09:20:21+01:00
draft: false
categories: ["Interviews", "Manager Interviews", "Mentoring", "Leadership"]
interviewee_name: "Nuno Silva"
interviewee_role: "Engineering Manager"
interviewee_company: "SKY"
small_images:
- "/img/nuno-silva.jpeg"
---

<img src='/img/nuno-silva.jpeg' style='float:right; width:200px;margin-left:15px'/>

[Nuno Silva](https://www.linkedin.com/in/nunos/) is the first guy I remember
meeting when I started at [ISEL](https://www.isel.pt/en/). We've been friends
ever since. We've done most of the course together, we started **[Orion's Belt](https://www.onrpg.com/news/orions-belt-interview-back-to-the-roots/)**
as a school project and worked at the same companies on our first years as
developers.

At some point we parted ways and gained different experiences in different fields.
But practically at the same time we started leading teams and trying to be
better at it. He's usually my advisor whenever I have some tricky situation
to attend to.

In this interview I try to get some insights on how Nuno works and some best
practices on leading teams.

He also contributed to the blog with a guest post:

* [Scaling engineering teams](/post/scale-engineering-teams/)


<div style='clear:both'></div>

<!--more-->

> Hey Nuno, what can you tell us about Sky and about the project you're
> working on?

Hi Pedro. First let me thank you for this opportunity.

[Sky](https://www.sky.com/) is one of the major broadcasters in Europe with branches in UK, Germany
and Italy. Its objective is to lead, not only with the normal broadcast
services, but with cross platform applications that provide digital content to
the end user. The main areas of penetration are Broadcast, DTH (Direct to Home) which is
basically the content provider by the STH (set-top boxes) that we have at home,
and OTT (Over the Top) services which allow Sky to provide content over the
Internet.

I work in Sky Store, more properly in the backend of Sky Store. Sky Store it's
Sky strategic OTT platform. This platform allows the client to buy or rent movies
and boxsets. The client can watch the content in a web page ([skystore.com](https://www.skystore.com)
or [store.sky.de](https://store.sky.de)),
in an Android Device, IOS Device, Desktop (Windows or Mac) or
at his on on his STB.

> Sky seems to be huge and to have lots of moving parts. With how many teams do
> you interact? And how do you tackle dependencies? I mean, if you have a
> feature that touches several teams, what's your process from start to delivery?

It depends on the feature or how many features my team is implementing at a
certain moment. Typically is 3, but can go up until 7 or more.

For big features that envolve several teams, we always have an HLD (High Level
Design) where the requirements of the application or feature(s) are converted
into a description of contracts through which we interact. This HLD can take
days or in some cases months to create. E.g. I'm currently in a project that
besides costing a couple of millions, it has dozens of people working both in
Lisbon and in UK (almost all Sky Store Lisbon is working on it). In this case,
the HLD took about 2 months to create and involved several people. At the end,
although close to final, is not perfect. Several CRs (change request) normally
occur, errors in the design are detected and things that were not considered
have to be done.

Of course that in these projects we do not interact with all the teams involved.
Last year I was involved in a even bigger projects with literally hundreds of
persons involved, but we always interact with the teams on our frontier.

At the end, we continually integrate the features on our test environment,
have a phase of SIT (System integration Tests) that involves all the teams, we
have a trial phase were only some of the clients can see and interact with the
new features (in special production environment) and finally we have the go live
were the feature is available for all our clients.

> It's needed a lot of coordination to orchestrate that. Imagine that you have
> some delay, for illness or bad estimates. What kind of tools to you have to
> handle that possible deadline breach?

You basically hit the major downsize of working in a company with over 30k
people, with teams spread in several countries and a culture that has been
evolving for 27 years now.

I recognize that the process is not very agile and we take a lot of time to
put large features into market, specially because the waterfall part of the
process tends to delay everything. We don't have a silver bullet. We try to
respond rapidly to changes, like illness, spreading the knowledge between
several people to reduce the risk. Regarding bad estimates, we always have a
plan B, what is usually called a tactical solution, to overcome unexpected
scenarios that other way would delay the project. This usually get us time to
implement a more strategic solution, one that we are proud of. And this is one
of our major concerns: always implement strong solutions that solve problems
in the best way possible.

> To have the team always at a high level is not easy. What do you do to
> ensure that your team is growing and healthy?

I think 1 on 1s are essential. I do a formal 1 on 1 each 3 months. Between
those formal meetings I usually use lunch time to speak with each one
individually and try to understand their problems and pains. I try to be
proactive and understand if there is a problem as soon as possible. This
actually works very well because I can mitigate them at an early stage and
everyone is very direct to me, even when they are contacted by other companies
which shows the level of proximity I have with everyone.

Also I try to understand what are they expectations in terms of evolution
inside the team and inside the company and act accordingly. Those who want a
more technical career I usually give a more complex tasks where they can improve
they architecture skills. The ones who want a more management role, usually are
the ones that replace me and are giving projects were they are the ones that
manage dependencies and timelines. I always help both because at the end of
the day I am the responsible, but the main focus is that they shine, not me.

Finally I have a huge focus on joining all the team together at least once
every 2 weeks. We choose a nice restaurant and, without any time constrain,
have fun and hang out. Usually this day corresponds to the end of our sprint.

> Having the team healthy, growing and productive is always an on-going task.
> How do you handle new additions to the team? Can you talk a bit of how you
> do recruitment and onboarding?

Regarding the additions to the team, it always depends on the number of
additions and who is the person to be added. Always make a small onboarding
section were I share the values of team (like bringing custards for the team
every week) and explain the business end to end. Of course there are complicated
persons that sometimes do not adapt or have a more stronger personality.
I had 3 in my previous team. What I do is more regular 1 on 1s with them,
trying to understand the why in their behaviours and work with them to resolve
and improve.

The recruitment at Sky is usually split into 4 parts. The first is an online
test where we evaluate the technical capacity of the candidates with some
simple exercises. This process is a triage that removes about 60% of the
candidates. The second part is an interview were we explain what Sky is,
our values, culture, perks, where we know the candidates, their expectations,
what they want to achieve. At the end we ask some basic technical questions.
If the candidate passes the second interview, the third is typically a more
technical interview were we discuss technical problems normally related to
some that we had at Sky. The Fourth is where we make the final proposal and
explain all the conditions and how the perks work.

> We've talked about growing our team and how to have a happy and productive
> team. But what about we, the managers? We also need mentoring, coaching and
> to grow. What would you expect from your manager and what can we do
> to level up?

From my Manager I expect full transparency even if that hurts. I would expect
straight feedback specially focused on what I did wrong and what I can do to
improve and reach the next level. I would also expect continuous and frequent
1 on 1s so we can not only review my latest work, but specially my
performance and results.

> That's great. Thanks for answering my questions. One last one: can you point
> me to someone to interview next? And explain a bit about why you choose
> that person?

First let me thank you for this opportunity.

If I had to choose a person, I would pick my good friend [Ygor Cardoso](https://www.linkedin.com/in/ygorcardoso/).
He has made a similar path within Sky as I did. We were part of the same team,
he was promoted to a leadership role some time before I did and is now the
Delivery Manager of Sky Store and my boss. :)

So I'm sure that he has a lot of interesting insights to share.
