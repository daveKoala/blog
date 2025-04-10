---
title: "From Adding Machines to Ambiguity: Why AI Feels So Different"
last_modified_at: 2025-04-10T11:55:13Z
categories:
  - Blog
tags:
  - Development
---

## RAG Systems: Compound Error is Built In

We’ve spent decades with computers that behave like… well, computers.

Write a program to add two numbers together? You’ll get the same answer every time. Query a database with the same input? Same output. These systems are stable, predictable, and rule-bound — they follow instructions exactly.

That’s the model many of us still carry in our heads: computers are logic machines. If something goes wrong, it's because a rule was broken or a bug slipped in. But fundamentally, computers are "right."

**But now we’re in a new era.**

When working with GenAI systems — things like ChatGPT, image generators, or document summarizers — the mental model has to shift. These systems don't just run code — they interpret, guess, approximate, and vary. They don’t always return the same result. Even asking the same question twice can yield a different answer.

It’s like moving from a calculator to a conversation partner. And conversations, as we all know, are fuzzy.

Behind the scenes, there are layers and layers of work just to try to get a useful result:

- Scanning and cleaning up data
- Chunking it into manageable bits
- Turning it into tokens
- Storing and indexing it
- Ranking results by “relevance”
- Writing the right kind of query
- Picking a model
- Refining the users questions
- Handling _randomness_

Oh, and hoping your query wasn’t derailed by a stray comma or poor weather (seriously, some cloud services do have regional hiccups)

Each layer introduces a chance for error, drift, or misunderstanding.

In physical engineering, we’d call this compound error — small inaccuracies that stack up until the final outcome is off by more than expected.

**So how do we test this?**
How do we build trust in a system where the same input might not return the same result?

Honestly — that’s part of the challenge. Some answers:

- You test at the edges, not just the middle.
- You check reasonableness, not exactness.
- You focus on usefulness, not precision.

And maybe most importantly, you get comfortable with uncertainty.

It’s a mindset shift — not just in how we build these systems, but how we think about them.

They’re not adding machines any more. They’re more like weather forecasts: messy, dynamic, sometimes wrong… but when used well, incredibly useful.
