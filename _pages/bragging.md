---
permalink: /brag/
title: "Brag Sheet: Accomplishments & Milestones"
---

_Note: Newest entries are at the top._

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
- **Global Media Accessibility:** Media hosting and delivery were optimized to ensure seamless access, even in restricted regions like China.
- **Granular Content Grouping:** Content could be grouped, tagged, and accessed via unique API keys, allowing different clients and departments to manage their data securely.
- **Departmental Autonomy:** Root departments were empowered to create and ring-fence their own content, fostering ownership and localized control.
  Usage Tracking for Billing: Detailed usage tracking was integrated to support transparent internal billing and resource management.
- **Manual Multi-Language Support:** Recognizing the sensitivity and technical nature of the content, manual language support was implemented for accuracy.
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

## While a few manual steps (like configuring Traffic Manager redirects) required documented interventions, these were minimal. ACA does not expose all the settings and features that AKS does, but that has not really an issue as our work loads don't do anything 'out the ordinary'

## Rethinking Native Apps: Delivering Efficiency & a Unified Experience - _2024_

- **Challenge:** Developing both desktop and native app versions was slow and expensive for our small team. The “write once, use anywhere” promise was overhyped.
- **Insights from the Logs:**
  - **Usage Patterns:** App usage peaked just before events.
  - **User Behavior:** 95% of users turned off notifications.
  - **Content Consumption:** Native apps were mainly used to read articles and watch some video, while the desktop version was preferred for interactions, media consumption (videos, PDFs), and richer features.
- **My Contribution:**
  - **Strategic Proposal:** Advocated for ditching the native apps in favor of a responsive desktop application.
  - **Innovative Pivot:** Transformed the desktop app into a Progressive Web App (PWA) to capture mobile benefits without the overhead of native development.
  - **Feature Enhancements:** Redesigned notifications as in-app alerts and a news feed, and improved scheduled emails to allow users to tailor content.
  - **Prototype:** Presented a “quick and dirty” version of the PWA to owners and directors, demonstrating easy installation—even for clients unable to download native apps.
- **Outcome:** Streamlined development, reduced costs, and delivered a unified, accessible user experience across platforms.

---

## Walked Developers Through Our Infrastructure (Azure AKS/Kubernetes) – _2025_

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
