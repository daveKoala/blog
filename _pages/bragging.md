---
permalink: /brag/
title: "Brag Sheet: Accomplishments & Milestones"
---

_Note: Newest entries are at the top._

---

## Introduction

I don’t chase complexity for its own sake—I solve real problems.

The entries below highlight how I’ve quietly delivered robust, scalable systems—and made the complex look simple.

---

## How I Approach Problems

I start by asking: What’s the real problem here? What’s valuable? I don’t reach for complexity or trendy tech just to show off—I look for solutions that are understandable, maintainable, and resilient.

A lot of the work I do involves receiving a request, applying logic, and interacting with some kind of storage before returning a response. That sounds simple—but simplicity is often a design goal, not an accident. Under the hood, it means layering in the right amount of middleware, logging, caching, queueing, and secure communication—so things are observable, reliable, and easy to recover when they break.

I tend to prefer managed cloud services over rolling everything from scratch. Not because I can’t build it myself—but because letting teams focus on what creates value (not patching servers or fine-tuning autoscalers) is often the most effective technical choice. When I use a managed tool, I go deep: understanding its limits, tuning it for our needs, and planning for the edge cases where things might go wrong.

I build systems that are predictable under load, quick to debug when needed, and easy to hand over. The entries below reflect that mindset.

---

## New Team Members Creating a PR Within 30 Minutes of Joining (Deterministic Development Containers) – _2025_

By designing a "Don't Make Me Think" onboarding approach, I ensured that new developers can start coding and creating their first PRs within minutes. This efficiency is achieved by using containers for deterministic deployments and development environments, eliminating the “It works on my machine” problem.

**Highlights:**

- Pre-configured Visual Studio Code with the necessary extensions and settings.
- Automatic installation of the correct Node.js version and NPM modules.
- **Example Flow:**
  1. Install and start Docker Desktop.
  2. Clone the repository.
  3. Follow the instructions in the README.
  4. Run a command (e.g., `make up`) to get started.

Additional tools and commands are documented in the Makefile for quick reference.

---

## Internal Headless CMS Platform – _2025_

**Challenge:**

Our organization needed a versatile internal headless CMS that could manage complex content workflows, cater to a global audience (including users in restricted regions), and integrate with emerging AI tools—all while ensuring robust content control and feedback loops for continuous improvement.

**Solution:**

We built a custom headless CMS with a comprehensive suite of features:

- **Content Versioning & Approval:** Every change was meticulously tracked and approved, ensuring high content integrity.
- **Secure by Default:** Built in a vNet-bound architecture with private access to storage and AI tools. Added optional audit trails and PII flagging per content type.
- **Global Media Accessibility:** Media hosting and delivery were optimized to ensure seamless access, even in restricted regions like China.
- **Granular Content Grouping:** Content could be grouped, tagged, and accessed via unique API keys, allowing different clients and departments to manage their data securely.
- **Departmental Autonomy:** Root departments were empowered to create and ring-fence their own content, fostering ownership and localized control.
  Usage Tracking for Billing: Detailed usage tracking was integrated to support transparent internal billing and resource management.
- **Manual i18n with Workflow Support:** Language switching built in, with localized approval paths—critical where content is legally or technically sensitive.
- **AI Integration:** AI-powered editing and image creation features enhanced creative workflows, while internal AI tools leveraged the content for training networks.
- **Speed & Performance Focus:** The CMS was optimized for rapid content delivery, ensuring high performance under demanding conditions.
- **User Feedback Mechanism:** A dedicated feature allowed end users to provide direct feedback to content creators/editors when information was wrong or out of date, enabling prompt updates and continuous content improvement.
  Key Outcomes:

- **Enhanced Operational Efficiency:** Streamlined content workflows and a robust approval process reduced delays and increased productivity.
- **Improved Global Reach:** Optimized media delivery ensured that all users, including those in restricted regions, experienced reliable access.
- **Empowered Departments:** Departments gained the autonomy to manage their content securely and effectively.
- **Advanced AI Capabilities:** Integrated AI features not only boosted creative processes but also supported internal network training.
- **Transparent Resource Management:** Comprehensive usage tracking facilitated clear billing practices and better resource allocation.
- **Continuous Improvement:** The user feedback loop ensured that content remained accurate and up to date, directly addressing issues flagged by end users.

This project stands as a testament to our ability to develop innovative, custom solutions that not only address complex organizational needs but also foster continuous improvement and cross-departmental collaboration.

---

## Azure Container Apps Migration & Modernization

**Challenge:**

Our original setup on Azure AKS was expensive (approximately £6k/month), overly complex, and dependent on niche expertise that our team didn’t possess. The AKS environment was built by an external contractor, making reliable disaster recovery a significant concern.

**Solution:**

We migrated our backend services from AKS to Azure Container Apps (ACA). Leveraging ACA alongside integrated services such as Traffic Manager and vNets, we created a hosting environment that was robust, easier to manage, and far more cost-effective.

### Key Outcomes:

**Robustness:**

Managed services meant that Azure automatically handled updates, reducing operational overhead.

**Reliability:**

Automated improvement recommendations and integrated logging enhanced system stability.

**Cost Effectiveness:**

Monthly hosting expenses dropped from approximately £6k to £1.5k, yielding significant savings while bolstering service confidence.

**Disaster Recovery:**

By automating environment deployments via Bicep templates, our environments became disposable. With a few PRs or manual triggers, we could rapidly spin up new environments—eliminating prolonged downtimes and allowing time to diagnose issues and incorporate improvements.

**Team and Business Impact:**

The company gained greater confidence in its product (demonstrated by a live environment rebuild during a meeting), while the team expanded its expertise in managing outages, ensuring we are prepared even though no major incidents have occurred.

### Additional Reflections:

**Positive:**
The migration streamlined operations and improved overall system transparency, allowing developers to easily understand the architecture. A live demo of rapid environment provisioning served as a compelling proof of concept for stakeholders.

**Constructive Considerations:**

While a few manual steps (like configuring Traffic Manager redirects) required documented interventions, these were minimal. ACA does not expose all the settings and features that AKS does, but that has not really an issue as our work loads don't do anything 'out the ordinary'

## Rethinking Native Apps: From Complexity to Cohesion – _2023_

We were maintaining native apps on iOS and Android, but usage logs told a different story. Most users only engaged in bursts, ignored notifications, and preferred desktop for real work.

### My Proposal:

- Kill the Native App. Replaced the high-maintenance mobile builds with a PWA (Progressive Web App)—no downloads, no stores, just install and go.

- Feature Shift:

  - **Notifications** became in-app alerts + email summaries.

  - **Usage-triggered** scheduled emails gave users more control.

  - **Video and PDF** consumption improved with lazy loading and mobile-first responsive design.

  - Prototype Delivery: Built a proof-of-concept PWA to show it could install and behave like a native app, with no App Store overhead—perfect for clients behind locked-down IT environments.

### Engineering Highlights:

Implemented **Service Workers** for offline support and background sync.

Used **IndexedDB** for client-side storage of articles and preferences.

Auto-generated manifests and smart caching strategies to improve installability and reduce server load.

## Results:

**Faster delivery, better UX, lower cost.** One unified app for all platforms, without the overhead of app store compliance or native SDK divergence.

---

## Walked Developers Through Our Infrastructure (Azure AKS/Kubernetes) – _2023_

Led a session on managing our Azure AKS deployments, enabling developers to manipulate deployments and access logs for error tracking.

**Key Points:**

- Utilized Azure CLI for deployment management.
- Introduced [Lens](https://k8slens.dev/) for intuitive Kubernetes navigation.
- Demonstrated fetching credentials and navigating through AKS deployments and pods.

---

## Node.js from .NET: Migrating Microservices – _2024_

Planned, supported, tested, and rolled out the migration of our microservices from .NET to Node.js. This plug-and-play transition ensured no service disruption while enhancing team knowledge and collaboration.

**Achievements:**

- Seamless migration with no downtime.
- Improved team cross-functionality—knowledge was no longer siloed.
- Enhanced logging and operational insights.

---

## "Arrr! Production Has Stopped Working!!!" – _2022_

Addressed the first production outage in nearly four years. Comprehensive logging throughout the request lifecycle allowed the team to pinpoint and resolve a permissions issue between a vNet and a database within an hour. Although the root cause remains unclear, the proactive response (see our "Chaos Testing" initiative) prevented further recurrence.

---

## Workflow and Pipelines Enhancement – _2022_

Developed a new deployment pipeline for React projects, streamlining our workflow to achieve faster deployments and quicker feedback cycles.

---

## Infrastructure as Code (IaC) – _2022_

Expanded a proof of concept into a templated, reproducible infrastructure solution that meets organizational requirements.

**Key Initiatives:**

- Implemented multi-stage deployments (Dev, UAT, Prod) with scalability.
- Automated resource creation within a vNet.
- Secured management of secrets and connection strings via a templated Azure Key Vault accessible in build pipelines.

---

## Five-Nines Availability and Continuous Deployments – _Ongoing_

Enhanced our microservice-based platform by implementing:

- Multiple daily deployments with full rollback capabilities.
- Automated testing and auditing processes.
- Manual release gates when necessary.
- Templated releases to Docker containers within AKS, ensuring high availability and stability.

---

## Chaos Testing & Building Resilience – _Ongoing_

In response to growing system complexity, I spearheaded the automation of stress testing—dubbed "Chaos Testing"—to ensure our services remain resilient under pressure.

**Chaos Testing Approaches:**

### Planned Chaos within CI/CD Pipelines

- Deliberately reduce performance or resources.
- Run tests to confirm that applications function or fail gracefully.

### Random Chaos

- A CRON-driven script that randomly disables services or throttles resources.
- Benefits observed:
  - Self-healing of many services.
  - Controlled error responses (400/500 status codes).
  - Assurance that apps fail gracefully under stress.

---

_Inspired by [jvns.ca/brag-documents](https://jvns.ca/blog/brag-documents/)._
