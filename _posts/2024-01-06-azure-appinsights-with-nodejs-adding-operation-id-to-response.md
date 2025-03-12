---
title: "Azure AppInsights with Nodejs adding operation id to response"
last_modified_at: 2024-01-06T14:39:37Z
categories:
  - Code
tags:
  - code
  - typescript
  - nodejs
---

**Problem:** I needed to add an additional response header to my requests to aid in tracking errors.

**Here is my solution:** Add middleware that will add the AppInsights Operation ID to the response. The Operation ID is unique to each request so searching for it is simple.

```:javascript
import { Request, Response, NextFunction } from 'express';
import appInsights from '../../lib/appInsights';

export default (req: Request, res: Response, next: NextFunction) => {
    const { operation } = appInsights.getCorrelationContext();

    res.setHeader('X-Operation-ID', operation.id);

    next();
};
```

Note

```:javascript
import appInsights from '../../lib/appInsights';
```

AppInsights is initiated in an additional module that configures and filters requests E.g. Stops requests to the `health check` endpoints being logged

Now I can view requests in the browser, look for request response headers and specifically `X-Operation-ID`. This will give me an ID string that can be queried in Azure AppInsights logs.

For example: Query the 'exceptions' table

```javascript
exceptions
| where operation_Id  == << X Operation ID>>
```
