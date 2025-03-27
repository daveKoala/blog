---
title: "Basic patterns for 99% of development"
last_modified_at: 2024-03-12T14:13:31Z
categories:
  - code
tags:
  - Development
---

I had to explain this to a couple of new devs on the team. Not that their code was wrong, but there is a way of approaching problems that make better sense.

So here is my take on Strategy and Builder patterns

TL;DR:
Use the Strategy pattern when you need interchangeable algorithms, the Builder pattern when constructing complex objects with many optional properties. In most cases, Strategy and Builder suffice.

## Strategy

### What is it?

The Strategy pattern lets you define a family of methods, classes, algorithms and encapsulate each one, and make them interchangeable. This is especially helpful when you have multiple ways to perform a task and want to avoid a tangle of conditionals.

### Before: A Mess of Conditionals

Imagine calculating a discount where you choose between a percentage discount and a fixed discount. Without the pattern, you might write something like:

```typescript
function calculateDiscount(
  price: number,
  discountType: string,
  discountValue: number
): number {
  if (discountType === "percentage") {
    return price * (discountValue / 100);
  } else if (discountType === "fixed") {
    return discountValue;
  }
  return 0;
}

// Usage
const discount = calculateDiscount(200, "percentage", 10);
```

This works, but as the number of discount types grows, the logic becomes hard to manage.

### After: Applying the Strategy Pattern

With Strategy, we define a common interface and create separate classes for each discount type:

```typescript
// Define the strategy interface
interface DiscountStrategy {
  calculate(price: number, discountValue: number): number;
}

// Concrete strategies
class PercentageDiscount implements DiscountStrategy {
  calculate(price: number, discountValue: number): number {
    return price * (discountValue / 100);
  }
}

class FixedDiscount implements DiscountStrategy {
  calculate(price: number, discountValue: number): number {
    return discountValue;
  }
}

// Context that uses a strategy
class DiscountCalculator {
  constructor(private strategy: DiscountStrategy) {}

  getDiscount(price: number, discountValue: number): number {
    return this.strategy.calculate(price, discountValue);
  }
}

// Usage
const percentageCalc = new DiscountCalculator(new PercentageDiscount());
console.log(percentageCalc.getDiscount(200, 10)); // 20

const fixedCalc = new DiscountCalculator(new FixedDiscount());
console.log(fixedCalc.getDiscount(200, 10)); // 10
```

### When to Use Strategy

When you have multiple algorithms that can be swapped out at runtime.

When you want to eliminate conditional logic by encapsulating related behaviors.

### Drawbacks

- It may introduce additional classes or functions, which could feel like over-engineering for very simple cases.
- Managing many small strategy classes can become cumbersome if not organized well.

## Builder

## What is it?

The Builder pattern is ideal for constructing objects that require multiple steps or have many optional properties. It separates the construction of a complex object from its representation.

### Before: Telescoping Constructors and Object Literals

Consider creating a User object with several optional properties. Without a builder, you might have a long constructor or an object literal with many optional fields:

```typescript
// Using a constructor with many optional parameters
class User {
  constructor(
    public firstName: string,
    public lastName: string,
    public age?: number,
    public email?: string,
    public address?: string
  ) {}
}

const user1 = new User("John", "Doe", 30, "john@example.com", "123 Main St");
```

As more properties are added, the constructor becomes hard to maintain and error-prone.

### After: Using the Builder Pattern

A builder provides a fluent interface to set only the fields you need:

```typescript
class User {
  firstName!: string;
  lastName!: string;
  age?: number;
  email?: string;
  address?: string;
}

class UserBuilder {
  private user: User = new User();

  setFirstName(firstName: string): UserBuilder {
    this.user.firstName = firstName;
    return this;
  }

  setLastName(lastName: string): UserBuilder {
    this.user.lastName = lastName;
    return this;
  }

  setAge(age: number): UserBuilder {
    this.user.age = age;
    return this;
  }

  setEmail(email: string): UserBuilder {
    this.user.email = email;
    return this;
  }

  setAddress(address: string): UserBuilder {
    this.user.address = address;
    return this;
  }

  build(): User {
    return this.user;
  }
}

// Usage
const user2 = new UserBuilder()
  .setFirstName("Jane")
  .setLastName("Doe")
  .setEmail("jane@example.com")
  .build();

console.log(user2);
```

### When to Use Builder

- When creating objects with many optional or configurable properties.
- When you want to provide a clear, readable way of assembling complex objects.

### Drawbacks

- Introduces an extra layer of abstraction, which might be unnecessary for simple objects.
- In some cases, functional approaches (like using object spread) might suffice, though a builder can improve clarity when there are many configuration steps.

## Final Thoughts

In practice, Strategy and Builder patterns cover most of our development needs—they help clean up conditional logic and improve the clarity of object construction. While there are other valuable patterns that can be a good fit in some scenarios with complex instantiation rules, overusing them can add unnecessary layers of abstraction.

By understanding these patterns and knowing when to apply them, you can write code that's not only easier to maintain but also more adaptable to change—no matter if you lean towards a functional style or an OOP approach.
