---
title: "From Rails to Clojure, then to Java, then back to Rails"
date: 2018-03-18T10:36:55Z
draft: false
categories: ["Ramblings"]
tags: ["Clojure", "Java", "Rails", "Ruby"]
---

![Rails Clojure and Java](/img/rails-clojure-java-rails.png)

In the past 6 years I've worked on web applications in Rails, Clojure, Java and
back to Rails.
This is an overview of these past years, the benefits of working with such
different tech stacks, and also it's drawbacks.

<!--more-->

# Overview of the languages and projects I worked on

## Rails 2.3

This was a big project in Rails 2.3. It was the typical Rails monolith that had
gone out of control. It had +1K endpoints and used lots of gems. It was actually
impossible to upgrade because of dependencies. At some point it had several
maintainability and performance issues, as we would expect from a fast go to
market approach.

But the team focused on turning the ship around. We started following 
clean architecture's guidelines. We used presenters, interactors and repositories.
At some point I believe part of the code base was actually enjoyable and properly
built. The amount of bugs and performance issues hugely declined and we were
proud of it. But we had only touched maybe 40% of the application.

At this point I started to search for other tools. I went searching for something
that would be more adapted to what I wanted: productivity,
code quality and performance.

## Clojure

I had the opportunity of bootstraping a new product and was lucky enough to do
it in Clojure. This was a huge shift, going to a new programming paradigm, in
a language that has an _alien_ syntax. Without a doubt that Clojure is my
favorite programming language. I've learned a lot and even today I follow the
community because of the huge amount of innovation that comes from there.

We implemented a web api with several bounded context services. We used async HTTP
and async communication to the database, making the server fully async end to end.
Everything was fast and we were very productive, and were constantly learning.

Not everything was great. Hiring was problematic. It was complicated to find
people that knew Clojure or even that were willing to learn. And bringing people
from other stacks always had a big ramp up.

But my main issue with the product was that the business wasn't scaling. There
we had what we thought to be a good architecture and good implementation, but
it wasn't being put to the test.

So I started looking around. This time I wanted a big scale project. Work with
big data, whatever the language.

## Java

I found a company that had huge scale projects, and they use Java. At
that time I didn't care, I assumed that I was going to use Java entreprise-ish
tools and that it would be a huge shock coming from two dynamic languages. But
I was willing to learn and the company bet on me.

Fortunately the Java projects were not entreprise-ish. They were very lean and
actually very similar in architecture with what I had worked on before. They
had a layer just for HTTP handing with "controllers" and JSON serializers. They
had a layer just for business logic, etc. And using Java 8 was actually good
because I could use several constructs that I learned from Clojure.

In fact everything was more strict. Having to define POJOs for all concepts was
cumbersome. But I actually didn't fell that productivity slowness that I heard
about so many times on Rails and Clojure communities. I was actually fast and
productive and I was liking to program in Java 8. It was much more verbose
that's true, but a good IDE helps a lot on that matter.

At some time I thought that the Rails community could actually learn a lot from
the Java community. And vice-versa. For example, in Java you take your time
to define your models and document them. And Java developers would be proud of
that and say to me: _"you didn't have this at your dynamic languages, how could
you do a refactor and know that everything was ok?"_.

And this is true. I did a couple of product wide refactorings. The IDE helped
a lot and when everything compiled (something that was not always easy to
accomplish) I was in fact confident that everything was ok.

But the funny thing is: it was _very_ rare for me to need to perform these kind
of huge refactorings on dynamic languages. While is true that dynamic
languages could gain to have more definitions on the data and models used, the
fact is that when you program on that environments you build code that **is easier
to change**.

## Rails 4.2

And here I am again on a Rails project, this time using Rails 4.2. After a
couple of weeks getting back on the horse, there's one thing I feel: programming
in Rails 4.2 is the same as programming in Rails 2.3. I'm not saying that there
aren't improvements. What I'm saying is that from my perspective, from someone that
doesn't quite remember the Rails 2.3 old days, programming a rest API in Rails 4.2
practically feels the same.

And that makes me wonder: if I don't see huge changes, why is it so hard to 
do upgrades? Why are there so many breaking changes? This is something that
clashes with the Java and Clojure ecosystem where they have a huge focus on
backwards compatibility.

Another thing I'm getting is that the new kids won't like rails, and it's being
harder to hire. Now the cool kids prefer Go or Elixir and frown at Rails. Honestly
I wasn't expecting that.

Anyway, I do believe that having a good team and a good problem to solve are the
main requisites for great programming. And I'm eager to put Rails to the test
and try to take the most out of it.

# So, what have I gained from using so many languages?

Having worked on several ecosystems really opened my eyes and made me consider
several ways of doing things. It's all about the trade-offs, and as an
Engineering Manager I have to gain from being able to review code from an arbitrary
stack. I may not be the best low level reviewer but from what I learned I
do have lots of inputs to provide.

* **From Ruby:** Huge focus on easy to change software, go for small functions
  and small classes. Make your code easy to read and to understand. Focus on
  strong object oriented programming. Let's try to make code that is easy
  to change by default.

* **Clojure:** considering the difference between being easy and being simple.
  Clear difference between data and logic that changes that data. Distinction
  between pure functions and functions with side effects, try to separate them.
  Let's try to make simple code by default.

* **Java:** performance, concurrency and strictness. Don't forget your logging
  and exception handling. Let's try to make fast code by default.

For an Engineering Manager position, I believe is a must, and I feel that I
have more insights because all those different experiences I had.

## And the drawbacks?

Having knowledge of several languages does make me more versatile. But also makes
me less proficient and skilled at a particular language. It's more complicated
for me to get a job as a senior engineer. I did apply for a senior position
some months ago and while I was proud of my challenge, the company choose not
to bet on me. But after consideration I realised that I failed on the _"is this a senior
developer"_ test.

Companies expect a seasoned developer at a specific language to have some kind
of traits, skills and knowledge. For example:

* **Java**: logging and exception handling is very important, don't use raw
  strings as constants, write good documentation. Be familiar with concurrency
  in Java, the Java Memory Model and how the GC works.

* **Ruby/Rails**: know inner rails details, know about the clean architecture, write
  code that is easy to change. Write fast tests.

* **Clojure:** high level functional programming, high level concurrent programming
  in Clojure: channels, transducers, etc...

* **Game Programming**: matrix multiplications may be faster than an `if`. Work
  with memory blocks that are near to each other because of caches, linear
  algebra.

And it's understandable if a company doesn't want to bet on someone that is
seasoned but that will have a ramp up. So if you want to switch area or stack,
my advice is to go for a mid-level developer role. Start from behind and
get up to speed quickly.

I remember a time where I was a game programmer. I was already an experienced
developer but I was a junior game programmer. I had a bug on my code related with
an object's rotation. A teammate just pointed out to me and gave me the solution.
But I just didn't have the _"brain muscle memory"_ to process that information
quickly.

Being a specialist demands lots of time doing the same thing. There are no
shortcuts.

# Summary

There are several layers of knowledge we need to work on a project. While
[learning languages is difficult](https://www.youtube.com/watch?v=6Oi8_eCaBGY),
there are much more things that we need to know.

* Knowing the language used
* Knowing the build tools used (maven, npm, lein, bundle, ...)
* Knowing about the datastores used (postgres, mongo, elastic, cassandra, ...)
* Knowing how to put the project in production and what are the best configs for it
* Knowing the structure of the project, where and how things are implemented
* Knowing the business logic of the application

So, the language is just a small part. I actually believe the tooling and the
overall ecosystem are more time demanding to learn.
