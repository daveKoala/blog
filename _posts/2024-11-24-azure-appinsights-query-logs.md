---
title: "Azure AppInsights Query Logs"
last_modified_at: 2024-11-24T13:58:03Z
categories:
  - Blog
tags:
  - code
  - azure
  - kutso
---

Examples of Azure Application Insights Queries (Kusto Query Language)

For more details, refer to the following documentation:

- [Kusto Query Language](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- [Date Syntax](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/samples?pivots=azuremonitor&toc=%2Fazure%2Fazure-monitor%2Ftoc.json#date-time-basics)
- [String Operators](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/datatypes-string-operators)

---

## 1. Basic Querying

### 1.1 Search Across All Tables

The simplest query uses the `search` command to scan all tables and return the first set of results.

```kusto
search *
```

Note: This query can be very inefficient because it scans data across all tables.

1.2 Search Within a Specific Table
You can also query specific tables directly. For example:

```kusto
customEvents
```

Other common tables include:

- requests
- exceptions

## 2. Filtering by Time

###2.1 Using a Relative Time Constraint
Filter rows to include only those with timestamps within the last 2 days:

```kusto
requests
| where timestamp > now() - 2d
```

### 2.2 Filtering Between Two Specific Date/Time Values

To narrow down results between two exact date/time values, use the between operator:

```kusto
exceptions
| where timestamp between (datetime("2018-06-30 22:46:42") .. datetime("2018-07-01 00:57:27"))
```

## 3. Working with Distinct Values and Summarizing

### 3.1 Finding Distinct Values

Retrieve all unique values from a column (e.g., cloud_RoleName in customEvents):

```kusto
customEvents
| distinct cloud_RoleName
```

### 3.2 Summarizing Data

Summarize (or tally) the data by counting occurrences of each distinct value:

```kusto
customEvents
| summarize count() by cloud_RoleName
```

## 4. Using Custom Dimensions

Custom dimensions are JSON strings that store additional data. For example, to extract a user’s email from the customDimensions field:

```kusto
customEvents
| extend email = tostring(customDimensions["userEmail"])
| where email == "dave@dave.com"
```

To get all unique emails and count how many times each appears:

```kusto
customEvents
| extend email = tostring(customDimensions["userEmail"])
| summarize count() by email
```

## 5. String Filtering

Use string filters to refine your search. For example, to list all distinct `cloud_RoleName` values containing the string "cohort":

```kusto
customEvents
| distinct cloud_RoleName
| where cloud_RoleName contains 'cOhoRt'
```

_Note: The contains operator is case-insensitive by default. To enforce case sensitivity, consider using other string functions or prefixes._

## 6. Advanced Examples

### 6.1 Querying by Cloud Role Name

Retrieve rows from a table (e.g., browserTimings) where the cloud role name matches a specific value:

```kusto
browserTimings
| where cloud_RoleName == "Web App"
```

To limit the results to the last 15 days:

```kusto
customEvents
| where cloud_RoleName == "Web App"
| where timestamp > ago(15d)
```

For shorter intervals, you can use:

```kusto
| where timestamp > ago(15h) for hours
| where timestamp > ago(15m) for minutes
```

### 6.2 Grouping and Counting by a Key

Group and count the data based on a key (e.g., cloud_RoleName):

```kusto
customEvents
| summarize Count = count() by cloud_RoleName
```

### 6.3 Searching within a Custom Field/Object

Extract and filter on a custom property within the JSON stored in customDimensions. For example, to search for rows where the custom property equals "Screen: Learning Journey":

```kusto
customEvents
| extend name = tostring(customDimensions["customProperty"])
| where name == "Screen: Learning Journey"
```

_Optional: Append | count to get a count of matching rows._
