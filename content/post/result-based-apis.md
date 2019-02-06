---
title: "Decision log: result based APIs"
date: 2019-02-05T18:37:32Z
draft: false
categories: ["Programming", "Decision Logs"]
tags: ["Javascript", "Ruby", "Rust"]
small_images:
- "/img/debates.png"
discuss:
  - ["Result Objects - Errors Without Exceptions", "https://www.rubypigeon.com/posts/result-objects-errors-without-exceptions/"]
  - ["Problem Details for HTTP APIs", "https://tools.ietf.org/html/rfc7807"]
  - ["Category Theory and algebraic abstractions", "https://funcool.github.io/cats/latest/"]
---

<img src='/img/debates.png' style='float:right; width:200px;margin-left:15px'/>

I usually advocate for building APIs that have the top level service
classes/functions returning _results_. It's common to return a value directly,
but many times I _feel_ the necessity of returning more things. It can be an
error when something goes wrong, or even additional metadata that _add_
information to the returned value.

This is a [decision log](/post/decision-logs/) that discuss if we should use
this technique.

<div style='clear:both'></div>
<!--more-->

# How to use results

An approach would be to create a wrapper class for the result:

```ruby
class Result
  attr_reader :success, :value
end

def operation
  if ok
    Result.new(success: true, value: 'ok')
  else
    Result.new(success: false, value: 'something is not right')
  end
end
```

We may enforce this on the class, but just by having a `result` returned we
_force_ the caller to handle the error scenario. It could be something like:

```ruby
result = operation
if result.success?
  proceed
else
  clean_up_and_bail_out
end
```

By using results we can express both the success and the failure using the same
object. But how is this different from using exceptions? By using this process,
exceptions become really _exceptional_ events. Everything that we properly handle
and the bad things we detect, we return as error results. I believe this makes the code
easier to follow and understand.

## Result chains

Instead of relying on exceptions when bad things happen, we embrace errors and
have a deep focus on them. But at the same time we can _abstract_ from dealing
with errors. Using result based APIs fosters chaining operations. For example:

```ruby
fetch_data
  .and_then(&:validate_data)
  .and_then {|data| fetch_dependencies(data, options)}
  .and_then {|data| db_persist(data) }
  .and_then({|model| Return.created(model)})
```

If everything uses results, we may have that if something in the chain returns a
failure, it short circuits the chain and returns the error directly. This is
automatic and saves lot of error handling code (and less code, less bugs). It's
also easier to understand the _intent_ of the code.

## Not only for humans

From my experience this kind of code is easier to _read_ and _change_. But by
adding metadata to the result we can also add more meaning to results that can
be processed by APIs. For example, if we have a `Result.created(model)` that
adds to the metadata of the result that it was _created_ (or saved, or deleted,
etc), we can _automatically_ use that information to match to a HTTP Status 201.

We can also add metadata to indicate if the operation was idempotent, add
elapsed time or monitoring information, for example a global transaction id.

## Really focus on errors

We should naturally [do this with exceptions
also](/post/code-patterns-that-are-a-recipe-for-trouble/#exceptions-without-context),
but I believe errors make this practice more common. We should always give
proper context on the errors. This is necessary if for example we're aiming for
a [zero bugs policy](/post/zero-bug-policy/). When something happens we need as
much context as we can gather.

A typical example is trying to fetch from the database something that is not
there and getting a `RecordNotFoundException`. This is usually troublesome to
troubleshoot. It would be better to have something like:

```ruby
Result.failure(message = "Error verifying if the user has the `admin` role")
  Result.failure(message = "User record with id `123` is not found")
```

Having an error logged with this information would be excellent. And because of
result chains, we could have this report whenever we tried to verify the _auth_
rules for a user.

We could (and should) do this if we use exceptions. But because exceptions are
_automatic_ it's easy to bypass. For example, consider this code:

```ruby
def has_role?(user_id, role_name)
  User.find!(user_id).role == role_name
end
```

So we would return a boolean. But if the operation failed, it could be because
lots of things. Using results _force_ us to better build the error pipeline.

```ruby
def verify_role(user_id, role_name)
  feth_user(user_id)
    .and_then { |user| verify_user_role(user, role_name) }
end

def fetch_user(user_id)
  Result.success(User.find!(user_id))
rescue RecordNotFoundException
  Result.exception("User with id ${user_id} is not found")
end

def verify_user_role(user, role_name)
  message = "User ${user_id} has required role ${role_name}"
  if user.role == role_name
    Result.success(message)
  else
    Result.failed(message)
  end
end
```

One can say that we replaced on line of code with several ones. But we did add
much more runtime context that will be important to troubleshoot runtime issues.

## Results work well with languages that support macros

If the previous example become more verbose, was because we're using code that
didn't return results and we had to convert it. [Rust](https://www.rust-lang.org/) is
a very interesting language that embraces results (and options) on their
standard API.

And because they support macros, we can _easily_ bypass chains and have a macro
that does the boilerplate of returning if a result failed. Example:

```rust
fn verify(user_id: i32, role: Role) -> Result {
  let user: User = find_user(user_id)?;
  if (user.role == role) {
    Ok(user)
  } else {
    Err(RoleMismatch(user:id, role))
  }
}
```

_(note the `?` on `find_user(user_id)?` that will return form the function right
away if the result failed)_

Using results may seem to require more code, but when we start using it, and
creating utilities for handling them, from my experience we actually end up with
_less_ code.

## Downsides

Even if we could debate about the amount of extra code necessary, using results
is indeed another abstraction to learn. Learning how to use it and read the code
that it _generates_ requires getting use to it. And if we use code that isn't
using results, we'll need to wrap it. While it may add _information_ to it, it's
an extra burden.

If new developers are more used to exceptions and are good at using them it will
be even harder to sell.

Another issue that arises comprises with complex chains. Imagine that we have a
collection of things to process. What happens if one of them fail? Should we
stop right away? Should we process them all and return the ones that failed and
the ones that succeed? In my opinion if results bring this discussion to the
table they are already a good thing to have. Because sometimes it's not about
making things more complex, but instead managing the complexity that we already
have.

# Is it good one month later?

The code starts to be easier to read and with a more _standard_ structure. But
there are some issues that come up. As an example, let's see this code from a
Javascript promise chain:

```javascript
apiCall(userId, roleName)
  .then(user => processUser(user))
  .then(user => notifySomethingElse(user))
  .then(user => saveUser);
```

_(note that Javascript also has "macros" for handling results (promises))_

The problem here arises when we have a rejected promise (failed result) that
doesn't have a description and a proper stack trace. How to know where the
problem is? This happens sometimes. It forces us to really consider the error
messages and context.

Another thing we can do is to, on development, register the stack trace whenever
we create a failed result. This way we can understand where the result appeared.

This is the bigger issue I've found. Sometimes is indeed cumbersome to wrap
results and build proper results with additional information. It does get better
with time, but honestly it's always cumbersome to add error handling. The
difference is that results _force_ me to be more councious of it.

# Is it good 6 months later?

_Work in progress_...


# Summary

This type of abstraction is very common on functional programmming. It brings
several advantages but also has its tradeoffs. It's another tool and requires
some learning and change of practices.

Would I use it again: **yes**.

