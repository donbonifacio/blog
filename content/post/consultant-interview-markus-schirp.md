---
title: "Consultant interview: Markus Schirp"
date: 2018-11-21T07:05:02Z
draft: false
categories: ["Interviews", "Consultant Interviews"]
interviewee_name: "Markus Schirp"
interviewee_role: "Consultant"
interviewee_company: "Schirp DSO"
small_images:
- "/img/markus-schirp.jpg"
---

<img src='/img/markus-schirp.jpg' style='float:right; width:200px;margin-left:15px'/>

Markus Schirp ([twitter](https://twitter.com/_m_b_j_), [linkedin](https://www.linkedin.com/in/markusschirp/), [homepage](https://mbj.io)) is
the author of [Mutant](https://github.com/mbj/mutant), a mutation testing tool
for Ruby.

In this interview we'll cover the topic of [mutation
testing](/post/mutation-testing/) and the added value of
incorporating it in our day to day workflow.

We'll also cover other quality techniques that can be used to improve end to end
quality of software deliverables.


<div style='clear:both'></div>

<!--more-->

> Hello Markus. Can you introduce yourself and talk a bit about your background
> and what you do?

I'm a freelancing entrepreneurial dynamic language exorcist.

I invest into, contract for development, and develop applications in various
industries.

I also do trainings on mutation testing. My interest shifted away from Ruby a
while ago but in my professional life, I still rescue Ruby applications
from their state of despair. This has lead me to develop various tools to help
with improving these activities.

The reason I'm doing this interview, is that I'm the author of the Ruby mutation
testing tool [mutant](https://github.com/mbj/mutant). Mutant allows me to narrow the
semantic coverage gap between tests and the code. That's especially helpful in
dynamic languages as these, apart from tests, have no guarantees for the program's
properties at runtime.

> Can you give an overview of what mutation testing is and how we can benefit from it?

Note that the following definitions are "my" terms. I made them up for my activities.
It's very likely that not every tool/literature etc you can find will necessarily use
the same terms.

Mutation testing is the process of heuristically determining semantics of
your program that are not covered by tests. It does not replace a type system, a
totality checker or a formal proof. But it can get you closer to those
guarantees.

It's based on the process of automatically identifying changes to your code base
that, when run against a relevant subset of the test suite, do not affect the
outcome of the tests at all. Such changes are called mutations.

If a mutation that's applied to your code base does *not* make the test fail
(in mutant's terms, it stays "alive"), this means one of two things:

1. The code has unintended semantics that should not exist. If they should indeed
   exist, there would be a test for them. We can say that the code does more than
   what the tests ask for and that its semantics should therefore be reduced.
2. The code has intended semantics that should exist, but the mutation testing tool
   cannot find a test that covers them. It's the developer's responsibility to add
   such a test that covers the intended semantics.

It's up to the developer who reads a mutation testing report to determine which
course of action to take. Based on my observations, I think that the more mature
the code base is, the more likely it is to run into point 1 from above. Less
mature code bases run into point 2 more often.

The mutations introduced by the mutation testing engine generally should change
semantics of the code in a significant way (in mutant's terms: orthogonal
replacement) or remove semantics (mutant term: semantic reduction). They should
never add semantics though, as tests will typically have a hard time to prove the
*absence* of a property. It's the mutation testing tools job to prove the absence
of properties that are not specified by the test. IMO mutation testing tools close
the TDD loop.

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

Life saving results, no. Writing software that needs to save lives in Ruby would
be a big mistake anyway.

Quite some project saving results though. Pulling off important refactorings at
the heart of overgrown rails projects would not be possible for me without being
able to "nail down" existing semantics exactly. This allows me to refactor parts
of the system without changing these semantics unintentionally.

Weird bugs at the commit stage occur fairly regularly. Oftentimes, your assumptions
get challenged. As mutant has ~130 mutation operators (it really depends on how you
count them), it's hard for me to identify specific ones that stand out.

It's typically most fascinating for me how much "dead" code is hidden in code bases.
Imagine `a(b(c(d))))` style transforms / filters. Often enough, intermediate
stages only have an effect in edge cases, but these either cannot reach that
code anymore due to project history, or are totally unspecified. The totally
unspecified case often lead to discovering semantic problems that reveal security
issues.


> Do you feel that by starting to use mutation testing, we start to _adapt_ and
> change our way of writing code? Like training us to stop doing some patterns
> that are _always_ caught by Mutant, thus improving our skill set? If so, do
> any examples of these patterns come to your mind?

A big yes to all. Mutant favors using the simplest possible primitive that
fulfills the required semantics. Using a more powerful primitive to do the job a
less powerful one could do just as well, is a mistake. The more powerful semantics
are simply unused. They lay dormant until, often just by accident, have an undesired
effect.

A good example for this is `#to_s` vs `#to_str`. Calling `#to_s` on an object that
also supports `#to_str` is a mistake, assuming `#to_str` would fulfill all your
requirements already. `#to_s` is supported by many more objects, and has a far
wider semantic corpus, one you should opt-into explicitly.

This is the core principle of mutant: You have to prove to the tool that doing
something more complex has a verifiable impact on semantics. If it hasn't, the tool
forces you to do the simpler thing.

Training yourself to use the least powerful primitive, or provide proof that you
need the more powerful one is a healthy way to align a team of developers. Following
this shared axiom reduces code drift, alive mutations and ultimately the time it
takes to review code.

So "just" by using mutation testing you get lots of secondary effects that
increase a team's performance.

> I can see mutation testing being perfect for _pure_ functions with a fast test
> suite. But how do you handle code with side effects? Having database calls or
> slower integration tests? Do you still feel Mutant to be useful on these
> scenarios? What tips can you provide in this context?

Mutation testing is scalable, as generally the individual mutations are
independent from each other. So the general domain of "running a mutation test
suite" has good concurrency potential. Only the final report needs all the
intermediate results.

If you invest into making your spec suite (unit, integration, whatever)
concurrency proof, you can speed up the process quite well.

For databases like postgresql it's a good idea to isolate the tests in
serializable transactions that get rolled back when an individual test has finished.
This way you get an almost pristine DB environment where no concurrent effects
of adjacent tests (triggered by mutation testing or your own regular tests) can leak.
This may fall down in certain edge cases but generally gets you quite far.

After writing some custom integration code, I'm running mutant successfully
on large rails code bases that still contain a lot of rails' typical "DB infected tests".

Mutant has a unique feature to detect isolation problems. So called noop
mutations. They can help you to identify absent isolation preventing concurrency
from producing good results. A blog post on these is pending, as other
implementors wanted to pick them up.

> What about other maybe complementary practices? For example property-based/testing?
> Do you have experience with it? Are there other practices that can complement or augment mutation testing?

Property testing is indeed a good complenentary practice.

I personally describe it as "orthogonal" to mutation testing. It has some
overlapping in terms of "it can prove things about your code base", but it's not
replacing mutation analysis (or vice versa).

My mental model is close to:

* Mutation testing: Fuzz the implementation against the tests (with restrictions
  to never add semantics)
* Property based testing: Fuzz the input against the tests

This leads to a hole I'd also like to explore in the future: Fuzz the tests to find
the minimal set that covers all mutations ;).

I've got experience in property based testing, mostly on Haskell projects,
quickcheck and recently hedgehog are the projects used there a lot.

Many mutation operators, especially semantic reduction ones, can be found
mirrored in property testing tools' "reduce" step. Once a property violating input
was found, input reduction is performed to present the developer with a
"minimal violating input".

Other good complements of mutation testing are rich type systems. I currently
estimate about 90% of the mutations in a typical Ruby project would come back
"killed by the type checker" already.

This is an astonishingly high number. Mutations that are killed by the type checker
are "tests you do not have to write anymore". Additionally, type checkers are way
more performant than the average unit test.

This is the cornerstone of my opinion that dynamic languages are a smell: They are
a form of tech debt, one that has to be very carefully managed. A payment plan has
to be ready for that tech debt, including compound interest.

In the presence of strong typing, mutations emitted by the mutation testing engine can
also be made more interesting. Type directed mutations can help the engine to
identify much more valid high level cases. In some cases, even the types themselves can
be mutated to reduce unused expressiveness that the types would permit at the
value level. This is an active subject of my personal research.

Type directed mutations are even possible in dynamic languages and I've got some
private mutant forks that already do some of these.

> And stepping away from testing: what other practices would you suggest to
> improve end to end quality of software deliverables?

I'd like to answer this starting with the axioms behind the best practices, and
continuing with showing how these practices are instances of these axioms applied.

My current axioms that are the root of my development practices are:

* Human discipline varies significantly over time
* There is a contribution threshold. Human discipline below that threshold is a
  net negative for the project. Above that threshold, a contribution has positive
  effect.

This boils down to: How do we make it harder to do the wrong thing while making it
easier to do the right thing. The answer is tooling. Bicycles for brains.

Applying the first level axioms results in the following ideas that, when
embraced by the entire development team, reduce lots of drift. The unreachable
ideal is that everybody, given application of the same axioms and derived rules,
would write bit wise identical code. This ideal can never be reached but the closer
we can get to it, the more healthy the project will be.

Some consequences:

* Use the least powerful primitive that does the job. No "Just in case
  code/architecture/...". If you can choose primitive A that does the job,
  over primitive B that also does the job but could do something else, by all
  means choose A.
* Automated Checks over human preference. If you have the choice to standardize
  on A or B, while B is only verifiable by a human, choose A even if it "looks
  worse to your eyes or goes against someone's personal preference". Technical
  weight of a team member should only be the tie breaker and almost never be invoked.
* Have a payment plan for any kind of tech debt ready that also acknowledges
  compound interest. If there is no payment plan, be honest enough to at least
  acknowledge the tech debt.
* Small deliverables. It's easier to identify problems if they fall below or above
  the contribution threshold.
* If instances of a certain flag show up often on review, automate that flag
  away, so its caught by your CI not wasting precious review time.
* Assume the reviewer is below the contribution threshold when reviewing. The
  only thing you cannot bribe is the automated checks.
* Human "discipline time above the contribution threshold" is far too precious and
  rare to be spent on tasks that could be automated.
* Make tools if they are missing in your environment (this is how mutant was
  created).

I'll not expand this already long answer with a list of tools/techniques, but
rather leave it at these high level abstract ideas.

> Awesome. Thanks for sharing all this knowledge. To close the interview I'd like
> to ask if you can suggest someone for me to interview next.

Try to get [@dkubb](https://twitter.com/@dkubb). I consider him my mentor.

> And what kind of topics you'd expect to see in a software
> engineering management blog?

My suggestions are:

* Managing tech debt explicitly and honestly
* Education of decision makers without a tech background to do more quality
  decisions.
