---
title: "Five technical layers of successful engineering projects"
date: 2019-05-25T07:31:23+01:00
categories: ["Technical Leadership", "Ramblings"]
small_images:
- "/img/values-and-habits.png"
---

<img src='/img/values-and-habits.png' style='float:right; width:200px;margin-left:15px'/>

people is the most interesting thing. I like to try to map how successful a
project is being by five layers that we can rank. Each layer should have a score
and ultimately they depend on each other.

<div style='clear:both'></div>
<!--more-->

## Correctness

tests
defensive programming (get away from nils, and defaults)
fail fast
exceptions with context
build pipeline that is trustworthy

How confident are we about the code base, the tests and the build pipeline?

5 - We could change an arbitrary line and push it to production with our eyes
closed. If we have a problem, the build will pick it up and prevent the deploy 1
- It's easy to change something and break production, we depend a lot on peer
reviews for catching problems

## Maintainability

Is it easy to add new featues
It is easy to _change_ new features
How much business context do we need?
How much technical context do we need?
Do we have dependencies that are black boxes?

How easy is it to add or change functionalities?

5 - Code is very simple and prepared for changes 1 - We'll need to gain context
on the project, there are several black boxes and the code structure makes it
hard to change things

## Monitoring

Is it easy to know what's going on in production?
How is the healthiness of the system? instances, queues, ...
Do we have alerts that warn us
If somehing in the logic is broken, how easy is it to gather information about
the problem?
How easy is it to replicate the problem

How easy is to know what's going on in production?

5 - Super easy, we can see what's going on, the healthiness of the system and if
something goes wrong we can easily get that information and know where's the
problem
1 - No help here, we'd need to poke logs or the database

## Performance

How prepared for the current load are we? Do we have the ocasional performance
bottlenecks? Do we know the risky spots and how to address them?
Forecasting: what can we do today to support the load of tomorrow?

How much performance issues do we have with the component?

5 - The component is battle tested for the load from 2 years form now
1 - Will struggle under above average load

## Chaos

complacentement because everything is ok
we need to introduce chaos engineering
train incidents
try to break the other layers




Summary

Missing security
