---
title: "RAG at Scale is Hard: What Startups Getting Wrong?"
last_modified_at: 2025-04-07T12:46:41Z
categories:
  - Blog
tags:
  - Development
---

Draft!

There’s a pattern I’ve seen in the past few months.
Startups—and especially non-technical product owners—have heard about RAG (Retrieval-Augmented Generation), seen a demo, maybe run a small pilot… and now they want to roll it out to production.

The idea sounds simple enough:

“Let clients upload their data and get meaningful answers from a friendly AI assistant.”

But the truth is: **very few developers have implemented RAG in real life, beyond a toy example or carefully curated demo.** Even in large organizations with AI teams and infrastructure, RAG rarely makes it into production at scale.

I’ve worked for a multinational with 200+ developers on a AI project. And this month alone, I’ve had two interviews where I was asked to lead a team building a production RAG MVP.
Both had run a “pilot” with a customer. Both had no real plan for what “production” meant.

## The Myth of Plug-and-Play RAG

There’s a belief floating around that RAG is nearly turnkey.
You embed the documents, drop them in a vector database, throw a GPT prompt at the search results—and boom! Magic AI chatbot.

What actually happens:

- Clients upload PDFs, Word docs, screenshots, spreadsheets, and the occasional photograph of a whiteboard

- Data is inconsistent, contradictory, poorly formatted, and often outdated

- The AI gives long-winded, vague, or hallucinated answers

- Users don’t trust it, so they don’t use it

- No monitoring, no feedback, no versioning, no context on why an answer was given

At that point, everyone quietly moves on and the pilot becomes another bullet point on the investor slide deck.

## Why RAG Instead of Fine-Tuning?

One common question is: “Why not just fine-tune the LLM on our own company’s data?”
The answer is that **fine-tuning is rarely the right approach for general knowledge retrieval.** When you fine-tune a large model, your specific data gets blended into the ocean of its existing knowledge. Unless you have massive, high-quality, and domain-specific training data, your information is likely to be diluted—leading to less accurate responses and more hallucinations, not fewer. Fine-tuned models also lack transparency: it’s much harder to know where an answer came from, or whether it's grounded in your latest documents.
**RAG keeps your company’s data separate and fresh,** enabling the model to retrieve relevant content in real-time and generate answers with context and citations—without rewriting the model’s brain every time your business updates a policy.

## What Startups Get Wrong

Here’s the core misunderstanding:
**RAG isn’t a feature — it’s a platform.**
And building a platform means infrastructure, process, and ongoing care.

Let’s break it down.

### 1. Uploading Arbitrary Data Is a Nightmare

You can’t just let users upload anything and expect good results. Different file types, structures, writing styles, and document lengths need different parsing, chunking, and embedding strategies.

A 10-page policy doc is nothing like a customer support log. A spreadsheet full of KPIs isn’t a knowledge base.

And when it goes wrong? You can’t always tell why. The AI doesn’t complain—it just gives a poor answer.

### 2. Retrieval Quality Is Everything

The whole premise of RAG depends on the system retrieving the right data. If retrieval is noisy, off-topic, or inconsistent, the generated answer won’t help anyone.

This means:

- Fine-tuning chunk size and overlap

- Testing different embedding models

- Handling synonyms, acronyms, and fuzzy queries

- Sometimes rewriting or augmenting the user’s question

And you’ll need a way to measure it. “Feels about right” won’t cut it when clients start using it in their workflows.

### 3. Prompt Engineering Isn’t a One-Time Job

It’s easy to get a good answer in your first few tests. You’ve curated the data. You’ve crafted the prompt. You ask a softball question.

In production?

- Users ask vague or oddly phrased questions

- They expect bullet points, citations, confidence levels

- They ask about things that aren’t in the data—and still expect an answer

Your prompt strategy needs to evolve, adapt, and be versioned like any other part of the system.

### 4. Security, Versioning, and Governance

When clients are uploading their own data, the stakes go up fast.

- What happens when they upload outdated or incorrect files?

- What if two documents contradict each other?

- Can they see what sources were used in an answer?

- Can you trace and fix a bad response?

Without versioning, you can’t track changes. Without access controls, you can’t protect sensitive information. Without governance, you can’t build trust.

## Why Most Pilots Stall

Most pilots are built for demos:

- Clean data

- Narrow scope

- Friendly questions

- No real-world usage or user feedback

They work because they were designed to succeed. But they don’t represent reality.

Then the team is asked to go to production—on that same shaky foundation.
That’s when things fall apart.

## If You’re Building RAG for Real

Here’s what I’ve learned from experiments, interviews, and seeing the guts of real systems:

- **Start with a single use case.** One question type. One document format. One workflow.

- **Get retrieval right before worrying about generation.**

- **Add evaluation early.** Even basic tracking of retrieval relevance and answer helpfulness helps.

- **Explain your answers.** Grounding, citations, document previews—whatever builds trust.

\_ **Treat prompts as evolving code.** They’re part of the system, not a magic incantation.

- **Don’t offer “upload anything.”** Guide your users to what works well first.

## Closing Thought

RAG is exciting. It’s one of the most promising ways to build useful, trustworthy AI into real-world products.

But it’s not a shortcut. It’s not a silver bullet. And it’s not something you can slap together in a two-week sprint with vague requirements and arbitrary data.

If you want to build a product around RAG, don’t treat it like a feature.
Treat it like a platform—because that’s what it is.
