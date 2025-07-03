---
title: "'Feature to Delivery' Framework"
last_modified_at: 2025-07-03T10:28:29Z
categories:
  - Blog
tags:
  - Development
---

I was asked in an interview to explain how I go about planning features/work.

_For urgent bug fixes or 'hot fixes', I'll add another post_

- This will become a table of contents (this text will be scrapped).
  {:toc}

## Phase 1: Requirements Gathering & Clarification

### What I Do:

- Stakeholder Discovery: "Who are the users affected by this?"
- Problem Definition: "What problem are we actually solving?" (not what solution they're requesting)
- Success Criteria: "How will we know this worked?"
- Constraints & Context: "What can't we change?
- What's the timeline? What's the budget?"

**Key Questions I Ask:**

- "Can you show me the current workflow?"
- "What happens if we don't build this?"
- "Who else needs to be involved?"
- "What's the worst-case scenario we need to handle?"

## Phase 2: Technical Investigation & Feasibility

### What I Do:

- System Impact Analysis: "What systems/services does this touch?"
- Data Flow Mapping: "What data moves where?"
- Integration Points: "What APIs, databases, third-party services are involved?"
- Risk Assessment: "What could go wrong? What are the unknowns? (Hard to pin down, but the experience of the whole team and 3rd parties can be leveraged)"

### Deliverables:

- Technical spike if needed
- Architecture diagram (even if it's just boxes and arrows)
- List of dependencies and assumptions

## Phase 3: Breaking Down the Work

### My Approach:

- User Journey First: Map the end-to-end user experience
- Vertical Slices: Break by user value, not technical layers
- Dependency Mapping: What blocks what?
- Risk-Based Prioritization: Tackle unknowns early

**Example Breakdown:**

```:bash
Epic: "User Profile Management"

Story 1: "As a user, I can view my current profile"
- API endpoint to fetch user data
- Basic profile display component
- Integration with existing auth

Story 2: "As a user, I can edit my profile"
- Form validation
- API endpoint to update user data
- Error handling and success feedback

Story 3: "As a user, I can upload a profile picture"
- File upload component
- Image processing/resizing
- Storage integration
```

## Phase 4: Estimation & Planning

### What I Consider:

- Development time (happy path)
- Testing time (edge cases, integration)
- Review & feedback cycles
- Documentation & hand off
- Buffer for unknowns (The Scotty Principle!)

**How I Estimate:**

- Compare to similar work we've done
- Account for team experience with the technology
- Factor in dependencies and waiting time
- Add buffers for integration complexity
- Public holidays, shut downs, PTO. This comes from working with off shore teams

## Phase 5: Risk Management & Validation

### What I Plan For:

- Technical risks: "What if the API is slow?"
- Business risks: "What if requirements change?"
- Team risks: "What if someone gets sick?"
- Integration risks: "What if their system is down?"

**Validation Strategy:**

- Prototypes for uncertain UX, data structures
- Spikes for technical unknowns
- Early user feedback on mock ups. Feedback can just be one or two feature sponsors, as anything glaringly wrong is picked up. Risk is you get mired in feedback and the minutia.
- Testing strategy for critical paths

## The Questions To ask:

I've a further list here:

[Development questions]({{ site.baseurl }}{% link _posts/2023-08-24-development-questions.md %})

### For Requirements:

"What does success look like for the user?"
"What's the impact if we get this wrong?"
"Are there any compliance or security considerations?"
"What's the migration path from the current state?"

### For Technical Breakdown:

"What's the blast radius if this fails?"
"Where are the integration points?"
"What's our rollback strategy?"
"How will we monitor this in production?"

### For Planning:

"What's blocking us from starting this?"
"What would make this take 10x longer?"
"What assumptions are we making?"
"How do we validate we're building the right thing?"

## Example 1

Feature Request: "We need a dashboard for facilitators to see trainees activity"

### My Process:

- Clarify the problem: "What decisions will facilitators/managers make with this data?"
- Understand the users: "Which facilitators? How often will they use it?"
- Define success: "What does 'good activity' mean?"
- Map the data: "Where does this data come from? How fresh does it need to be?"
- Break it down:

```:bash
Story 1: Basic dashboard with hardcoded data (validate UX)
Story 2: Connect to real data sources
Story 3: Add filtering and date ranges
Story 4: Performance optimization and caching
```

- Plan for risk: "What if the data is wrong? What if it's slow?"

## Example 2

The framework applied to feature retirement/replacement rather than new development.

### Phase 1: Requirements Gathering & Clarification

What I Did:

- Stakeholder Discovery: "Who actually uses these apps and how?"
- Problem Definition: "What problem were native apps supposed to solve?" (differentiation, mobile engagement, notifications)
- Success Criteria Validation: "Are we achieving what we set out to achieve?"
- Constraints & Context: "What's the real cost of maintaining these?"

**Key Questions I Asked:**

- "What does the usage data actually tell us?"
- "Are users getting value from the features we built?"
- "What would happen if we stopped supporting these apps?"

### Phase 2: Technical Investigation & Feasibility

What I Did:

- System Impact Analysis: "What systems depend on these apps?"
- Data Flow Mapping: "Where is mobile traffic actually going?"
- Integration Points: "What APIs and services are app-specific?"
- Risk Assessment: "What's the risk of sun setting vs. continuing?"

**Deliverables:**

- Usage analytics analysis
- Cost/benefit comparison
- PWA feasibility assessment

### Phase 3: Breaking Down the Work

My Approach:

- User Journey First: "What do users actually need on mobile?"
- Vertical Slices:

  - Phase 1: PWA prototype to validate approach
  - Phase 2: Feature parity for core mobile use cases
  - Phase 3: Migration communication and app store removal

- Dependency Mapping: "What needs to happen in what order?"

### Phase 4: Estimation & Planning

What I Considered:

- PWA development time
- User communication and migration
- App store deprecation process
- Monitoring during transition
- Buffer for user feedback and issues

### Phase 5: Risk Management & Validation

What I Planned For:

- User resistance: "Some stakeholders and clients might be upset"
- Business pushback: "Stakeholders invested in native apps"
- Technical risks: "PWA might not cover all use cases"
- Validation Strategy: Built prototype first to prove concept
