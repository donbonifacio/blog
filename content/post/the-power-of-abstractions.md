---
title: "The power of abstractions"
date: 2018-10-16T18:02:43+01:00
draft: false
categories: ["Code Quality", "Code Reviews", "War Stories", "Code Stories",
"Programming"]
small_images:
- "/img/development.png"
---
<img src='/img/development.png' style='float:right; width:200px;margin-left:15px'/>

The other day I was doing a [code
review](/post/high-throughput-pull-request-reviews/) and noticed that a mechanism for _i18n_
was added to a new project we're working on. There was a line like this:

```js
{ key: 'something',
  label: i18n.t('something'),
  value: i18n.n(user.salary, 'currency')}
```

This is very simple and common I'd say. Even so I left, as I so usually do, a
suggestion as a comment:

> Suggestion: wrap `i18n.t` and `i18n.n` in an abstraction that we control.


<div style='clear:both'></div>
<!--more-->

The other developer asked for more context. Why would we need those functions?
Would they just call `i18n.*` directly? What would we gain from it?

And I had that funny feeling where I knew that we'd get something to gain from
that change, but [couldn't remember an example for
it](/post/code-patterns-that-are-a-recipe-for-trouble/). I did say that we'd be
coupled with an implementation that we don't control, and that we could be hurt
by typos. But honestly that didn't sell my case.

## The downside of abstractions

I then started to consider a new _challenge_ that I'm aware of, that relates
with the quantity of things developers need to
[learn](/post/learning-index/) to get the [necessary
context to be
productive](/post/ama1/#ygor-how-do-you-measure-your-projects-performance-and-success).

We build abstraction upon abstraction and that means that new developers will
need to learn it all. This is a nice example. Other developers could be very
familiar with the `i18n`'s library and its API. But if they get to the project
and see something different, they would need to check it out and learn how to
use it.

And this compounds... abstraction after abstraction. How can we make projects
more simple to [onboard](/post/onboarding-template/)? What's the cost of our
abstractions and how can we minimize it?

It's not that abstractions don't have their value. They have a huge value. They
represent knowledge that we wrap under a concept and allow us to be more
productive and succinct. But then we have the knowledge trade-off.

## Why would this specific abstraction be useful?

A couple of days after that pull request discussion I remembered why I felt the
need for an abstraction on the _i18n_ layer. I worked on a project before
related with invoicing and we had support for several languages. Some day we got
this feature request:

> We now have accounts that have specific tax constraints. So if an account is
> from type A or B, instead of the label 'Tax' we want to display 'Tax B'.

This was a huge project and had this label everywhere. Sometimes the tokens were
dynamic, so a simple search and replace didn't fix it. It actually took some
weeks of user bug reporting until we got the feeling that everything was covered.

If we had this abstraction if could easily act under it:

```js
function translate(account, token) {
  const resolved = operate(account, token);
  return resolved || i18n.t(token);
}

function operate(account, token) {
  if (account.underSomeCondition() && token == 'culprit') {
    return i18n.t('culprit.caseA')
  }
}
```

This is a raw example. I wouldn't do this way: it wouldn't scale on complexity
and we'd have to test things on each token resolution. But it proves the point
that the abstraction gave us options. I would use this temporarily to log
whenever we had that scenario. And then would update the caller code:

```diff
- i18n.t('culprit')
+ taxLabel(account)
```

With a good [test coverage](/post/100-percent-test-coverage/) maybe we'd get all the occurrences just by running the
test suite.

## Summary

Our experience transforms the way we do things. Sometimes we get the urge to
_over complicate_ because we've been in situations that turned out be be more
complicated and we weren't prepared for that. We can't have it all:

* Code that is prepared for every new change request we'll have
* Code that is very direct and straightforward but hard to change

Writing code that is easy to change and ages well is hard.
