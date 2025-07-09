---
title: "Working with Reality: A Different Approach to Software Development"
last_modified_at: 2025-07-09T14:50:49Z
categories:
  - Blog
tags:
  - Development
---

## Introduction

Thirty-five years ago, someone showed me how Scout groups organize differently as they mature. Cubs huddle around their leader, hanging on every instruction. Scouts form a circle where everyone can contribute. Venture Scouts (this was a long time ago!) organize themselves, with leaders staying on the periphery. I've been thinking about how this applies to software teams ever since.

We've spent decades trying to perfect our development processes. From Waterfall to XP to Agile to DevOps, each methodology promises to solve the chaos of software delivery. Yet teams continue to struggle with the same fundamental problems: missed deadlines, changing requirements, communication breakdowns, and the eternal tension between speed and quality.

Perhaps the problem isn't that we haven't found the right methodology. Perhaps the problem is that we're fighting reality instead of working with it.

I'll offer different approaches along the way, trying not to moan and rehash the same old observations. This is not another rigid methodology but a collection of adaptive approaches that acknowledge how software development actually works. Messy, uncertain, and fundamentally human.

## The Technical Reality: Embracing What We Know Is True

Let's start with what we all know but rarely admit: requirements are fuzzy, plans change, and the best solutions emerge through iteration. Instead of fighting this reality, what if we designed our entire approach around it?

### Starting with Broad Strokes

Forget the detailed requirements document. Start with the broadest practicable understanding possible: What problem are we solving? Why does it matter? Who benefits? The specifics will emerge through building, not through upfront 100% 'i's dotted and t crossed' analysis.

This isn't lazy thinking—it's strategic thinking. Detailed specifications written before any code exists are almost always wrong. They're based on assumptions that haven't been tested, edge cases that haven't been discovered, and user needs that haven't been validated.

### "Just Enough" Planning

Plan enough to get started, then plan more as you learn more. This means:

- **Time-box your planning** - Spend two weeks understanding the problem, not two months
- **Identify your biggest unknowns** - What questions will building the first version answer?
- **Define minimum viable scope** - What's the absolute core that must work?
- **Plan to plan again** - Schedule regular re-planning based on what you've learned

Plans aren't predictions—they're current best guesses that should evolve as reality provides feedback.

![Dwight D. Eisenhower, probably]({{ site.baseurl }}/assets/images/esisenhower.png)

### Parallel Development

Here's where many teams get it wrong: they try to sequence everything. Requirements first, then architecture, then coding, then testing, then documentation. This creates artificial dependencies and delays feedback. From experience this is never done to the fullest extent.

Instead, develop everything in parallel:

- **Code and tests together** - Testing reveals edge cases that refine requirements
- **Documentation as you go** - Writing explanations exposes gaps in understanding
- **Architecture through experimentation** - Build small pieces to test your assumptions
- **Requirements through prototyping** - Show, don't tell, to discover what users actually need

This parallel approach means everything informs everything else. You're not trying to get it right upfront—you're creating a system that gets it right through iteration. Fuzzy requirements don't mean chaos or lack of purpose. There's still clear direction and structure, just not the false precision that brittle upfront specifications create. The team, the project, the feature will define what is acceptable amount of fuzzy. Everyone must understand the objectives and accept that things will and do deviate from the conceived plan.

To mis-quote the American Werewolf in London:
![To mis-quote the American Werewolf in London]({{ site.baseurl }}/assets/images/werewolf.png)

### Lightweight Feedback Loops

Feedback must be embedded in the work itself, not bolted on as overhead. Heavy feedback processes create bottlenecks and busy work. Effective feedback happens:

- **In code reviews** - Technical feedback on implementation choices
- **Through automated testing** - Immediate feedback on whether changes break anything
- **Via direct user interaction** - Show working software, not PowerPoint slides
- **In peer conversations** - Ongoing dialogue about what's working and what isn't

The goal is information flow, not meeting theatre. If your feedback requires scheduling a meeting, it's probably too slow and too formal.

### Questions You Don't Need Answered

Traditional project management assumes you need answers to everything before you start. This creates analysis paralysis and false precision. Instead, maintain a list of questions you're comfortable not knowing the answers to—yet.

Examples:

- How will this scale to 10x users? (Build for current users first)
- What if the business model changes? (Build for current model, design for adaptability)
- How will this integrate with the system we might build next year? (Focus on current integrations)

Some questions are worth answering upfront. Most aren't. Learning to distinguish between them is a crucial skill.

## The Human Reality: Working with Human Nature

The technical approaches above only work if the human dynamics support them. This means acknowledging and working with natural human behaviors instead of pretending they don't exist.

### Blame as a Learning Tool

We need to rehabilitate the concept of blame. Not blame as punishment, but blame as understanding causation and improving systems.

**Blame-to-punish asks:** "Whose fault is this? Who do we make suffer for it?"
**Blame-to-learn asks:** "What decisions led to this outcome? What can we do differently next time?"

Teams and individuals that can't honestly examine their failures are stuck in endless cycles of the same problems. The stakeholder who never acknowledges unrealistic deadlines will keep setting them. The developer who won't own poor estimates will keep making them.

This requires creating safety for people to admit mistakes and examine failures without fear of retribution. When blame becomes about learning rather than punishment, teams actually get better instead of just getting better at hiding problems. I have seen teams also become more resistant and supportive when acknowledging mistakes

### Defensive Communication Is Natural

When trust breaks down, teams naturally develop defensive communication patterns. Email summaries multiply, meeting notes become evidence files, and everyone starts documenting everything to protect themselves.

Rather than fighting this behaviour, we can shape it constructively. The difference between defensive and aligned communication is often just tone:

**Defensive:** "As per our conversation on Tuesday, you requested that we change the API specification..."
**Aligned:** "Just to make sure we're all on the same page, here's what I understood from our conversation..."

Both create a shared record, but one builds walls while the other builds understanding. Documentation should serve the team's collective memory, not individual protection.

### Trust Cycles and Regression

Here's what most methodologies miss: teams don't progress linearly. They cycle between high-trust collaboration and low-trust defensiveness based on pressure, results, and external circumstances.

**Common triggers for regression:**

- Missed deadlines
- Changing requirements
- Budget pressure
- Team changes
- Production outages
- Organizational crisis

When pressure mounts, teams naturally retreat to what feels safe. Stakeholders demand more control, developers seek clearer specifications, and everyone starts protecting themselves. This isn't failure—it's normal human behaviour under stress.

The key is building resilience so teams can return to collaborative modes once the crisis passes, rather than getting permanently stuck in defensive patterns.

### Working with the Cycle

Instead of trying to force teams into a particular mode, work with their natural rhythms:

**Recognize the patterns** - High-stress periods naturally increase structure and formality
**Maintain some collaborative elements** - Keep retrospectives and direct communication even when other things become formal  
**Support transitions** - Help teams return to collaborative modes when pressure decreases
**Accept temporary regression** - Sometimes more structure is actually what the team needs

## The Organizational Reality: How Teams Actually Mature

Teams exist in different organizational modes depending on trust, pressure, and maturity. Understanding these modes helps us work with teams where they are, not where we wish they were.

### Cubs Mode: Command and Control

In Cubs mode, stakeholders sit at the center, issuing directives and setting expectations. All communication flows through them, all decisions require their approval, and theoretically all blame should land on their shoulders when things go wrong.

But here's the fatal flaw: while Cubs mode concentrates authority at the center, it rarely accepts responsibility there. Instead, blame gets deflected outward while control remains centralized—an unsustainable dynamic that breeds defensiveness and ultimately leads to system failure.

### Scouts Mode: Collaborative Circle

In Scouts mode, stakeholders, developers, and project managers form a collaborative circle. Everyone contributes their expertise, decisions are made collectively, and communication flows in all directions. Authority exists but it's distributed and contextual.

### Ventures Mode: Self-Organization

In Ventures mode, teams organize themselves with minimal external direction. Stakeholders provide context and constraints but trust the team to find solutions. Leadership exists on the periphery, removing obstacles rather than providing control.

In reality, Scouts mode is made up of smaller Venture modes—autonomous teams that self-organize internally but coordinate through larger collaborative structures. This fractal nature reflects how successful organizations actually work.

### Building Adaptive Capacity

The goal isn't to force teams into a particular mode, but to develop adaptive capacity — the ability to adjust approach based on context and circumstances. Sometimes you need Cubs mode structure during a crisis. Sometimes you thrive in Scouts mode collaboration. Sometimes you're ready for Ventures mode autonomy.

I fully recognize that convincing managers of this adaptive approach will be difficult, but if you don't try then at best—at nothing will change. At worst it's a managed decline into unhealthy workplaces.

## Conclusion

Software development is fundamentally a human activity dealing with inherent uncertainty. Our approaches need to acknowledge this reality rather than fight it.

The goal isn't perfection—it's building systems and cultures that adapt, learn, and improve over time. This means embracing fuzziness in requirements, building feedback into work itself, treating blame as a learning tool, and working with natural human dynamics rather than against them.

Perhaps it's time to stop searching for the perfect methodology and start building adaptive capacity to work skilfully with whatever reality throws at us.
