---
title: "Production incident's training program"
date: 2018-06-19T09:54:56+01:00
draft: false
categories: ["Mentoring", "Postmortems", "Utilities"]
images:
  - "/img/production-incidents.png"
---

![Production incident training program](/img/production-incidents.png)

Being on call can be daunting. Anything can happen in production and we may
be all alone and completely out of our [comfort zone](/post/comfort-zone-index/)
dealing with a problem we have no clues about, and with the pressure of
having the app down and impacting the business.

<!--more-->

# Introduction

There is no replacement for actual experience dealing with production issues.
We start building our toolbelt and can troubleshoot faster. But we should also
try to ramp up new teammates and give then the tools to be autonomous on
handling incidents. My proposal here is to _gamify_ this learning experience.

What do we need to be able to troubleshot production incidents?

* We need a good grasp of how the application works
* We need to know where are the configurations, access datastores and servers
* We need to know how to pull some health metrics and understand their impact

When we find the issue, then we can:

* Try to make some amend and put things online
* Figure out the root cause and plan to fix it
* Create a blameless postmortem

All this needs to be trained. My idea here is to setup a _game_ that will act
as a certification program for developers to be able to be on call and handle
incidents.

# Game

The team will setup a collection of environments that replicate typical production
incidents. This could be with docker containers, vagrant or even some on
demand cloud instances. Let's call these environments _levels_. Then the _players_
will get a random _level_ and will have to troubleshoot it while filling in
an incident report.

After that they will need to create a proper postmortem.

This will be an investment on the company/team. We're taking a proactive posture
here and allow the team to [learn](/post/learning-index/) more about incident
handling before setting them free in the wild.

## Tutorial

Before starting the game we should have a tutorial. One thing that I find very
useful is to have new developers configuring and putting up the application
from scratch. Could be just a `docker-compose` file, but with everything working.
For example:

* A node running the FE (maybe with a proxy)
* A node running the backend (or several nodes per service)
* A node per data store used

This will force developers to know how all the different parts interact and
connect. It will force them to know how to configure those connections and
know where are the configuration files.

Sometimes doing this can be tricky. We may not be able to boot the full application,
but we may boot just what we _own_. There may also be some teams that don't
have everything set up to properly boot the app with clean datastores. But
having these difficulties should be seen as a red flag. We should be able to
setup a new environment relatively fast.

## Levels

Each level should have very simple instructions.

* The command to boot the environment
* How to access the app
* How to access the instances
* A description of the problem

Then the _player_ needs to troubleshoot and understand what's happening. We
should also have:

* The code that was used

Because we may change the code to introduce problems. Is this fair? This will
add a lot to the trickiness of the problems. But the truth is: there could have
been some patch that introduced a bug. So changing code is fair game. Let's
give them access to it.

Next we have several suggestions of replicable problems that we can use for
levels.

### Database is locked with schema change operation

There are some processes that automatically run database migrations on the
database. We may have a scenario where those operations are very slow and the
app is not responding.

* **Description:** we did a deploy, the application restarted but is not
  responding to requests.

We could simulate this with a migration that locks a table forever. When the
application goes up and tries to read from the database, it blocks.

Objectives:

* Check the application logs and understand if it booted successfully
* Verify that the application is not consuming CPU or RAM and is blocked
  on IO
* Go to the database instance and see the current running transactions
* Find the culprit and kill it

### Payload too large

This is more common in applications that support the upload of files.

* **Description:** we make an AJAX request to an endpoint, and nothing happens.
  The browser shows the request, but doesn't show the response.

We can setup the maximum payload size on our proxy. For example, this would be
`client_max_body_size` in nginx. This one is very tricky because browsers
[can't properly display this error](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size).

Objectives:

* Understand that the request is not logged at the application
* Understand that the request is logged at the proxy level with status `413 (Request Entity Too Large)`
* Patch the proxy's configuration


### Invalid CORS configuration

If we use a frontend on a different domain than the backend, we'll need to
configure [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS).

* **Description:** the application isn't working, the server is denying
  access for all requests.

We can change the CORS configuration to disallow the frontend's domain from
accessing it.

Objectives:

* Understand that it's a CORS problem and it's the backend that is denying
  the requests
* Change the configuration to allow the access


### Missing query index

The application may not be _down_, but can be very slow.

* **Description:** going to a specific page is very slow, it takes a lot of
  time to perform searches.

We can seed a database with lots of records and remove indexes that are used
to list that model.

Objectives:

* Understand that it's the database query that is very slow
* Perform an explain and verify that no index is being used
* Create a patch with the index creation

### Select number index

This one is similar to the previous one, but more twisted. The description
and the objectives are the same, but on this scenario we'll have an index
that should be used, but is not.

For example, imagine that we query for `sequence_number`:

* `select * from invoices where sequence_number = 1`

And we do have an index on `sequence_number`. But this will still be slow and
the index is not used. How is this possible? This is in fact possible if
`sequence_number` is of `varchar` type. On mysql the query works, the `1` is
converted to `'1'`, but it won't match the index.

So the fix is actually on the application:

* `select * from invoices where sequence_number = '1'`

This one is very tricky. 

###  Order by and pagination

Find some complex and heavy query that is used on the application and add
an `order by` to it. Or go to a search page and open page number 20K.

* **Description:** going to the page is very slow.

Objectives:

* Understand that the order by field should have an index
* Understand that even with the index, this is a [severe bottleneck](https://www.eversql.com/faster-pagination-in-mysql-why-order-by-with-limit-and-offset-is-slow/)

### Force restarts

We may have an instance that is restarted, but then the application isn't
automatically restarted.

* **Description:** the application stops responding.

We can create a _level_ that boots the application and then forces a restart
on the backend's node.

Objective:

* Verify that the instance is up, but the application is not
* Find out that there was a restart
* Figure out how to setup the instances so that the application is always up

### No disk space

Create an instance that has a full disk.

* **Description:** the application is acting very weird, sometimes things
  don't work.

Objectives:

* Verify the health of the instance
* Understand that the disk is full

### No available RAM

This should one of the most common issues. We have our app consuming too much
memory, starts swapping, and it's a mess.

* **Description:** the application is acting very weird, sometimes things
  don't work. And it's very slow.

Objectives:

* Verify the health of the instance
* Understand that the memory is full

### Something is eating CPU

I've seen this happen with a database backup what was being zipped on the
application server.

* **Description:** the application is very slow.

Objectives:

* Verify the health of the instance
* Understand that the CPU is being used a lot by some application

### No directory exists

The application may rely on some directory, for example a `tmp/` directory,
and my fail if the directory doesn't exist.

* **Description:** uploading a file yields a 500 error.

Objectives:

* Check the application logs
* Verify that the error is due to a missing directory
* Improve the code to properly handle this, by ensuring the directory is created,
  or using proper system tooling for temporary files.

### No write access to files

We could have the `tmp/` directory, but the application's running user isn't
allowed to access it. Or maybe to some configuration file.

* **Description:** uploading a file yields a 500 error.

Objectives:

* Check the application logs
* Verify that the error is due to permissions

### Mess around with time zones

If we have a page that lists data based on the current data, we can change
the time zone of the server and force some bugs.

* **Description:** we add users, but they don't show up on the list page.

Objectives:

* Verify that the users are actually being created
* Find out that the problem is due to time zoned

# Summary

Well, these are just some ideas. I'm sure you'll have much more ideas and
scenarios that are specific to the work you've been doing. But the main point
here is to build this _game system_ and allow developers to learn how to
troubleshoot production faster.

Even if we do have some _levels_ that are easier, developers will learn very
important things:

* How to find configuration files and common pitfalls
* How to quickly check the healthiness of the system and if something's up
* How the infrastructure is set and how all the parts interact

By forcing then to feel the _pains_ beforehand, they will better prepared for
prime time.


