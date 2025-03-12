---
title: "npm install"
last_modified_at: 2024-05-10T13:24:29Z
categories:
  - Code
tags:
  - code
  - npm
  - nodejs
---

I needed to take a step back and fully understand this issue so I could explain it clearly to both new and experienced developers. The problem surfaced because our deployment pipelines `run npm audit`, which became a bottleneck in our process. We kept seeing the same vulnerabilities flagged repeatedly, even though they had been fixed multiple times.

## Here we go, npm instal, ci and audit

Here’s an overview of the flow from installing a new package with npm to running npm install or npm ci in a pipeline, along with details on how vulnerabilities may resurface through npm audit.

### Flow from Installing a Package to CI/CD

#### 1 Installing a Package:

- When you install a new package locally (e.g., `npm install <package-name>`), npm adds the package to the `node_modules` directory and updates your `package.json` and `package-lock.json` files (or yarn.lock if you use Yarn).

- `package.json` specifies the declared dependencies and their versions.

- `package-lock.json` contains the exact versions of the installed packages and their entire dependency tree (including transitive dependencies). This ensures that everyone who installs your project gets the same versions of dependencies.

#### 2. Pushing to Version Control:

Once you are satisfied with your code, including the new dependency, you push the changes to version control (e.g., Git). It’s important that both the `package.json` and `package-lock.json` files are committed to ensure consistency across environments.

#### 3. Pipeline – npm install vs npm ci:

**`npm install`:**

During a build or deployment pipeline, running `npm install` will install dependencies based on the package.json and update the node_modules directory.

If a `package-lock.json` file exists, npm tries to install exact versions from the lock file, but if it detects any changes (e.g., new versions of dependencies or conflicts), it may update the lock file. (See dependency notation)

**`npm ci:`**

- In a CI/CD pipeline, npm ci is preferred as it is faster and more deterministic.
- It strictly adheres to the versions specified in package-lock.json. If any discrepancies (such as missing or extra dependencies) are found, the entire node_modules directory is deleted, and the exact dependencies from the package-lock.json are installed.
- npm ci does not update package-lock.json, making it ideal for CI environments where reproducibility is critical.

#### 4. `npm audit`:

During or after the install process, npm may run `npm audit` to check for security vulnerabilities in your dependencies. It compares the installed packages against a database of known vulnerabilities and flags any risks.
`npm audit fix` can automatically update vulnerable dependencies to the latest non-breaking versions (as defined by server).

#### How Does `npm audit` problems reappear?

**Indirect Dependencies (Transitive Dependencies):**

Most npm packages rely on other packages (dependencies of dependencies), and vulnerabilities often arise in these indirect dependencies.

Even if you’ve addressed an issue by updating your direct dependencies, some transitive dependencies may still have unresolved issues. This happens because they may not have yet released a fixed version.

**New Vulnerabilities Discovered:**

Sometimes, new vulnerabilities are discovered in packages that were previously considered safe. When npm’s vulnerability database is updated, a previously resolved issue may reappear if it’s related to a newly discovered flaw.

**Out-of-Date Dependencies:**

- When the `package-lock.json` or a specific package hasn’t been updated for a while, and a vulnerability was later fixed in a newer version, your audit might flag the outdated dependency.
- Running `npm audit` regularly (especially on pipelines) will catch such vulnerabilities, but sometimes an older transitive dependency may bring back the issue.

**Partial Fixes:**

Sometimes, packages release partial fixes, where only certain issues are resolved. If the fix doesn’t cover all security concerns, npm audit may still flag the package.

**Conflicts Between Versions:**

Certain updates may not be backward compatible with your project’s current environment or with other dependencies. This can lead to situations where you are unable to fully update vulnerable dependencies without breaking something else in your codebase.

## Dealing with Persistent npm audit Problems:

**Explicit Version Control:** Sometimes you may have to manually control the versions in package-lock.json by using specific version ranges or resolutions (in tools like Yarn) to enforce the use of patched versions.

**Selective Fixing:** If you know a particular vulnerability doesn’t affect your project (e.g., it only impacts a feature you don’t use), you can audit it with exceptions.

**Monitor Transitive Dependencies:**

Regularly check your dependency tree to monitor transitive dependencies and see if any have lagging versions. This can be done using tools like npm ls or through dependency-checking platforms.
