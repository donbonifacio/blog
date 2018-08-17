---
title: "Manager interview: Hugo Lopes - James"
date: 2018-08-20T07:17:01+01:00
draft: false
categories: ["Interviews", "Manager Interviews"]
tags: ["Data Science", "Machine Learning"]
small_images:
- "/img/hugo-lopes.jpeg"
---

<img src='/img/hugo-lopes.jpeg' style='float:right; width:200px;margin-left:15px'/>

[Hugo Lopes](https://www.linkedin.com/in/hugodlopes/) is leading a Research and
Development department that interacts with a product team  at [James](https://james.finance/).

This is very
interesting. We're starting to have data science mentioned everywhere and it's
nice for Hugo to share his experience building a R&D department.

We talk about development process, onboarding, training, team management and team
performance.

<div style='clear:both'></div>
<!--more-->

> Hello Hugo, can you introduce yourself and talk a bit about your background

> and what you do?

Hi Pedro! First of all, let me thank you for the invitation to this interview.
I've been following your blog for some time, and it is quite an impressive
knowledge base.

My name is Hugo Lopes, and I'm currently the Head of Research and Development
(R&D) at [James](https://james.finance/), a Fintech company based in Lisbon, Portugal. We help financial
institutions make better and faster credit decisions by enabling the use of
Machine Learning and Artificial Intelligence at an enterprise level. Besides
that, I'm also a Data Science teacher for two institutions, [Rumos](https://www.rumos.pt/) and the [Lisbon
Data Science Academy](http://www.lisbondatascience.org/).

I'm an Aerospace Engineering by training with a double MSc degree from Instituto
Superior Técnico (Lisbon, Portugal) and Delft University of Technology (The
Netherlands). I graduated in 2011, and worked for about 4.5 years on my
formation field, in European Space Agency projects related to Astrodynamics,
Signal Processing, and Simulation. The projects were truly interesting, and one
of them was actually to create a software to work in a real space environment,
estimating the exact location of an orbiting satellite.

Despite all of these interesting projects, I decided I wanted to work on a more
product-focused company and put my hands on machine learning algorithms. I
always had in the back of my mind that the Data Science field was something that
would "boom". So, back in 2014, I started learning all I needed to make the
turn. I ended up joining James (formerly know as CrowdProcess) in 2016, as a
Data Scientist, to work on a hedge fund project. Subsequently, I started helping
with product development, mainly focused on the research and development of the
scientific backend of James (also the name of the product).

> That's a very interesting and broad background. How does your research
> department work and how do you interact with typical product development
> flows?

When I accepted the opportunity to become the Head of R&D team I thought I could
mimic some methodologies from big tech companies. Most of them do R&D, right?
However, finding a process-fit for our workflow was, and continues to be, one of
my greatest challenges. Agile methodologies are great for software development
teams but we quickly bump into two problems: the very broad scope of our tasks
and the challenging time estimation.

The R&D team is composed of data scientists and one data engineer. Literally
adopting the name "R&D" (Research and Development) we are a team that besides
seeking innovation for the whole company, we also develop product-ready code.
This might not look like a big challenge, but although most of the data
scientists we interview have great math/statistic background, they generally
lack knowledge on software development.

As I already mentioned, finding a flow that fits all cases is not easy but our
current workflow has the following structure:

1. Idea or request from Product or Financial Service teams.
  1. Output: prioritization and definition of task/story
2. Research: scientific papers review, market research, etc.
  1. Output: a knowledge document and development sketching
3. Development: prototype with benchmarking (quick and dirty)
  1. Output: benchmarking results comparing with other tools (the task might not
  go to the next step)
4. Development: code development for one of our libraries
  1. Output: product-ready code according to our standards
5. Code review by another team member and (very picky :) ) data engineer
  1. Output: delivery made to our code base, delivery to stakeholder
6. Dissemination: share what was done
  1. Output: mini-talk for the company,
  [whitepaper](https://james.finance/resources), [blog
  post](https://medium.com/james-blogs), external talk, etc.

One curious point is the last one. This is something critical when you combine
Data Science and R&D teams. We are transversal to the other teams, and it is
sometimes difficult for our colleagues to understand what we are really doing.
It is our job, as R&D team, to let all company know about our findings, e.g., by
the means of mini-talks, and make it easily accessible to anyone, by having a
public knowledge base.

Regarding the product development flow, we are frequently some weeks/months
ahead. We contribute in a dual way to the product:

1. Customer requests that become prioritized and the R&D team is assigned to
implement (we are responsible for the scientific backend of the product). We
typically have 1-2 weeks of buffer. For instance, one statistical test that
keeps on being requested.
1. Innovation: by talking with our customers and Head of Product we become aware
of the (broader) problems that our customers have and we seek a solution; or, we
come up with an idea no one was aware that will enhance the product. We
typically have, at least, one month of margin. For instance, explainability of
machine learning models (the so-called black boxes).

All of our work is regularly embedded into the Product roadmap. The first step,
which can be independent of the workflow step we are at, is the creation and
iteration with [wireframes](https://en.wikipedia.org/wiki/Website_wireframe).
The engineering team develops the backend (which link with our libraries) and the
frontend. Finally, the R&D team participates again in the last step (in a kind
of staging environment) where we verify everything is sound and clear -
scientifically correct.

> Can you talk a bit about your hiring process? Do you also target software
> engineers or do you try to find data scientists who code?

Our main focus is Data Scientists, but since we also develop production-ready
code, we also search for people with complementary capabilities in software
architecture and versioning, and test-driven development. Finding a person that
has knowledge in both fields is not an easy task.

We are very fortunate to have a great reach toward professionals with a culture
closely aligned with ours since we participate in many community events - take
for instance the [PyData Lisbon meetup](https://www.meetup.com/PyData-Lisbon/)
or the [Lisbon Data Science Academy](http://lisbondatascience.org/). We
generally publish our vacancies on our website, social media (LinkedIn, Twitter,
etc.) and check references from our own colleagues.

Regarding our hiring process, we have a first pre-screening stage where we
verify if the candidate has what it takes to fill the vacancy. This is generally
done through a questionnaire they have to fill upon application. If so, the
candidate can then demonstrate his/her technical capabilities in a home
challenge assignment. A lot of candidates drop-out at this stage, since they
have to "spend time" demonstrating they want the position. If the challenge is
successful, there is an in-person interview (of about 1-2 hours) where we
evaluate knowledge and reasoning capabilities, passion, and communication
skills.  In this get-to-know interview, we also access if there is a cultural
fit (although it's pretty difficult to assess that in just a couple of hours).

I think it is worth mentioning that we have an internal Data Science Academy
where new colleagues can bridge-out some missing knowledge they might have.
There is no such thing as Data Science unicorns.

> And when you welcome a new member to the team, do you have special concerns
> regarding the on-boarding process? How can you make sure that newcomers get up
> to speed quickly and smoothly?

Our onboarding process went through a refactor very recently. We learned from
our own mistakes in the past. Well, lack of action and consideration for this
important stage... Consequently, we created an onboarding guide, that all
managers have access to, where we have things like: "decide on person seat"
(yes, it happened before), "have a computer set up on first day", "present the
new person to the other teams during the first week", "make sure the new person
is invited for lunch every day", etc. Some of them are pretty obvious and common
sense, but having this as a checklist makes sure we don't forget any of them.
Also, common sense doesn't mean everybody does it.

One curious thing we internally created is to assign a "buddy" to each new
colleague, i.e., a person that has more than 6 months of house experience and
should come from another team. The buddy's main responsibilities are to make the
new colleague feel comfortable, integrated into our culture, and show how
things work around. So far, it has been a success.

Then, in relation to the technical part, we have an internal training system
where the person can bridge-out the technical weaknesses related to what we do
in our team. In general, the new colleague is given some time per week, for at
least the first month, to make sure his/her knowledge is sharp. Again, we aren't
expecting to hire unicorns. Regarding integration with our workflow, it is
easier to get used to it by direct observation and experimentation (e.g.,
recurrent meetings) than by any kind of slides presentation and documentation
reading. In about two weeks, the person is fully integrated.

> That seems to be a well thought out process. That's great and it's not that
> usual. After having the team assembled we need to make the team healthy. How
> do you make sure that the team is productive and happy?

As a starter, in order to be productive, you have to define what is considered
“one-unit” of productivity for your team. It might be a new functionality or it
might be something related to business metrics. In the end, a person might have
a very intense day of work, and be doing everything right, but, is that person
doing the right thing?

I remember when I was learning Calculus at Instituto Superior Técnico (Lisbon).
The classes were pretty daunting (probably, most people felt the same as me)!
Looking back now, one of the main reasons for my low productivity (learning
amount per class) was not knowing “why” I needed to learn what was being taught.
Today, I know that if we understand the end goal (e.g., application of a
function) it is much more motivating, and helps to be on track. I try never to
create a task without the reason "why it exists" made very explicit.

Another aspect related to both a happy and productive team, i.e. a functional
team, is related to trust among team members. Without trust, teamwork is all but
impossible. Team trust can be represented by easiness to ask for help, admit
weaknesses and mistakes, etc.

When a team is built upon trust, team members do not have fear of conflict
during discussions, which is particularly important in an R&D team. Topics
should be discussed with sincere arguments - productive conflict should exist,
not destructive fighting and interpersonal politics. When you trust your team
members you can have this kind of conflict, without fear of your opinion being
scrutinized.

Then, if the team is able to have this kind of productive conflicts, and
everyone's opinion was heard, you can avoid the lack of commitment to group
decisions. Sometimes, your idea does not go forward, but if you feel your
opinion was heard and respected, then you more easily commit to the "team
decision", and you are also accountable for the outputs of that task. It is not
easy to arrive at this commitment stage but it is something every team should be
willing to.

Finally, regular one-on-ones, not always the kind of formal ones - in the
office, taking notes, looking serious - are important. Understand individual
objectives and fit them within the company goals is a difficult but necessary
task to be done.

> We can have a healthy team, we can have our well defined whys, but how can we
> know that we are being productive and adding value? How to measure team and
> individual performance?

Personally speaking, I've worked before in a system where we had yearly
performance reviews and individual assessments. We were a team of four aerospace
engineers. I've to say that none of those assessments actually provided value
for me or for our team. Yearly objectives were too broad and they focused too
much on individual success when what we actually needed was to have a [great
team
output](https://medium.com/startup-patterns/the-dangers-of-measuring-performance-d21cd61426df). 

So, I try to bring this personal (bad) experience and focus on team performance.
As an R&D team, we need to make sure our outputs do not end up in a drawer (it
happens more often than I like to admit). They cannot be too exotic, nor too
simple. They must be right on the spot - to be used as internal tools
(leveraging other's work) and/or integrated into our product.

I've seen some pretty bad evaluation metrics, that I think don't bring any value
at all for a company. Take for instance:

- Lines of created/changed code. The "less is more" expression can easily apply
  here. More code and/or more changes generally bring the debt of more code
  review and more bugs.
- The number of created features. We can create five really nice features, or we
  can create one full solution. For instance, we have one explainability
  solution of complex models, with some features (we don't even count it).
  Especially in AI, you should aim to have _less_ features, and more
  _automation_.

Well, not having specific individual performance metrics does not mean that one
member of the team can do sloppy work while others work hard. My main focus is
to develop incentives and evaluation structures around the team, not the
individual. Retrospectives on what's working and what's not allow everybody to
take a dent on that and contribute to our team productivity rate.

Now, we have concrete team performance metrics, which are:

* How many of our solutions were used?
* How often are our solutions used?
* How many of our solutions were included in the product roadmap / put into
  production?
* How many knowledge sharing initiatives did we perform (internally and
  externally)?

Frequent evaluation of the above metrics is key to understand if we're "doing
our job". Presenting them to the full team also makes our work much more
meaningful inside the company.

Finally, _adding value_ is closely related with the team performance metrics,
but sometimes (and unfortunately in my opinion) can be seen as more subjective.
We know we are adding value when our new solution is presented at conferences of
our field; data scientists from Financial Services team come to us asking
questions about the new tool (or simply raise an issue on GitHub demonstrating
they're using it); business development makes sure to include us in client
meetings to present our new solutions; and the Product roadmap has prioritized
our solution to be included next month.

> Thanks for you insights and for sharing your best practices. :) As a closing
> note: what kind of topics would you expect to see here on the blog about
> engineering management? And do you have someone to suggest for me to interview
> next?

Thanks a lot for the opportunity as well. It was a great experience to share my
insights.

I check your blog very often and I've to say that I already learned a lot of
things myself. As for topic suggestions for the future, I could recommend adding
more success stories, but I think the more insightful ones are those about
professional mistakes and lessons learned. People usually prefer to share where
they succeeded. Check, for instance, scientific papers. You don't see many
papers with the conclusion "To sum up, don't use this algorithm since it won't
significantly improve your results". It does not sound catchy, right?

However, in my opinion, the times we learn the most are the ones we go against a
wall. You usually never forget those moments. Sharing those experiences would
let others avoid paths that most certainly lead to failure.

As a suggestion, I can recommend [António
Alegria](https://www.linkedin.com/in/antonioalegria/) which is Head of
Artificial Intelligence at OutSystems. They are investing significantly in this
field. Also, [José Castro](https://www.linkedin.com/in/josecastro/), which is
now the VP of Engineering at James. He brought his huge experience from Sapo and
Talkdesk to structure and grow our engineering team. He's a great magician as
well. :)

Thanks a lot again for the opportunity to be here, and I hope you have great
success with your fantastic blog!
