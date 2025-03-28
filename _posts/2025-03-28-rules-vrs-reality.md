---
title: "Rules vrs Reality"
last_modified_at: 2025-03-28T13:55:30Z
categories:
  - Blog
tags:
  - Development
---

## Why We Ignore Standards, and What to Do About It

In nearly every software team, there’s a list of rules, standards, or guidelines we’re supposed to follow.

- Coding standards.
- Security checklists.
- Documentation requirements.
- CI/CD policies.

But ask most developers — from juniors to seniors — and they’ll admit that some of these are ignored, skipped, or worked around. Not because we’re lazy or don’t care, but because the real world doesn’t always match what the rule assumes.

So why does this happen? And what can we do to close the gap between the rules and the work?

This essay explores that familiar, frustrating space between _what we say we do_ and _what we actually do_ — and how we can manage it better as developers, teams, and organizations. I’ll draw on my training in Behavioural Science, my previous career managing high-risk environments, and my observations from the past 10 years working with both small teams and inside very large organizations.

## The Imaginary World of “How Things Should Be”

There’s a useful concept from safety science called **“Work-as-Imagined” vs “Work-as-Done.”**

- **Work-as-Imagined (WAI)** is how managers, process designers, or governance teams _think_ work should be done. It lives in documentation, flowcharts, and checklists.
- **Work-as-Done (WAD)** is what actually happens on the ground — the improvisations, trade-offs, and shortcuts people use to get things done.

Most problems happen in the gap between these two.

For example, a company might define a strict process:

- Every code change must go through peer review
- Full test coverage
- formal deployment checklist.

But when you’re fixing a production bug at 2 AM, that process can feel like a luxury — so you patch it directly and tell yourself you’ll clean it up later.

The bigger the gap between WAI and WAD, the more effort is spent on enforcement. Instead of improving the system, teams spend energy _policing_ behaviour, chasing compliance reports, or pretending to follow processes just to keep management happy.

## “Compliance Theatre”: When Appearance Replaces Substance

This leads us to another term: **compliance theatre**.

You’ve seen it before. It’s when a team or organization goes through the motions of following rules without actually doing anything useful.

- Writing fake unit tests to satisfy a 100% coverage policy.
- Copy-pasting comments just to tick the “documented” box.
- Filling out forms no one reads, just to pass a governance check.

The appearance of compliance becomes more important than real quality, safety, or learning. It’s a charade — and most developers know it.

But it’s not just a software thing. The term originally gained traction in info-security and corporate governance. A company might pass a security audit by showing paperwork — while leaving critical vulnerabilities unpatched. One recent case involved a government contractor paying $11 million for falsely claiming compliance with cybersecurity standards — a textbook case of compliance theatre in action.

## “Normalization of Deviance”: When Bending the Rules Becomes the Norm

Another concept that helps explain this behaviors is **normalization of deviance**, coined by sociologist Diane Vaughan after studying the Challenger space shuttle disaster.

The idea is simple: when you break a rule and nothing bad happens, you’re more likely to break it again. Over time, these “exceptions” become accepted. People forget the original reason for the rule, and the risky behaviour becomes the new normal.

In dev teams, this happens all the time:

- Skipping code reviews when under pressure.
- Pushing directly to main “just this once.”
- Merging code without resolving TODOs because the release is due.

Eventually, the team stops seeing these as exceptions. They become routine — until something breaks.

## Why We Bend or Break the Rules

Let’s dig deeper into the _why_. Here are the most common reasons teams ignore or work around formal standards:

### 1. Time Pressure

Deadlines, production bugs, stakeholder expectations — time pressure is one of the biggest drivers. When things get tight, optional steps get skipped. Often, this pressure isn’t even explicit — teams just feel it, and cut corners preemptively.

### 2. Overly Complex or Unusable Rules

If a coding standard or deployment process is too long, unclear, or painful, people will avoid it. Developers are good at finding the path of least resistance — especially if the rule feels disconnected from actual outcomes.

### 3. Rules Written Without Developers in Mind

Sometimes standards are made by governance teams, security folks, or architects far removed from daily work. If the process assumes ideal conditions (e.g., time, resources, full knowledge), it may clash with the messy, real-world scenarios developers face.

### 4. Low Perceived Value

If a rule feels like “just paperwork,” developers will do the bare minimum to comply — or quietly ignore it. This is especially true when rules are framed as obligations, not opportunities to improve quality or safety.

### 5. Bad Tools and Friction

If following the rule slows you down — like a security scanner that takes 30 minutes or a CI gate that blocks for false positives — you’ll find ways around it. Tools should support compliance, not make it harder.

### 6. Cultural Signals

If leadership breaks the rules when convenient (e.g., asking for an urgent fix without tests), that behaviours becomes normalized. Similarly, if teams are praised only for shipping, not for quality or sustainability, rules get de-prioritized.

### 7. Shadow Processes and “Desire Paths”

When the official way is too slow or clunky, teams create workarounds — like “fast-track” deploys or Slack-based approvals. These informal routes are the equivalent of desire paths: the dirt trails people make by ignoring the paved walkway.

## How Organizations Typically Respond

Most companies respond to non-compliance in one of three ways:

### 1. Crack Down and Police It

They introduce more controls, more forms, more checklists. Maybe even a dedicated “compliance officer.” But this often backfires — increasing the WAI–WAD gap, generating resentment, or pushing workarounds underground.

### 2. Fake It Till You Pass the Audit

This leads to compliance theatre — where teams tick boxes, forge paperwork, or auto-generate documentation just to keep the auditors off their backs.

### 3. Bridge the Gap

The best organizations take a different approach: they study where the gaps are, understand why people deviate, and either adjust the rules or improve the workflow.

**They treat non-compliance as a _signal_, not a failure.**

## What Actually Works

### 1. Make the Right Thing the Easy Thing

Good DevOps and DevSecOps practice does this well. Want developers to write secure code? Give them secure-by-default libraries and clear linters. Want tests? Automate them into the pipeline. Compliance shouldn’t be a separate chore — it should be embedded into the workflow.

### 2. Listen to the Work-as-Done

Observe how people _actually_ work — not how you think they work. Do retros, run process audits, talk to teams. Ask questions like:

- Why do we skip this step?
- What’s slowing us down?
- What would make this easier?

This can reveal pain points, inefficiencies, and outdated rules that need revising.

### 3. Refactor Your Processes Like You Refactor Code

Just like code, processes need maintenance. If a rule doesn’t serve a purpose, cut it. If it’s too painful, improve it. Treat processes as living things, not sacred doctrine.

### 4. Prioritize Psychological Safety

If people are afraid to admit they took a shortcut or broke a rule, they’ll lie or hide problems. But if your culture encourages honesty and learning, teams can raise issues early — and you can fix systemic problems before they cause harm.

### 5. Lead by Example

If leadership models good behaviour — following the process even under pressure, respecting downtime, prioritizing learning — teams will follow. But if leaders bypass rules or reward only short-term delivery, the message is clear: “rules don’t matter.”

### 6. Explain the “Why”

People are more likely to follow a rule if they understand its purpose. For example, if you show that a secure coding standard prevented a breach last year, teams are more likely to respect it.

- Don’t just say _“do this because compliance says so.”_

- Say _“do this because here’s what happens if you don’t.”_

## Real Example: Paving the Desire Path

Some organizations have adopted a clever approach inspired by _desire paths_. Instead of designing the perfect process upfront, they wait to see how people naturally work — and then pave over the dirt trail.

In software terms, this might mean:

- Watching how teams handle hotfixes — and then formalizing a lightweight emergency deploy process.
- Seeing which parts of a checklist are always skipped — and questioning whether they’re useful.
- Capturing unofficial best practices and turning them into real documentation.

The result? Processes that people actually use, because they reflect reality.

## Closing the Gap: A Developer's Playbook

Whether you’re a dev, tech lead, or manager, here’s a practical playbook to help reduce the gap between rules and reality:

| What You Can Do                   | Why It Helps                                              |
| --------------------------------- | --------------------------------------------------------- |
| Ask _why_ a rule exists           | Builds understanding and can surface outdated rules       |
| Raise pain points in retros       | Helps teams refine their own processes                    |
| Suggest better defaults/tools     | Makes compliance easier and more automatic                |
| Document the “real” process       | Makes informal practices visible and shareable            |
| Call out compliance theatre       | Prevents box-ticking and opens discussion for improvement |
| Respect rules — or challenge them | Improves ownership and encourages critical thinking       |
| Foster safety to admit shortcuts  | Encourages honesty and system-level improvements          |

## Final Thoughts

There will always be a tension between what we _intend_ to do and what actually happens. In software, where conditions change rapidly, it’s unreasonable to expect perfect rule-following. But it’s also dangerous to let standards slide into irrelevance.

Instead of pretending the gap doesn’t exist — or punishing people for crossing it — smart teams use that gap as a feedback loop. They study the differences, learn from them, and evolve both their processes and their culture.

As developers, we owe it to ourselves and our users to do more than follow rules blindly — or break them silently. We need to be active participants in shaping rules that work. That means asking hard questions, improving what’s broken, and holding each other to a high standard — not just of _compliance_, but of _craft_.

## References

1. Hollnagel, E. (2012). _FRAM: The Functional Resonance Analysis Method_. CRC Press.
2. Dekker, S. (2014). _The Field Guide to Understanding 'Human Error'_. Ashgate.
3. Vaughan, D. (1996). _The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA_. University of Chicago Press.
4. Meyer, J. W., & Rowan, B. (1977). Institutionalized Organizations: Formal Structure as Myth and Ceremony. _American Journal of Sociology_, 83(2), 340–363.
5. Sandholtz, K. W. (2012). Making Standards Stick: A Theory of Coupled vs. Decoupled Compliance. _Organization Studies_, 33(5-6), 655–679.[journals.sagepub.com](https://journals.sagepub.com/doi/10.1177/0170840612443623?icid=int.sj-abstract.citing-articles.41#:~:text=corporation%20sought%20to%20standardize%20their,how%20three%20common%20modes%20of)
6. Willis, J. (2020). Security and Compliance Theater – The Seventh Deadly Disease of DevOps. [Talk Transcript](https://itrevolution.com/articles/devops-and-the-seven-deadly-diseases/).
7. Finkle, M. (2024). Work-As-Imagined vs. Work-As-Done in DevOps. [Stark Raving Finkle Blog](https://starkravingfinkle.org/blog/2024/04/work-as-imagined-vs-work-as-done/#:~:text=There%20are%20whole%20industries%20and,accidents%20can%20have%20horrible%20consequences).
8. Noda, K. (2023). Time Pressure in Software Development. [Research Summary](https://newsletter.getdx.com/p/time-pressure-in-software-development).
9. U.S. Department of Justice. (2023). Government Contractor to Pay $11.2 Million Over False Cybersecurity Claims. [justice.gov](https://www.justice.gov/opa/pr/).
10. Gartner (via Wiz). (2024). The Rise of Shadow IT: Trends and Strategies for IT Governance. [wiz.io](https://www.wiz.io/blog/).
11. David Embrey (2024). Tackling Procedural Non-Compliance in the Workplace: Insights and Solutions[www.humanreliability.com](https://www.humanreliability.com/2024/11/tackling-procedural-non-compliance-in-the-workplace/#:~:text=1)
12. David Rodenas (2023). Confirmed: Code Coverage Is a Useless Management Metric [medium.com](https://medium.com/better-programming/confirmed-code-coverage-is-a-useless-management-metric-35afa05e8549#:~:text=Confirmed%3A%20Code%20Coverage%20Is%20a,to%20achieve%20higher%20code)
13. (2024). What Is Shadow IT? Causes, Risks, and Examples
    [www.wiz.io](https://www.wiz.io/academy/shadow-it)
14. Wikipedia. Decoupling (organizational studies) [en.wikipedia.org](<https://en.wikipedia.org/wiki/Decoupling_(organizational_studies)#:~:text=1.%20,01%29.%20%2046%20%22From%20Smoke>)
15. (2025) The Cost of Compliance Theater: DoD Contractor Pays $11.2M for False Cybersecurity Certifications [www.centraleyes.com](https://www.centraleyes.com/the-cost-of-compliance-theater-dod-contractor-pays-11-2m-for-false-cybersecurity-certifications/#:~:text=The%20implications%20extend%20beyond%20HNFS,actually%20implementing%20security%E2%80%94has%20real%20consequences)
