---
title: "Engineering Questions We Answer Before Shipping"
last_modified_at: 2026-02-07T11:52:49Z
categories:
  - Blog
tags:
  - Development
---

Over the years I’ve noticed a pattern.

Most engineering failures aren’t caused by bad code. They’re caused by unasked questions.

- Not edge cases.
- Not syntax.
- Not even architecture diagrams.

Just… basic questions that nobody slowed down enough to ask.

So a few years ago I started compiling a checklist — not as a gate, not as a form, but as a conversation starter. Something that forces us to think before we ship.

This post is that list.

Not because every question needs a perfect answer — but because unanswered questions are conscious risk.

This is not a checklist you “fill in”

Let’s get this out of the way.

This is not:

- A standards document
- A governance framework
- A box-ticking exercise
- It’s a shared mental model.

If you bring a design, a feature, or a new piece of infrastructure to the team, these are the questions we’re going to ask anyway. Publishing them upfront just saves time and avoids surprises.

## 1. Observability — Can we see it when it breaks?

If this fails at 2am, what do we actually know?

- What metrics exist?

- What logs are produced?

- Are logs structured and searchable?

- Can we trace a request or event across boundaries?

- What alerts exist?

- What specifically triggers an alert?

“CloudWatch has something” is not an answer.

If we can’t see it, we can’t operate it. And if we can’t operate it, we shouldn’t ship it.

## 2. Failure & Resilience — What happens when parts disappear?

Failure is not hypothetical. Something will go down.

- What happens if this component is unavailable?

- Do we retry, degrade, drop data, or block users?

- Is failure acceptable? Why?

- What’s the blast radius?

- Is the system idempotent?

- How do we recover manually?

A key rule we’ve learned the hard way:

**If we don’t care when it fails, we shouldn’t alert on it.**

Alerts without intent just train people to ignore them.

## 3. Scale & Load — Does this survive success?

We’re not asking for perfect forecasts — just assumptions.

- What’s the current traffic?

- What do we expect in 12 months?

- What’s peak vs average?

- Is there fan-out?

- Are there unbounded queues, retries, or loops?

- What’s the first thing that will fall over?

Most scaling problems come from things that were “temporary” and quietly became permanent.

## 4. User & Business Flow — Why does this exist?

Architecture without context is just decoration.

- What user journey does this support?

- What’s the success path?

- What happens on partial failure?

- Is this synchronous because users need it — or because it’s easier?

- What’s the business impact if this is slow or wrong?

If we can’t clearly describe the user or business value, we should question the work.

## 5. Operability & Change — Can we live with this long-term?

Shipping is the beginning, not the end.

- How is this deployed?

- Can it be rolled back safely?

- Can we turn it off?

- Can we replay data?

- Can we test failure modes?

- Who owns this after launch?

If ownership is vague, reliability will be too.

A deliberate bias toward simplicity

This list exists for another reason: to fight solution-first thinking.

Before introducing new platforms, brokers, runtimes, or orchestration layers, we ask:

- What problem are we solving that we cannot solve today?

- What is the measurable pain?

- What breaks if we don’t do this?

- What new operational burden are we accepting?

- What wakes someone up at night?

Complexity is not free.

Complexity is a cost. We spend it deliberately.

If a simpler solution meets the need today and for the next year, that’s usually the right answer.

How we use this in practice

We don’t require every question to be answered

We do require unanswered questions to be acknowledged

We use this in:

Design discussions

PR reviews

Incident retrospectives

We never weaponise it

The moment it becomes a gate, it stops being useful.
