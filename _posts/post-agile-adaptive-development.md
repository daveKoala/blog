---
title: "Beyond Agile: Embracing Messiness in Software Development"
last_modified_at: 2025-07-09T13:47:01Z
categories:
  - Blog
tags:
  - Development
---

## Introduction

Thirty-five years ago, someone showed me how Scout groups organize differently as they mature. Cubs huddle around their leader, hanging on every instruction. Scouts form a circle where everyone can contribute, with leaders facilitating rather than dictating. Venture Scouts (remember this was a long time ago) organize themselves, with leaders staying on the periphery, ready to support but not control.

I've been thinking about how this applies to software teams ever since.

We've spent decades trying to perfect our development processes. From Waterfall to XP to Agile to DevOps, each methodology promises to solve the chaos of software delivery. Yet teams continue to struggle with the same fundamental problems: missed deadlines, changing requirements, communication breakdowns, and the eternal tension between speed and quality.

Perhaps the problem isn't that we haven't found the right methodology. Perhaps the problem is that we're fighting human nature instead of working with it.

I offer different approaches along the way, trying not to moan and rehash the same old observations. This is not another rigid methodology but a collection of adaptive approaches.

## The Maturity Paradox

Most software teams exist in a state of constant flux, bouncing between different modes of operation depending on pressure, trust levels, and external circumstances. Like the stages of grief, team maturity isn't a linear progression but a dynamic, cyclical process.

I'll use the Scouts analogy, so please bare with me.

### Cubs Mode: Command and Control

In Cubs mode, stakeholders sit at the center, issuing directives and setting expectations. All communication flows through them, all decisions require their approval, and theoretically all blame should land on their shoulders when things go wrong. This mode emerges under high pressure, low trust, or when stakes are perceived as existential.

But here's the fatal flaw: while the Cubs model concentrates authority at the center, it rarely accepts responsibility there. Instead, we see "shit flows downhill" and "teflon shoulders". Blame gets deflected outward to the team on the circumference while control remains centralized.

**Characteristics:**

- Detailed requirements documents
- Frequent status updates
- Rigid change control processes
- Authority centralized but responsibility deflected
- "You didn't build what I asked for" (ignoring that requirements changed)
- "The timeline was aggressive but doable" (after it's missed)

This creates an unsustainable dynamic where the center demands control but refuses accountability, leading to defensive behaviour throughout the team and ultimately system failure.

### Scouts Mode: Collaborative Circle

In Scouts mode, stakeholders, developers, and project managers form a collaborative circle. Everyone contributes their expertise, decisions are made collectively, and communication is multi-directional. Authority still exists, but it's distributed and contextual rather than hierarchical.

**Characteristics:**

- Ongoing conversations about requirements
- Shared responsibility for outcomes
- Flexible processes that adapt to context
- Collective problem-solving

### Ventures Mode: Self-Organization

In Ventures mode, development teams organize themselves with minimal external direction. Stakeholders provide context and constraints but trust the team to find solutions. Leadership exists on the periphery, removing obstacles and providing support rather than control.

**Characteristics:**

- Teams defining their own processes
- Direct stakeholder-developer relationships
- Rapid iteration and adaptation
- Distributed decision-making

In reality, Scouts mode is made up of smaller Venture modes - autonomous teams or patrols that self-organize internally but come together in the larger circle for coordination and shared decision-making.

## The Regression Reality

Here's what traditional methodologies don't acknowledge: teams don't progress linearly through these modes. They regress constantly, and that regression isn't failure—it's normal human behaviour under stress.

**Common triggers for regression:**

- Missed deadlines
- Changing requirements
- Budget pressure
- Team changes
- Technical complexity
- Organizational crisis

When the pressure mounts, teams naturally retreat to what feels safe and familiar. Stakeholders demand more control, developers seek clearer specifications, and everyone starts documenting everything to protect themselves.

This isn't a bug in the system—it's a feature. The ability to temporarily increase structure and control during crisis can actually be adaptive, as long as teams can return to more collaborative modes once the crisis passes.

## Embracing Fuzziness

Traditional project management assumes we can predict and control software development. Requirements can be fully specified upfront, estimates can be accurate, and deviations represent failure. This assumption creates a cascade of defensive behaviors that actually make projects more likely to fail.

What if we embraced the fuzziness instead?

### The Discovery-Development Loop

Rather than front-loading all discovery work, we can create ongoing loops where discovery and development inform each other:

1. **Broad strokes understanding** - What problem are we solving and why?
2. **Basic investigation** - What questions do we need to explore?
3. **Iterative planning** - What's our current best guess about the solution?
4. **Parallel development** - Code, tests, and documentation evolving together
5. **Continuous feedback** - What are we learning that changes our understanding? (This must be lightweight—embedded in work, not bolted on as meetings)

This approach acknowledges that requirements emerge through interaction with the system, not just upfront thinking. Users often don't know what they want until they see something concrete. The cost of change is much lower if you're expecting it rather than fighting it.

### Making Peace with Uncertainty

Instead of promising certainty where none exists, we can help stakeholders understand that fuzzy requirements lead to fuzzy timelines—but potentially better outcomes. This requires:

- **Time-boxing exploration phases** - "We'll spend two weeks investigating, then commit to a direction"
- **Defining minimum viable scope** - What's the absolute core that must ship?
- **Transparent communication** - Regular updates on what we're learning and how it affects our plans
- **Stakeholder education** - Helping business partners understand why uncertainty isn't negligence

I fully recognize that convincing 'managers' of this fuzzy approach will be difficult, but if you don't try then nothing will change at best, at worst it's a managed decline into unhealthy workplaces.

## Defensive Communication as Natural Response

When trust breaks down, teams naturally develop defensive communication patterns. Email summaries, meeting notes, and change documentation multiply as everyone tries to protect themselves from blame.

Rather than fighting this behaviour, we can shape it constructively:

### From Protection to Alignment

**Defensive communication:** "As per our conversation on Tuesday, you requested that we change the API specification..."

**Aligned communication:** "Just to make sure we're all aligned, here's what I understood from our conversation..."

The documentation serves the same function—creating a shared record—but the tone shifts from self-protection to collective understanding.

### Healthy Accountability

Documentation enables better accountability by removing the "he said/she said" element. When people can't weasel out of commitments, they're more likely to think carefully before making them.

The key is framing documentation as building a shared record for learning, not building a case against someone.

## Blame as Learning Tool

We need to rehabilitate the concept of blame. Not blame as punishment, but blame as understanding causation and improving systems.

**Blame-to-punish asks:** "Whose fault is this? Who do we make suffer for it?"

**Blame-to-learn asks:** "What decisions led to this outcome? What can we do differently next time?"

Teams that can't honestly examine their failures are stuck in endless cycles of the same problems. The stakeholder who never acknowledges unrealistic deadlines will keep setting them. The developer who won't own poor estimates will keep making them.

Paradoxically, teams that "blame" well often have less interpersonal conflict because issues get surfaced and addressed rather than festering.

## Working with the Cycle

Rather than trying to force teams into a particular mode, we can work with their natural rhythms:

### Recognizing the Patterns

- **Cubs mode** often emerges during crises, with new team members, or under external pressure
- **Scouts mode** develops when trust is building and shared context exists
- **Ventures mode** requires high trust, stable teams, and psychological safety

### Building Resilience

Teams that maintain some collaborative elements even during regression tend to recover faster. This might mean:

- Keeping regular meaningful retrospectives / after action reporting even when everything else becomes formal
- Maintaining direct communication channels alongside official reporting
- Preserving some autonomy even when control increases

### Supporting Transitions

Leadership can help teams transition between modes by:

- Providing air cover during vulnerable periods
- Modelling and practising the communication patterns they want to see
- Creating space for experimentation and learning
- Accepting that some regression is normal and temporary

## Conclusion

Software development is fundamentally a human activity, not a manufacturing process. Our methodologies need to acknowledge this reality rather than fight it.

The goal isn't to find the perfect process, but to develop adaptive capacity—the ability to adjust our approach based on context, maturity, and circumstances. Sometimes we need the structure of Cubs mode. Sometimes we thrive in the collaboration of Scouts mode. Sometimes we're ready for the autonomy of Ventures mode.

The magic happens when we stop trying to force teams into rigid frameworks and start working with their natural patterns of growth, regression, and adaptation.

Perhaps it's time to move beyond the search for the perfect methodology and embrace the beautiful messiness of human collaboration.
