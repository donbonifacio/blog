---
title: "Consultant interview: Markus Schirp"
date: 2018-11-06T17:05:02Z
draft: false
categories: ["Interviews", "Consultant Interviews"]
interviewee_name: "Markus Schirp"
interviewee_role: "Consultant"
interviewee_company: "Freelancer"
small_images:
- "/img/markus-schirp.jpg"
---

<img src='/img/markus-schirp.jpg' style='float:right; width:200px;margin-left:15px'/>

Markus Schirp ([twitter](https://twitter.com/_m_b_j_), [linkedin](#), [homepage](#)) is
the author of [Mutant](https://github.com/mbj/mutant), a mutation testing tool
for Ruby.

In this interview we cover the topic of [mutation
testing](/post/mutation-testing/) and the added value of
incorporating it on our day to day flow.

We also cover other quality techniques that can be used to improve end to end
quality of software deliverables.


<div style='clear:both'></div>

<!--more-->

> Hello Markus. Can you introduce yourself and talk a bit about your background
> and what you do?

I'm a freelancing entrepreneurial dynamic language exorcist.

I invest into, contract for development and develop applications in various
industries.

Also I do trainings on mutation testing. My interest shifted away from Ruby a
while ago, still during my professional activities I rescue Ruby applications
from their state of despair, which lead me to develop various tools improving
this activity.

The reason I'm doing this interview, is that I'm the author of the Ruby mutation
testing tool [mutant](https://github.com/mbj/mutant). Which allows to narrow the
semantic coverage gab between tests and the code under test. Which is especially
helpful in dynlangs as there are other than tests no guarantees for the programs
properties.

> Can you give an overview of what's mutation testing and the value we can take from it?

Note that the following definitions are "my" terms, I made up for my activities.
Its very likely not every tool/literature etc you can find will agree to them.

Mutation testing is the process to heuristically determine which semantics of
your program are not covered by tests. It does not replace a type system, a
totality checker or a formal proof. But it can you get closer to those
guarantees.

Its based on the process of automatically identifying changes to your code base
that, when run against a relevant subset of the test suite, do not affect the
outcome of the tests.

These changes are called mutations, and when a mutation applied to your code
base does  *not* turn the test red (mutant term its alive) it means one of 2
things:

1. The code has semantics that should not be present, else there would have been
   a test for that semantic to be present. So the code does more than the tests
   asks for and should be reduced in semantics.
2. The code has semantics that are originally present, but there is not test to
   enforce the semantic the mutation testing tool changed (or removed) is
   present.

Its up to the developer who reads a mutation testing report to determine which
course of action to take. I observe that the more mature the code base the more
likely its 1), and the less mature the code base its 2).

The mutations introduced by the mutation testing engine generally should change
semantics of the code in a significant way (in mutants terms: orthogonal
replacement), or remove semantics (mutant term: semantic reduction). But never
add semantics, as tests have a hard time to prove the absence of a property. Its
the mutation testing tools job to prove the absence of properties that are not
specified by the test. IMO mutation testing tool closes the TDD loop.

**Canonical example for orthogonal replacement:**

```ruby
# original
def foo
  a < b
end
```

```ruby
# mutation
def foo
  a > b
end
```

Reported as:

```diff
 def foo
-  a < b
+  a > b
 end
```

**Canonical example for semantic reduction:**

```ruby
# original
def foo
  do_a
  do_b
end
```

```ruby
# mutation
def foo
  do_a
end
```

Reported as:

```diff
 def foo
   do_a
-  do_b
 end
```

> Do you have specific examples of life saving results, or some weird bugs that
> were detected right away?

Life saving results, no. Writing software life depends on in Ruby would be a big
mistake anyway.

Probably project saving results. Pulling off some very important refactoring at
the heart of overgrown rails projects would for me not be possible without being
able to "nail a piece of behavior into the ground". That allows to refactor
parts without changing semantics unintentionally.

Weird bugs at commit stage are plenty to be seen. Often your assumptions get
challenged. As mutant has ~130 mutation operators (really depends on how you
count them) its hard for me to identify ones that stand out.

Its typically fascinating on how much "dead" code is hidden in code bases.
Imagine `a(b(c(d))))` style transforms / filters. Often enough intermediate
stages only have an effect for edge cases, but these either cannot reach that
code anymore due project history, or are totally unspecified. The totally
unspecified case often leads to discover semantic problems that reveal security
issues.


> Do you feel that by starting to use mutation testing, we start to _adapt_ and
> change our way of writing code? Like training us to stop doing some patters
> that are _always_ caught by Mutant, and this improving our skill set? If so,
> any examples of these patterns come to mind?

A big yes to all. Mutant favors to use the simplest possible primitive that
fulfills the observed semantics. Using a more capable primitive to do the job a
less powerful primitive could do is a mistake. As the more powerful semantics
are just unused, laying dormant till by accident they have a likely undesired
effect.

A good example here is: `#to_s` vs `#to_str`. Calling `#to_s` on an object that
also supports `#to_str` is a mistake assuming `#to_str` would fulfill all your
requirements already. `#to_s` is supported by many more objects, and has a far
wider semantic corpus, one you should opt-in explicitly to.

This is the core principle of mutant: You have to prove to the tool that doing
something more complex has a verifiable semantic impact, else the tool forces
you to do the simpler thing.

Training yourself to use the least powerful primitive, or provide proof you need
the more powerful one is a healthy way to align a team of developers. Following
this shared axiom reduces the code drift, the alive mutations and so ultimately
the time it takes to review code.

So "just" by using mutation testing you get lots of secondary effects that
increase a teams performance.

> I can see mutation testing being perfect for _pure_ functions with a fast test
> suite. But how to handle code with side effects? Having database calls or
> slower integration tests? Do you still feel Mutant to be useful on these
> scenarios? What tips can you provide in this context?

Mutation testing is scalable, as generally the individual mutations are
independent from each other. So the general domain of "running a mutation test
suite" has a good concurrency potential. Only the final report needs all
results.

If you invest into making your spec suite (unit, integration, whatever)
concurrency proof you can speed up the process quite well.

For databases like postgresql its a good idea to isolate the tests in
serializable transactions that get rolled back on an individual test finish.
This way you get an almost pristine DB environment where no concurrent effects
of adjacent tests (triggered by mutation testing or regular) can leak. This
falls down in certain edge cases but generally gets you far.

I personally, after writing some custom integration code run Mutant successfully
on large rails code bases that still often do the typical rails "DB infected
tests" a lot.

Mutant has a unique feature to detect isolation problems the so called noop
mutations. They can help you to identify absent isolation preventing concurrency
from producing good results. A blog post on these is pending, as other
implementers wanted to pick them up.

> What about other maybe complementary practices? For example property-based/testing? Do you have experience with it? Are there other practices that can complement or augment mutation testing?

A good complementary practice is property testing indeed. 

I personally describe it as "orthogonal" to mutation testing. As in: Has some
overlap in terms of "can prove things about your code base", but is not
replacing mutation analysis or vice versa.

My mental model is close to:

* Mutation testing: Fuzz the implementation against the tests (with restrictions
  to never add semantics)
* Property based testing: Fuzz the input against the tests

This leads a hole I'd also like to explore in the future: Fuzz the tests to find
the minimal that covers all mutations ;).

I've got experience in property based testing, mostly on Haskell projects,
quickcheck and recently hedgehog are the projects used there a lot.

Many mutation operators, especially semantic reduction ones can be found
mirrored in the property testing tools "reduce" step, where once a property
violating input was found input reduction is performed to present the developer
a "minimal violating input".

Other good complements of mutation testing are: Rich type systems. I currently
estimate about 90% of the mutations in a typical Ruby project would come back
"killed by the type checker" already.

This is an astonishing high number, and mutations that are dead are "tests you
do not have to write anymore". This is the cornerstone of my opinion that
dynamic languages are a smell, a form of tech debt. One that has to be very
carefully managed to have a payment plan ready for that tech debt, including
compound interest.

Also type checkers are more peformant than the average unit test, even on pure
code.

In the presence of types, mutations emitted by the mutation testing engine can
also be made more interesting. As type directed mutations can help the engine to
identify much more valid high level cases. Also in some cases the types
themselves can be mutated, to reduce unused expressivness the types permit the
value level to do. This is an active subject of my personal research.

Type directed mutations are even possible in dynlangs, and I've got some private
mutant forks that do some of these.

> And stepping away from testing: what other practices would you suggest to
> improve end to end quality of software deliverables?

I'd like to answer this starting with the axioms behind the best practices, and
than show on how these practices are instances fo the axioms applied.

My current axioms that are the root of my development practices are:

* Human discipline varies significantly over time
* There is a contribution threshold, discipline below that threshold is net
  negative to the project, and above that threshold a contribution has positive
  effect.

So it boils down to: How do we make it harder to do the wrong thing, and make it
easier to do the right thing. The answer is tooling. Bicycles for brains.

And applying the first level axioms results in the following ideas, that when
embraced by the entire development team reduces lots of drift. The ideal cases
is that when everybody follows the same axioms, and rules derived from it we
result in bit wise identical deliverables. I know this is the ideal state we'll
never reach, but I see value in target it and getting really close to it,
despite the delta between current and ideal state will always be bigger than
zero.

Some consequences:

* Consequently use the least powerful primitive that does the job. No "Just in
  case code/architecture/...". If you can choose primitive A that does the job,
  over primitive B that also does the job but could do something else, by all
  means choose A.
* Automated Checks over human preference. If you have the choice to standardize
  on A or B, while B is only verifiable by a human choose A, even if it "looks
  worse to the eyes or goes against someones preference". Technical weight of a
  team member should only be the tie breaker and almost never be invoked.
* Have a payment plan for any kind of tech debt ready, that also acknowledges
  compound interest. And if there is no payment plan be honest to at least
  acknowledge the tech debt.
* Small deliverables, as its easier to identify if they fall below or above the
  contribution threshold.
* If instances of a certain flag show up often for review, automate that flag
  away, so its caught by your CI not wasting precious review time.
* Assume the reviewer is below the contribution threshold when reviewing. The
  only thing you cannot bribe is the automated checks.
* Human discipline time above the contribution threshold is far to precious and
  rare to be spend on automat-able tasks.
* Make tools if they are missing in your environment (this is on how mutant was
  created).

I'll not expand this already long answer with a list of tools/techniques, but
rather leave it as this high level abstract ideas.

> Awesome. Thanks for sharing all this knowledge. To close the interview I'd like
> to ask if you can suggest someone for me to interview next.

Try to get [@dkubb](https://twitter.com/@dkubb). I consider him my mentor.

> And what kind of topics you'd expect to see in a software
> engineering management blog?

My suggestions are:

* Managing tech debt explicitly and honestly
* Education of decision makers without a tech background to do more quality
  decisions.
