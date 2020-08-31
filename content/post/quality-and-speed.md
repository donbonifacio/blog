---
title: "Quality and Speed"
date: 2020-08-31T09:00:03+01:00
categories: ["Ramblings"]
small_images:
- "/img/development.png"
---

<img src='/img/development.png' style='float:right; width:200px;margin-left:15px'/>

From the article [Is High Quality Software Worth the
Cost?](https://martinfowler.com/articles/is-quality-worth-cost.html) I found a
particular quote super interesting:

> Countless times I've talked to development teams who say "they (management)
> won't let us write good quality code because it takes too long". Developers
> often justify attention to quality by justifying through the need for proper
> professionalism. But this moralistic argument implies that this quality comes
> at a cost - dooming their argument.

This is something I can relate with. For too long I believed that I needed more
time to get things done better. And that's true to a point. If we're doing
craftsmanship, the more time we put into something, the more polished it will be.
Right?

<div style='clear:both'></div>
<!--more-->

## Is time the main requirement?

Let me post here something that was made for my youngest daughter's birthday.

<img src='/img/snowhite.jpg' />

One was [done by my
sister](https://www.instagram.com/p/CEfSjD_jkFS/?utm_source=ig_web_copy_link)
and the other by my niece. It's easy to see that we have a piece of work that is more
polished than the other one. The structure is similar but there are several
quality differences that are easy to spot.

Now, my sister did the best version of Snow White _much faster_ than my niece.
We can argue that the comparison is not fair, after all my sister has _more
experience and skills_ than my niece.

But I can also argue that _time_ is not the main requirement for quality. I
could say that my niece would not be able to achieve better quality even if she
had one more week or month.

## Is skill set the main requirement?

Okay, now lets play the devil's advocate on the skill issue. If we look at the
figure, we could say for example that the face is more detailed than the skirt.
So it's not just _skill_. With more time my sister could have done a better job
on the whole figure.

On software engineering we deal with a lot of different modules. We may have
ones that are more critical and need more attention. And we have other
interesting challenges. We could actually need to build several figures, we
could have several people working and need to coordinate them and make sure they
are all aligned and using the same standards, etc.

All this with a time constraint that wouldn't allow for a proper figure to be
built.

And lets not forget change requests. We can all relate with building a snow
white's face that is top notch and then the customer asks for Little Red Hidding
Hood.

## Where's the silver bullet?

Time does impact quality. If we gave a deadline of 2 minutes, maybe both my
sister and my niece would present us with the same output. On the other hand I
can also find examples of more skillful engineers taking longer on certain
tasks.

For example, lets consider a task to deploy a small script that does something
simple. Engineer A could do:

* Build a script
* Put it live

While Engineer B would do:

* Create a
  [RFC](https://engineering-management.space/post/rfc-driven-development/) with
  the plan and get it peer reviewed
* Come up with an incremental plan to release the task, bit by bit
* Create a proper CI environment and builds the project for every pull request
* Implement the feature with proper tests
* Get it peer reviewed
* Write some documentation
* Write a
  [postmortem](https://engineering-management.space/post/postmortem-culture/) if anything went wrong

Maybe I'm exaggerating, but you get the picture. There are many things we can do
to have more quality. The best 10x developer in the world would take more time
to deliver. Naturally the project would be much better to maintain long term.

## What's the sweet spot then?

Several of the challenges I mentioned are addressed by [agile
methodologies](http://localhost:1313/post/agile-continuous-improvement/).

I believe that all the coordination and project management are different
topics. So I'd like to focus just on the skill set part. Going back to the
original quote I don't agree that the "I don't have time for that" excuse is a
bad argument just because there's so much moving parts on a complex software
system.

But I do agree that sometimes we, engineers, hide behind that. We use that as an
excuse and settle for what we can do. But we neglect to consider that if we
improve our craft we can be faster and better by default. We fail to use this
[suffering as a way to make us
better](http://localhost:1313/post/suffering-and-progress/).

For example, lets consider the "I didn't write tests because I didn't have
time". This is something common that I faced many times before. But _now_, I
can't even code without using tests at the same time, and I find that I'm much
more efficient with a test to guide me than without one. But this _skill_ took
time to develop.

And this all depends on the culture of our team. Are we [working hard or working
smart](https://engineering-management.space/post/work-smart-vs-work-hard/)?

# Summary

Writing software is hard. And it's hard to [assess developer
performance](http://localhost:1313/post/performance-appraisal-methods/) and [to
level up developers](http://localhost:1313/post/leveling-up-developers/).

But my challenge to all of us is to always start with this
[hypothesis](http://localhost:1313/post/less-opinions-more-hypotheses/): 

> I could have done this better and faster. How could I have achieved that?
