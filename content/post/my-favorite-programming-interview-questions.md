---
title: "My favorite programming interview questions"
date: 2019-02-19T20:17:51Z
draft: false
categories: ["Programming", "Recruiting"]
small_images:
- "/img/onboarding-template.png"
---

<img src='/img/onboarding-template.png' style='float:right; width:150px;margin-left:15px'/>

It's common for companies to have a set of technical questions to perform at
programming interviews. We may have a set of generic questions, and also
questions specific to the language and technologies we use. Having this _script_ of questions is
great for having a common ground between different interviews. If we _always_
ask the same questions, it's easier to compare candidate performances.

With time I've came up with my own set of questions. I have a different _style_.
I favour open questions that let the candidates talk freely about their past
experiences.

<div style='clear:both'></div>
<!--more-->

## Breaking the ice

But I usually start with _small talk_. I'll try to make the candidates at ease.
Being at an interview can be a stressful event. And I want candidates to have a
great experience. Some steps to try to break the ice:

* Asking if it was it easier to get here?
* Offering coffee or water
* Presenting myself (and other interviewers); talk a bit about what we do
* Give a small overview of the _agenda_ of the interview
* Explain that there are no right or wrong questions, we're just getting to know
  each other and if we would be a good _fit_ together

I'd aim for some laughs and try to make the candidates comfortable.


## Passing the mic to the candidate

Then I'll _start_ with my script. I'll ask several open questions and then I may
pick some subjects up and ask for more detail.

* **Can you say what was the project that you are most proud of working at and why?**
  This should move the conversation to familiar ground. Candidates should
  have good memory of their proudest moments. This will also allow me to have a
  sense of how much experienced are candidates. If candidates mention some
  tricky challenges I may ask for more detail to try to understand. At no point
  I'll question them or show disagreement.

* **If you had the power to do anything on that project, what would you do?**
  At this point I should have a grasp of how experienced is the candidate. Now I
  want to assess if the candidate is a _visionaire_. We may have developers that
  focus on following a backlog or have other parties defining that they need to
  do. This question makes them consider what would they do if they were on
  charge. I'm looking for people that have a vision and that would be able to
  see it through.

* **Can you tell us about a complex problem you had to solve, and how you did you do it?**
  Now I aim at problem solving. Specific hard things that the candidate had went
  through. I'll try to check if the candidate uses more _I_ or _we_, and if
  candidates accept responsibility of problems.

* **And what about something you did that was a total failure?**
  Being able to say I don't know and [admit
  failure](/post/postmortem-culture/) is important to me. We're
  usually at ease to talk about our successful achievements. But being open and
  talking about our mistakes and how we learned from them is very important.

* **Imagine that at some point you see yourself with a task that takes 2 weeks,
  but you have a deadline in one week, what would you do?**
  Now to see how the candidates handle pressure and manage expectations. This
  will show me how mature are the developers. [Dealing with deadlines](/post/dealing-with-deadlines/) is something
  that we need to do in a productive and healthy environment. I'll also search
  for resourcefulness here and [work smart versus work
  hard](/post/work-smart-vs-work-hard/) mindset.

* **What would be your ideal development process, from getting a feature to
  deliver it with quality?**
  It's important to be [aligned on
  values](/post/most-effective-way-values-habits/) and development process. With this
  question I'll understand what's the favourite working flow for candidates. How
  (and if) they value quality, team work and expectations. How similar this
  process is already to ours, etc. Then I usually also present our own
  development process.

And this is it. These simple questions should allow for almost one hour of
conversation. I'll be able to see how candidates communicate. Are they vague or
straight to the point? Are they humble?

One concern that I'll have is to adapt the flow if the candidate is too shy or
nervous.

## Going technical

I may actually need to go technical. This will happen if I can't have a sense of
how experienced the candidates are from their answers. This is common with
graduates for example. In these scenarios I also have a flow of questions.

* **Imagine that you have a task to build a `HashMap` class. How would you do
  it?**
  This will allow me to have a sense of the candidate's proficiency with
  collections and algorithms.

* **What would be a good hash function?**
  If the candidate is at ease, I'll try to make questions related with the hash
  function. How to balance it and what to do when we need to increase capacity.
  I don't expect straight answers here. It's not that common that we need to
  implement these things on our day-to-day. But this allows me to see the
  reasoning and if the candidate detects some problems.

* **Now you have this class being used by several projects. But you have a
  change request: we should be able to obtain the values in ascending order.**
  Change is inevitable. We'll always have to deal with it. Does the candidate
  focus on maintaining compatibility with the current projects? What solution is
  proposed: another method? A derived class? A wrapper class? Is the use of a
  tree suggested? Any resemblance with a database index?

* **We have a bug report. The class isn't thread safe. What should we do?**
  This will allow me to sense how proficient candidates are with multithreading
  and concurrency.

* **Now the data on the hash map is starting to be huge. What to do if that data
  doesn't fit in the memory we have available?**
  Well this will allow for much more conversation. At this stage I'll be looking
  for concerns and mostly trade offs.

These questions allow me to cover lots of topics while keeping the candidate
talking and leading. Again, I focus letting the candidates to all the talking.

## Summary

I try to focus on generic concepts. These interview questions are technology and
language agnostic. I'm more concerned with understanding what is the candidate's
drive. Everything else is a matter of context and an
opportunity for [learning](/post/learning-index/).

Being a fit is very important. It's never about the candidate being _good_ or
_bad_ but rather just a measure of how well we'd work together. How much value
would the candidate bring to the team. And sometimes having people completely
aligned is great. But on the other hand, having people aligned in processes and
mindset but from a [completely different background](/post/from-rails-to-clojure-to-java-to-rails/) brings a fresh perspective
and may [question our
beliefs](/post/how-to-convince-others-that-we-are-right/).

As a last interesting remark, note that the first set of generic questions can
(and should?) also be presented by the interviewee to the interviewers. This is
actually a sign of maturity. Mature developers will try to understand as soon as
possible if the company is a fit. In fact, sometimes I see experienced
candidates _leading_ the interviews.
