---
title: "Bug that was not our mistake, except it was"
date: 2018-08-15T09:31:11+01:00
draft: false
categories: ["War Stories", "Ramblings", "Code Quality", "Code Reviews"]
small_images:
- "/img/development.png"
---

<img src='/img/development.png' style='float:right; width:200px;margin-left:15px'/>

This past week I was pair programming. We had to implement a service object that
deletes a model. We actually did it pretty fast and _well_. It had tests, linter
was pleased and we were ready to push it when we noticed that our coverage was
not 100% ([and we do like 100%, with all its pros and cons](/post/100-percent-test-coverage/)).

But we didn't understand why, because this module should be fully covered. In fact
the code was covered when we ran just the suite for that class, but was not covered
when we ran the full suite.

<div style='clear:both'></div>
<!--more-->

And because we saw it working in a way but not in another, we naturally _assumed_
that was not our fault. And this was against that inner voice that I had telling
me: _"it's never the tooling, it's your code"_.

Let's dive deeper on what happened and on a process that aims to never repeat
the same mistakes twice.

# The code

The code was pretty simple and small. We have a relation between two models, lets
call them `Resource` and `UserResource`. And we have a service object that deletes
resources given their ids:

```ruby
def delete(user, resource_ids)
  user_resources = fetch_user_resources_for(user, resource_ids)
  user_resources.find_each do |user_resource|
    check_can_delete!(user, user_resource)
    Resource.destroy(user_resource.resource)
  end
end
```

The code was more complex but this simple scenario covers the problem.

# The test

We had a test that created a `resource` and a `user_resource`. But lines `4` and
`5` of the service were not marked as covered. However if we put  some output our a debugger
breakpoint inside that loop, we noticed that we code indeed reached inside the
loop. We did some red/green tests and everything would work as expected.

```ruby
it 'properly deletes resources' do
  user_resource = create_user_resource_for(user)
  ResourceService::Delete.call(user: user, resource_ids: [user_resource.id])
  # ... expect record to be not found
end
```

Okay. Surely this should be a bug in the coverage tool. We actually spent some
time reviewing configurations, updating the tool version and doing some random
things like changing names, or adding other tests to see if we had some
discrepancies.

But nothing gave us more information. No matter what we did we just couldn't
understand why we _knew_ that the code was covered but that wasn't being
tracked on the coverage tooling.

# The problem with our process

The first thing that allowed us to discover the problem was actually to understand
that we were running the tests in two _different_ ways. We were troubleshooting
running the test on a vim session with a command that just runs that test. And
for the coverage, the full suite was run with a similar command. Now we could
have a problem if by any change we were targeting different databases.

But that shouldn't be a problem by the way. Just the other day we had configured
the test runner to use transactions on every test. So the database should always
be empty. And we also added a truncate operation when starting the runner. So
the databases _should_ always be cleared, and because of the transaction setting
no data was ever saved on the database.

It was my teammate that was hosting the pair session, but I also fetched the
branch and replicated the exact problem on my machine.

# Finding the problem

The problem started to become clear when we actually noticed that when we failed
to have that code covered, the `user_resources` collection was **actually empty**.
Well, that explains a lot. But what was really happening? Well, the bug was
actually on the test. It was an innocent mistake:

```ruby
it 'properly deletes resources' do
  user_resource = create_user_resource_for(user)

  # We had:
  ResourceService::Delete.call(user: user, resource_ids: [user_resource.id])

  # The proper code:
  ResourceService::Delete.call(user: user, resource_ids: [user_resource.resource_id])
end
```

**WAT**.

Now we were at that moment where we question everything. How did this work
at all? The reason is simple. When we ran just this test the `id` was the same
as the `resource_id`. So all went well. But when we ran the full suite the ids
were different, so no models were fetched and nothing was deleted.

Upon fixing this everything was well. Except one thing.

# Fixing the process

Whenever I face these _weird_ errors I always stop to think on what happened and
how to make sure that it won't happen ever again. That's actually the inspiration
of my post about [code patterns that are a recipe for trouble](/post/code-patterns-that-are-a-recipe-for-trouble/).

Making a mistake that is hidden by the chance of some ids being the same is something
that bothers me. So we stopped, I went to grab a bite and then it came to me
one _rule_ that we should always follow:

* Always assert that we deleted the same amount of records that we expected

So a better approach is if we enforce this _contract_ on the code. So the new
code is:

```ruby
def delete(user, resource_ids)
  user_resources = fetch_user_resources_for(user, resource_ids)

  if user_resources.length != resource_ids.length
   raise "Expected to delete #{resource_ids.lenght}", but only found "#{user_resources.lenght}"
  end

  user_resources.find_each do |user_resource|
    check_can_delete!(user, user_resource)
    Resource.destroy!(user_resource.resource) # Notice the ! to also enforce the deletion
  end
end
```

We did another test to verify this behaviour and we were good to go.

# Why were the ids different when running the full suite?

We had a truncate command on starting the test runner. However, the truncate deletes
all data but won't reset the ids. When we added the truncate operation we didn't
reset the database, do it had the ids in a different state and that's why we found
the problem at all.

Sometimes we aim to always have the same environment on running tests, but this
situation that happened is actually something that makes me value different environments.
So instead of: "always run the tests on the same environment", we also have something
to gain from: "our tests should run on _evey_ environment".

# Summary

This was fixed and the lesson was learned. But how can we prevent this from happening
again? We can always forget to perform these checks. Specially if we work alone. But
fortunately we work as a team and can rely on our squad to have our backs. That's
why I wrote this post: not only it helps me remember this for longer, but it will
also be used to give context whenever I'm doing a code review and someone isn't asserting
updated/deleted sizes. They will learn and will pass the word.

This one was fixed, but more will come. That's why I feel it's important to have
a process that aims to fix the root cause of our process and try to prevent
these things from happening again.
