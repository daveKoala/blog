---
title: "Deterministic Randomness & Shuffling with Seeds"
last_modified_at: 2025-03-12T11:48:14Z
categories:
  - Code
tags:
  - code
---

TL;DR **Problem:** How do we shuffle an array randomly but repeatably (same seed = same order)?

- **Solution:** Use a pseudorandom number generator (PRNG) to generate consistent randomness.

## Requirements & Motivation

In many real-world applications, we need randomized but repeatable results. This is particularly useful in:

- Shuffling arrays predictably (e.g., ordering test questions the same way for all users with the same seed).
- Procedural generation in games (e.g., generating maps, terrain, or enemy placement).
- Consistent randomized behavior in experiments.

To achieve this, we need:

1. A pseudorandom number generator (PRNG) that produces the same sequence of numbers given the same seed.
2. A deterministic shuffle function that uses the PRNG to sort an array in a predictable but randomized way.

## Understanding PRNGs and Linear Congruential Generators (LCGs)

##### What is a PRNG?

A pseudorandom number generator (PRNG) is an algorithm that generates a sequence of numbers that appear random but are entirely predictable if you know the starting point (seed). PRNGs are commonly used in:

- Simulations
- Cryptography (though LCGs are not cryptographically secure)
- Games and procedural content generation

##### What is an LCG (Linear Congruential Generator)?

An LCG is one of the simplest types of PRNGs. It generates numbers using the recurrence relation:

> X<sub>n+1</sub> = (a ⋅ X<sub>n</sub> + c) mod m

Where:

- **X<sub>n</sub>** = the current state (initialized with the seed)
- **a** = multiplier (a carefully chosen constant)
- **c** = increment (another well-chosen constant)
- **m** = modulus (defines the number range)

This ensures that:

- Numbers stay within a bounded range (0 to m - 1).
- The sequence eventually repeats after m numbers.
- The output is deterministic (same seed = same sequence).

## Implementation

### Step 1: Create a Seeded PRNG (LCG Implementation)

```javascript
const seededRandom = (seed: number) => {
  const m = 2 ** 32; // Modulus: ensures numbers stay in a 32-bit range
  const a = 1664525; // Multiplier: chosen for good randomness
  const c = 1013904223; // Increment: another well-chosen constant
  let state = seed; // Initialize state with seed

  return function () {
    state = (a * state + c) % m; // Update state using LCG formula
    return state / m; // Normalize to a number between 0 and 1
  };
};
```

- The same seed always produces the same sequence.
- Different seeds result in different sequences.
- This approach is simple and lightweight.

## Step 2: Shuffle an Array Using the PRNG

```javascript
const shuffleArrayWithSeed = <T>(array: T[], seed: number): T[] => {
  const rng = seededRandom(seed); // Create PRNG instance

  return array
    .map((item) => ({ item, random: rng() })) // Assign a random number
    .sort((a, b) => a.random - b.random) // Sort based on the random number
    .map((obj) => obj.item); // Extract the shuffled items
};
```

- Deterministic Shuffling: The same seed produces the same shuffled order.
- Generics: Works with any array type.

### Testing the Implementation

To verify correctness, we must:

- Ensure seededRandom(seed) always produces the same sequence for a given seed.
- Ensure shuffleArrayWithSeed(array, seed) returns:
- The same order for the same seed.
- A different order for a different seed.
- The same elements as the original array.

### Test Cases

```:javascript
import { describe, expect, it } from '@jest/globals';
import { seededRandom, shuffleArrayWithSeed } from '../utils/random';

describe('seededRandom', () => {
  it('should generate the same sequence for the same seed', () => {
    const rng1 = seededRandom(42);
    const rng2 = seededRandom(42);

    expect(rng1()).toBe(rng2());
    expect(rng1()).toBe(rng2());
  });

  it('should generate different sequences for different seeds', () => {
    const rng1 = seededRandom(42);
    const rng2 = seededRandom(69);

    expect(rng1()).not.toBe(rng2());
  });
});

describe('shuffleArrayWithSeed', () => {
  it('should return the same shuffled order for the same seed', () => {
    const arr = [1, 2, 3, 4, 5];

    const shuffled1 = shuffleArrayWithSeed(arr, 42);
    const shuffled2 = shuffleArrayWithSeed(arr, 42);

    expect(shuffled1).toEqual(shuffled2);
  });

  it('should return different shuffled orders for different seeds', () => {
    const arr = [1, 2, 3, 4, 5];

    const shuffled1 = shuffleArrayWithSeed(arr, 42);
    const shuffled2 = shuffleArrayWithSeed(arr, 69);

    expect(shuffled1).not.toEqual(shuffled2);
  });

  it('should not modify the original array', () => {
    const arr = [1, 2, 3, 4, 5];
    const copy = [...arr];

    shuffleArrayWithSeed(arr, 42);

    expect(arr).toEqual(copy);
  });

  it('should contain the same elements after shuffling', () => {
    const arr = [1, 2, 3, 4, 5];

    const shuffled = shuffleArrayWithSeed(arr, 42);

    expect(new Set(shuffled)).toEqual(new Set(arr));
  });
});
```

## Final Thoughts

_This isn’t just a coding challenge—it’s a real engineering problem._

Unlike many algorithmic puzzles, real-world applications need repeatability. This deterministic shuffle:

- Ensures Fairness: For example, in randomized surveys where each participant gets the same order for a given seed.
- Aids Debugging: You can reproduce random behavior exactly.
- Supports Procedural Generation: Useful in games, AI-generated maps, etc.

## _PS. Is this the only way to do this?_

No.

While the LCG (Linear Congruential Generator) is a simple and efficient way to achieve deterministic randomness, other methods include:

- Xorshift: Offers better randomness while remaining lightweight.
- Hash-based PRNG: Allows seeding from strings (e.g., usernames).
- PCG: Provides higher-quality randomness.
- Mersenne Twister: Suitable for scientific simulations or AI, though it might be overkill.
- CSPRNG: Use for security-critical randomness (via crypto modules).

Deterministic randomness is a powerful tool for ensuring consistent behavior in systems that require repeatable randomization. Choose the method that best fits your application's needs and be mindful of the trade-offs between simplicity and randomness quality.
