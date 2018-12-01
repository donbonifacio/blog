---
title: "Consultant interview: Erik Dietrich - DaedTech LLC"
date: 2018-12-18T18:21:23Z
draft: false
categories: ["Interviews", "Consultant Interviews"]
interviewee_name: "Erik Dietrich"
interviewee_role: "Consultant"
interviewee_company: "DaedTech LLC"
small_images:
- "/img/erik.png"
---

<img src='/img/erik.png' style='float:right; width:200px;margin-left:15px'/>

Erik is the author of [DaedTech](https://daedtech.com/), a blog about software
stories that I follow. He has published several books, being
[Developer Hegemony: The Future of Labor](https://www.goodreads.com/book/show/35051753-developer-hegemony?ac=1&from_search=true) the latest.

On this interview we discuss topics that go from strategic decisions regarding
code bases, guidelines for building software, how to deliver features with
quality and how to make developers more valuable.

<div style='clear:both'></div>

<!--more-->

> Hello Erik. Can you introduce yourself and talk a bit about your background
> and what you do?

Hello, and, sure, happy to.

My name is Erik Dietrich, and I'm a career technologist with sort of a wide
ranging background.  I went to school for computer science as an undergraduate,
which led to a fairly predictable career as a software developer.  I did that
for about 10 years, kind of working my way up the career ladder, while also
getting a master's degree in computer science as well.

Eventually, I wound up in management and eventually a CIO role.  It was in this
role and after about a decade in the corporate workforce that I decided I wanted
to go in a different direction.  So I left that to do some developer training as
well as IT management and strategy consulting.  

I did this for about 4-5 years, helping in a lot of capacities: training,
helping build org charts, advising CIOs, etc.  As time went on, though, I
started to develop a specialized practice using static analysis to help
leadership make strategic decisions about codebases.  It's kind of like
Freakonomics with codebases, I suppose -- putting data to things that have
historically been matters of gut feel.

While doing all of this, I blogged somewhat prolifically and wrote a couple of
books.  I started also to do freelance writing for tech company blogs and
realized after a while that this might actually be a good business model.  So in
the last couple of years, I teamed up with my wife (an editor and graphic
designer) to start a blogging agency that caters to dev tools companies, writing
technical how-to posts.

That was originally supposed to be complementary to my consulting, but it's
really taken off.  So that leads me to today, where I run two businesses.  I
mostly run this content agency while taking occasional codebase assessment
consulting gigs.

> Can you elaborate on static analysis to help leadership make strategic
> decisions about code bases? How does that work?

Sure.  This practice started out kind of organically during the course of my
management and strategy consulting.  I ran into situations where leadership
would ask for input onto critical decisions about codebases.  "Should we retire
this thing, or should we keep the lights on?"  "Will we be able to evolve this
into a web app, or would we be better off starting from scratch?"

Typically leaders asking these sorts of questions rely on a lot of anecdotes and
gut feelings.  The leader calls in the head architect or perhaps a consultant
and asks for opinions.  Data is typically scarce, and you hear general
assertions like "there's a lot of tech debt" or "we should be good because we
used X design pattern."

So I started trying to quantify some things, and to do a little bit better than
just anecdotes and interviews.  Using various tools at my disposal, I built a
practice around turning source code into data and mining that data for
direction.  

To make this a little more concrete, consider the "can we evolve this from a
desktop app to a web app" question.  I once had an engagement aimed at answering
this, among other questions.  So, rather than relying on simple code review, I
created dependency maps of the codebase to see which classes referenced
desktop-specific libraries and techs, and with what granularity.  

In that particular case, we found that something like 90% of classes in the
codebase were directly reliant on techs that wouldn't come along for the ride
with a move to a web application.  This type of data gathering makes it much
easier to build a case for (or against, as it were) evolving the code.  "You're
going to be spending an incredible amount of time disentangling the code from
the desktop libraries upon which it depends, so you'd be better off starting
with a new codebase."

That is one of the simplest examples I can think off of the top.  But the
general practice involves turning the code into data, picking things to measure,
and then relying on disciplines like statistics/regressions/data analysis to
help organizations make decisions about their code.  The static analysis factors
heavily into the data gathering part.  And altogether, this practice, while
obviously not perfect, is a lot more appealing and satisfying to decision-makers
than simply relying on people's instincts or on very rudimentary data.

> From your experiences then, can you provide some guidelines of best practices
> that try to facilitate those future decisions? Or better prepare a code base
> for them?

It's kind of hard to anticipate everything that a leader or a team might want to
do with a codebase.  But I can certainly speak to some practices that would
provide the most options.

And, for the record, these are practices that the team has to believe in and
embrace.  Even though my practice involves providing data to leaders in the
organization, I have a very developer-populist outlook, and I hate the idea of
management imposing gameable metrics to achieve some outcome or another.

Regarding specific practices, I'd definitely put having a healthy automated unit
test suite at the top, and probably one achieved by practicing test driven
development.  In [the most recent
study](https://blog.ndepend.com/unit-tests-desirable-codebase-properties/) I did
on unit tests, incorporating regressions on 500+ codebases, unit tests correlate
unambiguously with desirable codebase properties.  Methods and types are
simpler, better factored, and less (needlessly complex) leading to a lower cost
of ownership in the codebase.

This also lines up with my anecdotal experience as a consultant over the years,
for what it's worth.  I can't recall ever getting a call to help a department or
program get its application back on the rails and discovering a nice, healthy
unit test suite.  Automated unit testing is the hand-washing and flossing of the
software world.

Another practice that I'd cite as an important one may sound strange at first,
especially after "unit test."  But it's important.  Visualize your codebase.
And I mean, visualize your _actual_ codebase with its _actual_ architecture.
All too often architects draw up a diagram that looks like a nice, pleasant
layer cake, and dispatch that to the teams to implement.  This becomes the last
actual visualization on record, leading eventually to a situation where execs
see the layer cake diagram in meetings, but where the reality of the codebase is
a Death Star of hopelessly entangled dependencies.

So take the time to create a way to visualize your application's dependency map
as it evolves.  Ideally, automate this.  Take the results and put it in your CI
build report, or literally just print it out and paste it on the wall if you
have to.  But make sure the team always sees what the code actually looks like.

Here are another few that I can throw out, rapid fire style.

- First of all, avoid code generation as much as possible.  Only pain awaits
  down that path.
- Familiarize yourself with the Law of Demeter not as a dot-counting exercise,
  but as the "principle of least knowledge."  Extrapolate that to creating
  codebases where components are as minimally interdependent and minimally
  knowledgeable as possible.
- Avoid global state like the plague.  Nothing shreds a codebase's
  maintainability as quickly as global state.
- Think of your code, as you write it, in terms of "time to comprehend."  Always
  be paying attention to how long it might take a newbie to understand what
  you're doing.  Not only does this lead to easier knowledge transfer as team
  members come and go, but it also forces you to treat all of your code like an
  API or even a user interface, designing with others in mind and leading to
  code that conforms to the principle of least astonishment.

All of this sounds really granular regarding codebases.  But it all combines to
add up to seriously reduced cost of ownership and future flexibility.  If your
code is simple, easily understood, easy to reason about, minimally
interdependent, and nicely guarded by a test safety net, nothing the business
throws at you is impossible or even all that difficult.

> And going one layer above the code: what other practices combined will help
> delivering features with quality? For example, imagine that a team receives
> and idea and needs to build a deliverable feature. What would be an ideal
> process/flow?

In this arena, I'm speaking more anecdotally, based on my experience, rather
than my static analysis practice, which is more data-driven.  So, everything I'd
say here is with the caveat, "in my experience."

I really can't speak to an ideal process or flow, since I think this would vary
widely by organization, team, product specifics, and need.  That said, I think
you can draw a lot of lessons from the agile movement and then later from the
Lean startup and the so-called "Lean movement" in general.

To me, this doesn't mean "you should do Scrum with applied XP principles" or
anything like that.  Rather, it's using an arsenal of delivery techniques.
Define done before you start, relentlessly tighten feedback loops, favor real
data (e.g. A/B testing) over speculation, empower the experts close to the metal
to make decisions, implement things in thin slices and build on success, work at
a sustainable pace, etc.  

My consultative work has always been very context dependent, which is why I
don't really have a one-size fits all type of answer.  I do see a lot of
consultants around agile transformations, for instance, that are Scrum Certified
and that's always seemed a little "you've got a hammer so all problems are
nails" to me.  But for me, it's always been about landing in an engagement and
assuming that you're dealing with smart people who probably just need a bit of
outside perspective to spur them along.  So you see what they're doing,
formulate some ideas for new things they could try, and present those ideas.

> We've been talking about best practices for healthy teams and code bases. Now
> focusing on developers. How would you define a senior developer? And how can
> we train/grow developers effectively?

I've honestly never really been a fan of the "junior-senior" flavor of
developmental title qualifiers. I suppose that's a little pedantic, but it's
always kind of felt too reminiscent of being a kid in school.

Usually when orgs I've been part of or consulted for talk in terms of "levels"
of software developer, it's kind of a polite code for salary bands. The question
then becomes "how would you define 'developer that commands a higher salary'?" I
put it that way not to be gauche, but to reframe the question in the way I
actually end to think of it -- what makes a developer more valuable to an
organization (and thus worth paying more and, as a trailing indicator of that,
giving a better title)?

To an extent, of course, facility with relevant techs and general programming
skills matters. But I'd say that it's more kind of a case of table stakes. You
need to demonstrate a certain professional competence once you've been in the
industry a little while, and you should be able to do programming work without a
lot of hand-holding, and in such a way that you're delivering things that work
while not making a mess.

But I do feel like there's an industry tendency to over-value programming skills
into the land of diminishing returns, particularly at the expense of other
important qualifications. In a high-functioning team, I like to see developers
that exhibit leadership skills in the form of mentoring, leading by example, and
general uplift ability. I also think it's important to be savvy about the
problem domain and the business. However efficiently you might build something,
it's a waste if you're blithely building the wrong something.

So I think by emphasizing leadership and mentoring skills, you create a
situation where the growth of people with less experience becomes the natural
charge of those with more experience.

> How about an engineering manager? How can an engineering manager be more
> valuable for an organisation and for their teams?

Philosophically, I'm not really a fan of command and control, Taylor-esque
structure for managing knowledge work, such as software development. This is
admittedly a pretty abstract concept, though, so I recognize the practicality of
such positions, even as I let my leeriness of them inform how I think they go
well.

First and foremost, I think a good manager should assume responsibility for
removing blockers and obstacles from the team so that the team can work as
efficiently as possible. Secondly, I think a manager can use his or her
organizational authority to shield the team from dealing with an excess of
external politics or nonsense. And, finally, I think a good manager does well
with people development. Work with team members to create personal goals that
are both satisfying and aligned with the organization, and then regularly
measure progress against those goals. I think a good people manager makes sure
that the work is as satisfying as possible for people on the team.

Doing all those things turns a position of pure organizational overhead, and
thus a cost center, into something that multiplies efficiency.

> Thanks for sharing your ideas and points of view. Has a closing note, who
> would you suggest for me to interview next? And what topics would you
> expect to see covered on an engineering management blog?

Regarding who to interview, my content agency has a team of authors whose
experience runs the gamut from software developers, to org leaders, to
consultants, and they work for us as writers.  A lot of good perspective there
(http://www.hitsubscribe.com/the-team/).

As for topics that I'd like to see covered on a blog about engineering
management, I think I'd like to see peopled talk about why software seems to
invite disproportionately heavy management as a knowledge work profession.  With
other knowledge workers, like lawyers, architects, doctors, etc, you usually see
them set up firms and run those firms as partners and practitioners, delegating
non-core work to staff that they hire.  With software, this dynamic is almost
always inverted, where app dev agencies that sell software build layers and
layers of management _above_ the practitioners.  

I also really enjoy reading about non-traditional org and management models
(e.g. well-known experiments at places like Github, Steam, Zappos, etc.)  I like
reading about challenges to the status quo.
