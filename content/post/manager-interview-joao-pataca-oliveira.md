---
title: "Lead Gameplay Programmer interview: João Pataca Oliveira - Ubisoft"
date: 2019-02-26T08:28:56Z
draft: false
categories: ["Interviews", "Manager Interviews"]
interviewee_name: "João Pataca Oliveira"
interviewee_role: "Lead Programmer"
interviewee_company: "Ubisoft"
small_images:
- "/img/joao-pataca.jpeg"
---

<img src='/img/joao-pataca.jpeg' style='float:right; width:200px; margin-left:15px'/>

I'm mostly experienced in building web apps. And I always wondered how other
types of applications are built. Embedded systems, mobile apps, desktop
applications, etc. Do we share the same practices? And mostly: what can we learn
from other ways of working?

In this interview I try to find out the differences to the
[AAA](https://en.wikipedia.org/wiki/AAA_(video_game_industry)) game industry by
interviewing [João Pataca Oliveira](ihttps://www.linkedin.com/in/jpatacaoliveira/).

How are their quality processes? How to they ensure a healthy environment on
such a fast pace and competitive area?


<div style='clear:both'></div>
<!--more-->

> Hello João. Can you introduce yourself and talk a bit about your background
> and what you do?

Hello and thank you for inviting me for this interview.

I am a [Técnico](http://bem-vindo.tecnico.ulisboa.pt/) alumnus,
where I got my masters in Software Engineering. While there I developed a strong
interest in game development and started spending my free time working on my own
games with friends. I realised this was what I really wanted to do and once I
graduated I decided I to explore AAA game development. Since that's not an
option in Portugal I looked all over Europe for an opportunity and finally found
one in [Ubisoft Sofia](https://www.ubisoft.com/en-us/studio/sofia.aspx).

Four years have passed since then and I'm now a Lead
Gameplay Programmer on [Skull &
Bones](https://skullandbones.ubisoft.com/game/en-us/home/). I spend most of my days figuring out the
best ways for my team to add value to the game, as well as planning our tasks
and providing support in all of them. As often as I can I try to put my hands in
some code in order to keep myself up to date on the latest developments and also
to be able to provide valid feedback for my team's work.

> What's your process for figuring out how to add value?

In game development, as in any creative endeavour, it can be challenging to
clearly define what our final product should be. We're looking to develop an
experience that is fun and entertaining and this is a very abstract concept that
can be interpreted in many different ways. So our development process reflects
that - it's very much based on prototyping and continuous iterations.

As a Lead Gameplay Programmer I strive to optimise these iterations as much as
possible. It's not only about achieving the goals of the next iteration, but
also working in such a way that development speed remains high during the whole
development across the different teams. A higher speed means faster and higher
quality iterations, which in turn guarantees a better final product.

In order to achieve that goal I participate, together with my team, in the
process of defining the expected results for the next iterations. This way we
are able to influence both the design and the planning with our expertise.

> Could you give a bird's eye view of your ideal development process? For
> example, from an idea on someone's mind, to having it being used.

For me the best way to handle this process is by approximation. The trick is in
making those approximations in a smart way. First we should prioritise easy and
fast solutions that will answer the main questions - "does it add value to the
game?" and "can we do it within the constraints we have?". From there, we should
continue approximating by answering increasingly detailed questions that often
require more people or more time, for instance "how do we make it look better?".

Essentially it comes down to every single person involved figuring out the best
way they can contribute to the next approximation. When designers have an idea
they may go straight to programmers and ask them to implement it, but is that
the most cost-effective thing they can do? It takes much less time to validate
the idea with other designers and/or to implement a low-fidelity prototype (and
more often than not that's enough to catch a slew of problems). The same applies
to programmers. When they are given a task they can spend weeks coming up with
the most amazing architecture and implementing it, only for the whole feature to
be scrapped because it's not fun. Instead, they can quickly implement a simpler
solution first and validate it with the rest of the development team. Once we're
sure that it does what we need, they can go back to implementing the amazing
architecture with the certainty that it will be useful.

> How can you tell if something is adding value?

Ultimately for us it's about what generates "fun" and what doesn't. In the
beginning of the development process we're looking for this in a broader sense -
maybe asking questions like "how do we make sure the player stays invested in
the narrative?" -, and in the final stages it can be something as simple as
making sure that there isn't a visual glitch in a particular feature.

Throughout that process we involve different people, to guarantee that we're
taking steps in the right direction. The designers themselves are usually the
first critics, iterating on their own ideas. They eventually validate their work
with the creative directors, who ensure not only that the features are "fun",
but also that they fit within the vision of the game. In the end, the best way
to know is to involve the players, which is what we do with playtests, from
which we are able to collect different metrics and valuable feedback.

> That seems to be a great approach to ensure you are delivering _value_. How
> about quality? What processes do you employ to ensure quality?

The most basic is mandatory code reviews, and we encourage people to request
them from the person that would provide the most valuable feedback. This means
that it could be a junior, a senior, a lead or someone in a studio in the other
side of the planet. Often it's a group of those.

We also do requests to the devtest team with a varying frequency depending on
the stage of the project. In early prototyping stages it's more important to
prioritise iteration speeds, so we don't do them very often. As we get closer to
release, it becomes more and more important to keep stability, so we increase
the frequency and usually make them mandatory before submit. Like the reviews,
people are encouraged to request devtests to the teams that are more familiar
with a given feature, even if that means requesting a devtest in another studio.

With or without our requests, the devtest team is responsible for regular tests
on the builds and reporting problems. They organise their work such that they
are able to regularly test specific features and also entire slices of the game.

Finally, we also do software testing. Because gameplay emerges out of the
interaction of different systems, I'd argue that categories like unit testing
and integration testing are not the ideal tool for the job. The most interesting
to me as a gameplay programmer are functionality tests, which allow us to create
real gameplay scenarios and verify that the outcomes are what we expect. This is
particularly useful in a multiplayer game like Skull & Bones because we can
easily set up scenarios with multiple players without actually asking other
people to help. And of course, we can automate these.

> That process seems to be very fine tuned. And that means that teammates need
> context. How do you onboard new teammates?

We have a few different layers of onboarding. Part of it is organised by the
leads, but a lot of it is driven by the individual.

Some of the mandatory material includes documents and presentations on the
company culture, on the creative vision of Ubisoft and on the general
development process we employ in the different studios. We also give a
high-level overview of our engine and pipeline, as well as a presentation on C++
topics that are particularly relevant for gameplay programmers.

Once the new team members have that, we move on to a practice task that involves
implementing a made up feature. This way they are able to practice in a
situation as close to reality as possible, but in a safe environment that allows
us to easily intervene and guide them in the right direction.

With that done, we move on to actual tasks. We start with less risky ones and
try to progress in risk and difficulty as the person develops.

> That sounds great. How about keeping a team healthy and growing people? What
> do you do in that regard?

For me it's very important to keep a cohesive team where everyone is motivated
and able to rely on everyone else. I apply a few simple measures with that goal
in mind.

For any given system we're working on, I always involve more than one person. I
find that there is a natural tendency to do the opposite, but I don't like the
results. It usually starts simple, with reasons like that person having the most
experience in that area, but soon it escalates and the system becomes so complex
that only that person can work on it. Instead, giving a system to different
people encourages them to communicate and to rely on each other. Also, it often
brings more and better ideas to the table.

Whenever someone comes up with such an idea or excels in a particular task, I
make sure to praise them not only personally but also during the weekly team
meeting. This gives everyone a chance to learn by example and also reassures
people that their efforts will be noticed. If someone is underperforming or has
made a mistake, I prefer to give them feedback in private except in situations
where the whole team can learn from it.

Another topic that I try to carefully balance is decision-making. Everyone has
been in teams where they feel their manager is making the wrong decisions or
where they feel that they don't have the power to contribute anything relevant.
My way of dealing with it is simply to involve everyone in the decision making
process. Whenever I have to make a decision for the team, I involve at least one
person that I know can help with the topic at hand. Different people naturally
become more proficient in different topics, so everyone gets a chance to
participate. The same goes the other way around. Whenever a team member needs to
make a decision, I encourage them to consult me and/or anyone on the team, but
whenever possible I leave the final decision to them.

In terms of growing people, we have some standard practices like organising
trainings on different topics and sending as many people to conferences as
possible. Once per year, the lead is responsible for gathering peer feedback on
each individual and for summarising it in a few strengths and areas of
improvement. He is also responsible for discussing these with the team member
and to agree on a development plan for the following year. What I do in order to
be sure that the development plan is being followed and updated is to organise a
monthly 1-on-1 meeting. In that meeting I give feedback on the recent events and
give people an opportunity to talk about their goals and state of mind. I also
take it as a chance to ask for feedback on myself, the team and the project.

> That sums it up. Great practices indeed. To complete this interview, could you
> share what kind of topics would you like to know about more, regarding
> engineering management? And what about suggestion someone that you know for a
> future interview at the blog?

My main focus right now is in learning the best ways to improve the productivity
of my team and of the whole game development process, specifically in regards to
adapting to bigger, more complex games. I see a lot of topics in this blog that
can help me with that and I'll be sure to keep following closely!

For a future interview at the blog I nominate [Antão Almada](https://www.linkedin.com/in/antaoalmada/), who was my team lead
at YDreams and who is among the top programmers I've had the privilege to work
with.
