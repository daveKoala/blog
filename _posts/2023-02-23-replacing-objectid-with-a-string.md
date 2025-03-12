---
title: "Replacing ObjectId with a String in JSON Using Regex"
last_modified_at: 2023-02-23T21:55:34Z
categories:
  - Code
tags:
  - visual studio code
  - regex
---

## Problem

When working with MongoDB data dumps in JSON format, ObjectIDs are represented as:

```json
"_id" : ObjectId("5e3b1890e032d225a091d43f"),
"userId" : ObjectId("65ed1c2c-922c-4c82-b5bc-7324f69eea10"),
```

However, for many use cases you need these values to be plain strings:

```json
"_id" : "5e3b1890e032d225a091d43f",
"userId" : "65ed1c2c-922c-4c82-b5bc-7324f69eea10",
```

## Approach

We can achieve this using Visual Studio Code’s Find and Replace with Regular Expressions.

**Step 1: Open Find and Replace**

- Press Ctrl+F (or Cmd+F on macOS) to open the search.
- Click the .\* icon to enable regex search.

**Step 2: Configure the Regex**

Find Pattern:

```regex
ObjectId\("([0-9a-fA-F]{24})"\)
```

This pattern captures the 24 hexadecimal characters within ObjectId("...").

Replace With:

```plaintext
"$1"
```

The replacement uses the captured group ($1) to output just the string inside the ObjectId.

### Example Transformation

```:javascript
"_id" : ObjectId("5e3b1890e032d225a091d43f"),
"userId" : ObjectId("65ed1c2c-922c-4c82-b5bc-7324f69eea10"),
```

### Bonus: Replacing ISODate

If you also need to replace `ISODate("...")` with a plain string, use this pattern:

Find Pattern:

```regex
ISODate\("([^"]+)"\)
```

Replace With:

```plaintext
"$1"
```

This captures the date string inside ISODate and replaces the whole expression with just that string.
