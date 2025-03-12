---
title: "cURL: Validating TLS versions"
last_modified_at: 2023-07-19T22:13:03Z
categories:
  - Code
tags:
  - Development
---

I had to demonstrate that our hosting of a single page app did not accept TLS version 1.1,

This is the proof

```:bash
curl -o /dev/null -s -w "%{http_code}\n" https://koala-moon.com --insecure --tls-max 1.1
```

Returns: 0000

```:bash
curl -o /dev/null -s -w "%{http_code}\n" https://koala-moon.com --insecure --tls-max 1.2
```

Returns: 200

_Easy eh?_
