---
title: "Assertions vs Validation"
last_modified_at: 2025-03-28T10:50:58Z
categories:
  - code
tags:
  - Development
---

## TL:DR Key Difference

- Validation = guard for real-world use (e.g., from user input).
- Assertion = internal assumption ("this should never happen").

👉 Assertions can be stripped out in production code, whereas validation usually stays.

## An assertion is a programming sanity check:

It’s a way to say, “I assert this must be true—if it’s not, something’s wrong.”

In JavaScript, we often use assertions during development or testing to catch bugs early by checking that assumptions in the code hold true.

## Why Use Assertions?

- They help you fail fast when something goes wrong.
- They protect against unexpected inputs or states.
- They act as self-documenting code.
- They reduce the risk of hard-to-find bugs later.

## Example

### Without assertions

```javascript
function divide(a, b) {
  return a / b; // Uh-oh... what if b is 0?
}

console.log(divide(10, 0)); // Infinity, no error!
```

### Add an Assertion

```typescript
function assert(condition, message) {
  if (!condition) {
    throw new Error(message || "Assertion failed");
  }
}

function divide(a, b) {
  assert(b !== 0, "Divider 'b' must not be zero");
  return a / b;
}

console.log(divide(10, 0)); // ❌ Throws: "Divider 'b' must not be zero"
```

This immediately stops execution with a clear error, rather than letting weird behavior (like Infinity) happen silently.

## Where to Use Assertions

**Check function inputs:**

```javascript
function greet(name) {
  assert(typeof name === "string", "Name must be a string");
  console.log(`Hello, ${name}`);
}
```

**Validate internal state:**

```javascript
function process(data) {
  assert(data !== null && typeof data === "object", "Invalid data");
  // do stuff
}
```

**Unit tests (using testing libraries like Chai or Node’s assert module):**

```javascript
const assert = require("assert");
assert.strictEqual(add(2, 2), 4); // ✅ passes
assert.strictEqual(add(2, 2), 5); // ❌ fails
```

There are libraries out there that can help or if you want you can write tool/class yourself its not difficult for straight forward assertions

## So where does Typescript types/interfaces etc come into it?

TypeScript types and interfaces help you catch bugs before runtime, during development and compilation. Think of it as:

- TypeScript = compile-time protection
- Assertions = runtime protection

They serve different purposes, but work beautifully together.
