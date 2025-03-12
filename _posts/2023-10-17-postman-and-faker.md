---
title: "Postman and Faker"
last_modified_at: 2023-10-17T22:06:33Z
categories:
  - Code
tags:
  - Development
---

# Dynamic User Creation with Postman Pre-request Scripts and Faker

I'm a huge fan of Postman for API development—and it turns out I'm only scratching the surface of its capabilities! One of the most powerful features is that the Pre-request scripts have access to Faker. This enables you to generate dynamic, realistic test data on the fly.

Below is an example script that creates a dynamic request body for a user, leveraging Faker data:

```javascript
// Retrieve dynamic values using Postman's Faker variables
const firstName = pm.variables.replaceIn("{{$randomFirstName}}");
const lastName = pm.variables.replaceIn("{{$randomLastName}}");
const domain = pm.variables
  .replaceIn("{{$randomCompanyName}}")
  .replace(/[, ]+/g, ".")
  .trim();

// Construct a dynamic user object with a generated email
const body = {
  firstName,
  lastName,
  email: `${firstName}.${lastName}@${domain}.com`,
};

// Set the constructed JSON body into an environment variable for use in the request
pm.environment.set("body", JSON.stringify(body));
```

### How It Works

**Generating Random Data:**

- Faker is used to generate realistic names and company names. In this example, `{{$randomFirstName}}`, `{{$randomLastName}}`, and `{{$randomCompanyName}}` are replaced with random data.
- A random integer is created (this can be used for additional dynamic elements if needed).

### Constructing the Email:

The email address is dynamically constructed using template literals, ensuring that it combines the generated first name, last name, and a sanitized version of the company name (with spaces and commas replaced by periods).
Storing the Dynamic Body:

The dynamically generated user object is stringified and stored in an environment variable (body). This variable can then be referenced in your API request.
Additional Resources

For more details on the Faker options available in Postman, check out Postman’s Faker Documentation.

This approach not only simplifies testing but also adds realism to your API calls—helping you ensure that your endpoints handle varied data gracefully.

_Happy testing!_
