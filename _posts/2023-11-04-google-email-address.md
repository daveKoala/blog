---
title: "Google email address"
last_modified_at: 2023-11-04T22:04:48Z
categories:
  - Code
tags:
  - Development
---

# Falsehoods Programmers Believe About Email

One fascinating example is how **Gmail ignores interior periods** in email addresses. For instance, addresses like:

- `foobar@gmail.com`
- `foo.bar@gmail.com`
- `f.o.oba.r@gmail.com`

all route to the same inbox. This quirk challenges the common assumption that every dot matters in email addresses.

The article "[Falsehoods Programmers Believe About Email](https://beesbuzz.biz/code/439-Falsehoods-programmers-believe-about-email)" does an excellent job of debunking various myths developers have about email handling. It highlights several key points, including:

- **Uniqueness Misconception:** Email addresses might seem like unique identifiers, but services like Gmail treat them differently by ignoring dots (and also the part after a plus sign).
- **Case Sensitivity:** While domain names are case-insensitive, the local part of an email address can be case sensitive—though many providers ignore case differences.
- **Formatting Flexibility:** Email addresses can include characters that programmers often overlook, leading to bugs when validating or normalizing emails.

This article is a great reminder that assumptions about email formats can lead to unexpected issues in software design, and it emphasizes the need for thorough testing and understanding of how different email providers handle addresses.

In short, the Gmail dots example is just one of many lessons—it's a powerful prompt for developers to question their assumptions and design systems that accommodate real-world behaviors.
