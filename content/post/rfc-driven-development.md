---
title: "RFC driven development"
date: 2018-07-18T07:36:15+01:00
draft: false
categories: ["Code Quality", "Code Reviews", "Planning", "Executing"]
images:
- "/img/rfc.png"
discuss:
  - ["Rust RFC Template", "https://github.com/rust-lang/rfcs/blob/master/0000-template.md"]
  - ["How to write a good software design doc", "https://medium.freecodecamp.org/how-to-write-a-good-software-design-document-66fcf019569c"]
  - ["6 Lessons I learned while implementing technical RFCs as a management tool", "https://buriti.ca/6-lessons-i-learned-while-implementing-technical-rfcs-as-a-management-tool-34687dbf46cb"]
---


Usually we know [RFC](https://en.wikipedia.org/wiki/Request_for_Comments)s from
[IETF](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force). It's
that document that for example starts to present the [HTML](https://tools.ietf.org/html/rfc2616)
spec. But on this article I'm talking about RFCs (request for comments) in a
broader sense. Like a tool
that can be used by product/engineering teams to better plan and be productive.

<!--more-->

A great example of a project that has an open process for receiving RFCs is
[Rust](http://rust-lang.github.io/rfcs/). It's very interesting how they have
an open and collaborative process to change their language and their tools. Could
we also use a similar process on typical engineering teams?

# RFC process example

If we're going to use a RFC before starting to implement a feature, we may
ask someone to write that first draft. This could be a _tech lead_. But sometimes,
specially if we have a multidisciplinary team, one person may not have all
the required context. So we may ask people from several roles to write their
own RFC based on their responsibilities.

A backend developer may focus on the data model, database representation,
and business logic. A frontender may focus on the pages and flows to implement,
on forms and validations and on state management. A quality engineer may focus
on what integration tests will be required, how to check the impact of the feature
on the rest of the application, on how to test that everything
is working and even on how to assess performance requirements.

This initial research allows us to take a look at the code/module that we'll need
to change, to gain context and have a clear picture of what we may need
to implement.

Given that the team, and maybe some other stakeholders, will review the RFC, we
get a change of validating dependencies and constraints before starting to
implement the new shiny feature.

After this work is done, we may also be more confident on providing estimates
on the work to be executed.

The idea is not to have everything sorted out and planned to the detail. Is to
gather context and knowledge of what needs to be done and be better prepared
when coding starts.

# Advantages of using RFCs

This process works very well to communicate intent and get feedback before
starting to develop new tasks. It allows us to have a clear picture of what's
ahead and what needs to be done. By gathering feedback we may find problems and improvement
points _before_ starting the implementation. This may prevent that pull request
review where someone just points out that:

* Some code was already implemented elsewhere
* We have some business constraints that clash with the implementation
* The implemented code will fail our performance targets

Because we have more knowledge of what we'll need to implement, we can estimate
it and if we have tight [deadlines](/post/dealing-with-deadlines/) we can
plan for them. Maybe consider some parallel work that we can do, or devise
a plan B if things start to get delayed.

We can also share the RFC with people from other roles. Even if they don't have
all the technical context they may find issues and point out improvements. RFCs
could be reviewed by all the team members, the product manager, the engineering
manager and even designers or marketeers (depending on the feature).

And lets not forget other teams that depend on us. If we have stakeholder teams,
they can review what we're going to do, the interfaces and the flows, and try
to raise any concerns.

# Downsides of using RFCs

Creating a RFC takes time and may clash with other processes the team might
have. For example with SCRUM and poker planning. This is a very different
approach. And even if we may adapt it, we may struggle to incorporate it.

There's also the question of when to do a RFC. Should we do it all the times?
Even for smaller things? Sometimes we actually don't need it. But I've already
seen a simple bug that escalated to a full week of development and that really
asked for a RFC.

Another issue is that although the RFC helps in getting context, we may actually
do things differently when we start coding, because we clash with some constraint
that we didn't find before. So at this time, should we go and update the RFC?
We start to have a documentation sync issue. Another way to look at this is
to see the RFC just as a tool, and not as documentation. So when we start the
development the RFC goes to _readonly_ and just stays there for future context.

How much time should we invest in doing a RFC? This naturally depends on the
scope of the task to accomplish. But we should a clear picture of how much
time we're going to invest. A couple of hours? A week? A problem may arise
when we're actually taking too much time. We're doing research and going in circles
because of feedback and it's hard to get closure.

We may also have a RFC that is more easy to write for a role (QA) than another (FE).
This means that for example the frontenders may start developing before the
backend RFC is completed. Ideally we wouldn't have this situation, but in an agile
fast paced environment we may well face it. This may work very well if everything
goes well, but may also yield unexpected problems.

Who reviews the RFC? All the team? This may be a bottleneck. A better approach 
could be to select specific reviewers per RFC (just like with pull requests). This
can make the process slower if we need to wait for feedback.

# Summary

As with every process, RFC driven development has its pros and cons. It's not
a silver bullet and will not work with all teams. But it can be a very important
tool on some scenarios. I've been advocating and using this process for some
time now and I do like it. But I also understand that it has its pitfalls and that
it's not for everyone.
