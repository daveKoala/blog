---
title: "Postman Reusable Scripts"
last_modified_at: 2025-04-23T09:34:22Z
categories:
  - Blog
tags:
  - Development
---

I keep forgetting this.

## Problem

I have need of some reusable methods/functions when I am testing my API's with Postman. For example in one collection I need a random string from an array and i need to define that once.

## Solution

In the collections pre-request script I can add this:

```bash

moodi = {
    /**
     * @returns {*} Random array element
     */
    targetScopeRandom() {
        const arr = ['Engineering', 'HR', 'Accounts', 'Sales']
        const idx = Math.floor(Math.random() * arr.length);
        return arr[idx];
    },
};

```

Use it in the requests own pre-request script like this

```bash
const targetScope = moodi.targetScopeRandom();
```

## Note

While this works fine in my use case, I have wondered if this is a real solution --- I need to spend time on it
