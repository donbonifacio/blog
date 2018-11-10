---
title: "Developer interview: Andre Macedo - Mercedes-Benz.io"
date: 2018-11-13T07:34:13Z
draft: false
categories: ["Interviews", "Developer Interviews"]
interviewee_name: "André Macedo"
interviewee_role: "Software Engineer"
interviewee_company: "Mercedes-Benz.io"
small_images:
- "/img/andre-macedo.jpeg"
---

<img src='/img/andre-macedo.jpeg' style='float:right; width:200px;margin-left:15px'/>

[André Macedo](https://www.linkedin.com/in/andrecostamacedo/) is a software
engineer working at [Mercedes-Benz.io](http://www.mercedes-benz.io/).

In this interview we cover DevOps and how it solves comon problems. We talk
about delivering fast and with quality and what's needed to achieve that.

We also discuss how teams can deliver several features in parallel effectively
and about the definition of a senior developer.

<div style='clear:both'></div>

<!--more-->

> Hello André. Can you introduce yourself and talk a bit about your background
> and what you do?

Hi Pedro! First thanks for the opportunity for this interview!

I’m a Software Engineer since 2007 after my Master Degree in Informatics
Engineering from Universidade de Coimbra. I’ve worked mainly in Telco and Media
companies and more recently (~ 1 year) in automotive.

After spending some years working in various projects with different positions
mainly with waterfall methodologies I did a huge reflection and decided to start
some research in DevOps culture. After a couple of months in talks with friends,
trainings, conferences I realized the problems I faced during years could be
partially solve with a DevOps culture.

Currently I focus my research in technologies and techniques to reach Continuous
Integration and Delivery in large scale. Very focused on quality and automation.

In [Mercedes-Benz.io](http://www.mercedes-benz.io/) I’m working as Software Engineer on a product, but I also
support other teams in the daily basis trying to move the company to a DevOps
culture.

> Can you give some examples of the problems you faced that could be partially
> solved with a DevOps culture, and how?

I will give two examples, but I think I could give you more than ten: agenda and
responsibility.

Without a DevOps culture in a large company development and operations are most
of the times two verticals not sharing same management. Development wants to
deliver new features as soon as possible. On the other side, operations wants to
keep the environments safe, and don’t touch it sounds a good plan in theory.
Regarding quality, it’s more important for operations then development.
Developers does not feel the pain of deal with production outages, for example.
If we continue we will see that there is an agenda conflict.

If we use a DevOps culture, there is no space for an operations/ team to take
care of the issues caused by a development team. If they are on a single team,
most probably the quality will be better since developers does not like to spend
time in support. If they do a mistake, they will take care of it in the team.
The best is to do their stuff in a proper way at the first time. The entire
organization will benefit from this approach. The agenda is simple: deliver fast
with quality.

Another problem I faced is the responsibility. Sometimes we have problems which
are in a gray area. Could be a problem of the operations team which did not
execute a procedure in a proper way. Or could be the development team which did
not do a proper handover. It’s not easy to tell other teams they did a mistake.
And some companies do not like to assume their mistakes. This could lead us to a
ping-pong, which is sad, but I've seen it happen several times.

With a DevOps culture everything is with the team, and we do not waste time
trying to understand who should fix the mistake. The team will easily deal with
any situation because the knowledge is there. The team is the only responsible
for everything, and they are the best ones to deal with any situation.

> You talked about delivering fast and with quality. From your experience,
> what's the best process/flow to go from an idea to a feature in production
> with proper quality?

To deliver fast with quality we have to release our software very often (one
release per feature would be perfect). This means after finishing a feature we
can deliver it, which is fastest then wait for a bunch of features to be
included in same release. Globally (all features of the release) we also save
time because delivering every single feature reduces the risk of break something
which will save us our time. Another important thing is the feedback. A business
need may be valid when we defined ten features at the same time but may change
after delivering five of them (the priorities may change, and even the use case
according to user feedback). If we deliver every single feature separately we
are able to react more quickly, and this also speed up feature delivering.

Another very important aspect is automation. Any repetitive task should be
automated. A developer should be able to deliver a feature in production with
two or three single commits in a repository. Manual and repetitive tasks slow
down the process and also lead us to do mistakes (less quality).

Last but not least, we should also automate our tests. Every feature should be
delivered with automated tests which will ensure regression problems in future
release. There are a lot of techniques that can help us ensuring we have a good
test coverage.

In summary, the ideal pipeline would be:

1. Product Owner specify the feature
1. Developer implements the feature and tests
1. Automated deployments until test
1. Product Owner validation
1. Automated Deployment in production

> What kind of techniques can we use to ensure a good test coverage?

First, I would do TDD. This will not only ensure a good code test coverage (if
properly done, of course), but will also make us think and write all the details
as unit tests. With time, unit tests will become more and more organized and
important. Describing all the behavior in a unit tests before the code itself
will definitely lead to a good test coverage.

However, sometimes there are some edge cases which may not be covered for some
reason (a combination which we don’t think during unit tests). And these
combinations, sometimes, show us that we have some bugs on our code. This also
lead us to a situation where we may not trust our unit tests as we should. To
avoid this and ensuring quality in the unit tests, I would use mutation testing.
This technique will show us in fact what is being tested. I can have a code
coverage of 100% which in practice is 0%. A mutation testing code coverage of
100% will definitely ensure us the unit tests are covering most of the
scenarios.

Last but not least, we should define some threshold (for both code coverage and
mutation coverage) and the CI/CD pipelines should fail if it’s not reaching the
goal.

> You mentioned one release per feature. How would that work in a team doing
> several features that might clash somehow? How to incorporate maintenance and
> support patches? What's a good branching model to achieve it?

For the first question there is not an easy answer. It depends a lot on team
size, and the origin of the problems behind the clash. Sometimes we may need
even more than a release per feature. Conceptually is strange, but it works!
Imagine we have a feature where we are changing an existing user interface and a
service which exposes that information. If it’s not critical we can change the
service and start sending new information which is not yet processed by the user
interface. After that, we can update the user interface and start processing the
new information. Assuming we can’t do that (for business reasons) we can use a
feature toggle which is changed while releasing the updated user interface.
Another approach is keeping both services (with old and new behaviour) for some
time and change in the user interface during the release.

I would put maintenance and support patches at the same level of features (in
terms of release process). This is actually a good example that releasing very
frequently works. When I start my career as a developer one of the things that I
heard very frequently is the decision of fixing something in a patch or just
leave it for next release. The reason behind this decision is to avoid breaking
something in current stable version. And we end up reaching that just doing
small patches when it’s critical. If we put a lot of stuff in the patch may
brake something. On the opposite way, delivering small patches lead us to a
stable situation.

In terms for branching model I would use a trunk based development. A single
branch (master) and branches for feature or bugs which are directly merged to
the master.

> In your opinion, what's the definition of a senior/seasoned developer? What
> skills and traits do they possess? How do they make a difference?

For me a senior software engineer/developer has to be someone which is good
(really good) doing something (technical or not). If someone is just brilliant
programming is not enough for me to be considered a senior. Develop software is
a complex process and needs several different skills / knowledges to be
considered senior. Off course, any senior developer needs to be a good
programmer, but does not have to be brilliant, in my opinion.

A team needs different types of skills, and better people with those skills,
better the team will be. If a team is full of good leaders, we will have a
problem. Same with other skills.

However, there are some non-technical skills which are very valuable for me in
any developer: attitude, dedication and humble personality.

I think a senior developer make difference in a team if he is really good doing
something because others can learn with him and the entire team can grow with
someone which is really good on in a certain topic. If we do that in all skills,
the team will be good in “everything”.

> Thanks for answering my questions André. To close the interview, may I ask you
> what topics would you expect to see in a blog about engineering management?
> And can I ask you to suggest someone for a future interview?

Since most of the companies are trying to move to an hierarchy where products
are built by several small self independent teams, I think it would be
interesting to understand how companies deal with this in the daily basis
(aligning tech stack, global roadmap, dependencies between teams and so on).

I would suggest my colleagues [Alan Taylor](https://www.linkedin.com/in/algile/) (Scrum Master at Mercedes-Benz.io) and
[Diana Silva](https://www.linkedin.com/in/dianagrilosilva/) (Engineer Manager at Talkdesk).

Thanks for this nice interview!
