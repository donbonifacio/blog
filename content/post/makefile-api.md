---
title: "Common project usage: Makefile API"
date: 2018-11-06T16:37:49Z
draft: false
categories: ["Utilities"]
small_images:
  - "/img/training-plan.png"
---

<img src='/img/training-plan.png' style='float:right; width:200px;margin-left:15px'/>

It's common for me to jump around between projects. For example, I may be
working on a backend service and need to jump to a frontend _SPA_ to help the
team on some [deadline](/post/dealing-with-deadlines/) or other specific
[goal](/post/importance-of-setting-goals/).

But _cloning_ a new project always gives me bad memories. Not being able to run
the tests (or not having tests at all), not knowing how to start/run the project
(it may have docs for it if I'm lucky). And the worst part: not knowing how to
deploy/publish a new version.

<div style='clear:both'></div>
<!--more-->

To try to address this, I always try to _sell_ the idea that all projects should
have a `Makefile` with a common api for running tests, the app, etc.

# Makefile API

The idea is to have a `Makefile` with typical _targets_ that are present on all
projects. For example, all projects should be able to run `make test`.
This is always a bit hard to _sell_. Developers will argue that they already
have `yarn test` or `bundle exec rspec` or `lein test`, etc.

But for something that is picking up the project, that may not be up to date on
it, it's hard to find all the available commands and how to run them. So I
suggest that we should have a `Makefile` with the following _targets_:

* `make bootstrap` - one time command that will install required services, like
  the databases, etc. This works well if everyone uses the same system (for
  example, `brew` on macs). So we may need to have specific per-system targets.
* `make install` - will install and/or update the current project's
  dependencies. This usually runs `yarn install` or `bundle install`.
* `make test` - will run the _development_ test suite (`yarn test` or `lein test`).
* `make run` - will start the application. It will also output it's URL or maybe
  how to use it.
* `make ci` - steps to run the build pipeline.
* `make docker` - builds a docker image for the project.
* `make deploy` - deploys the project. It may not be possible to run this
  locally without extra settings. But at least we'll know what is being done.

Developers may continue to use their common commands, but this way we have an
interface that anyone else can follow.

# Example Makefile

With a bit of _makefile_ magic we can have an output that shows the available
targets and what they do.

```Makefile
.PHONY: help test

help: ## Shows the available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test: ## Runs the development test suite.
  lein test
```

Running `make` or `make help` would output:

```bash
$ make help
help                           Shows the available commands.
test                           Runs the development test suite.
```

# Summary

Developers end up liking the idea and actually start using the `Makefile` to add
specific project related commands (for example, to fetch/build translations).
This is not a replacement for proper documentation, but does help in having a
consistent API that facilitates the
[onboarding](/post/onboarding-template/) of new contributors.
