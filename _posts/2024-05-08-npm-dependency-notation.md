---
title: "NPM Dependency Notation"
last_modified_at: 2024-05-08T12:58:01Z
categories:
  - Code
tags:
  - code
  - npm
  - nodejs
---

Dependency notation in the package.json file influences how npm handles version installations, and this affects whether npm install may update the package-lock.json file.

Here’s how it works based on different notations:

## Version Notations and Their Meanings:

### Exact Version (“4.19.2”):

**Notation:** “4.19.2”

**Meaning:** Install exactly version 4.19.2 of the package.

**Effect on npm install:**

- When this version is specified, npm will always install version 4.19.2, regardless of whether newer minor or patch versions are available. The package-lock.json will not be updated unless you manually change the version in package.json.

Example: If version 4.19.3 is available, npm will not install it.

### 2. Caret (^) Notation (“^4.19.2”):

**Notation:** “^4.19.2”

**Meaning:** Install any compatible version according to semver rules, meaning any version >=4.19.2 and <5.0.0.

**Effect on npm install:**

- With ^, npm allows updates to the minor and patch versions, but not the major version. This means if a newer patch version (like 4.19.3) or minor version (like 4.20.0) is available, npm will install it. If an update is installed, the package-lock.json will be updated to reflect the new version.

Example: If 4.20.1 is available, npm install will update package-lock.json to install 4.20.1.

### 3. Tilde (~) Notation (“~4.19.2”):

**Notation:** “~4.19.2”

**Meaning:** Install the most recent patch version that matches the specified minor version, meaning any version >=4.19.2 and <4.20.0.

**Effect on npm install:**

- With ~, npm will allow updates to the patch version but not the minor version. If a newer patch version is available (e.g., 4.19.3), npm will install it, and the package-lock.json will be updated.

Example: If version 4.19.5 is available, npm will install that, but it will not install version 4.20.0.

### 4. Major Version (“4.19”):

**Notation:** “4.19”

**Meaning:** This implies “4.19.x”, which means install the latest available patch version within the 4.19.x range.

**Effect on npm install:**

- This is similar to using ~4.19.0 but more permissive. It allows updates within the minor version and to any patch version (e.g., 4.19.2 → 4.19.5).

Example: If version 4.19.3 or 4.19.5 is available, npm will install it and update package-lock.json.

## Impact on npm install and package-lock.json:

**Exact version** (“4.19.2”): No updates will occur unless you change the version manually in package.json.

**Caret** (^4.19.2) or Major version (“4.19”): Newer patch or minor versions will be installed automatically, and this will update package-lock.json with the exact version.

**Tilde** (~4.19.2): Only patch updates are allowed, and package-lock.json will reflect those updates when they occur.

## How This Affects npm install:

If you use npm install (as opposed to npm ci), and the notation in your package.json allows for updates (like ^4.19.2), npm may install a newer version within the range, and as a result, the package-lock.json file will be updated with this new version.

On the other hand, if the package-lock.json specifies a version (say 4.19.2), and your package.json allows updates (^4.19.2), running npm install could still install a newer version (like 4.19.3), which would then update the lock file.

This flexibility is a double-edged sword: it allows for automatic updates of patches and minor versions, but if not managed well, it can lead to differences in installed versions across environments, which is why many teams prefer using npm ci in CI/CD pipelines for consistency.
