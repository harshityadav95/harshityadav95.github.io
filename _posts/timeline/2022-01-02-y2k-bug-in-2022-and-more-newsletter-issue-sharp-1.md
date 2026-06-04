---
title: "Y2K Bug in 2022 and More ? Newsletter — Issue #1"
author: harshityadav95
date: 2022-01-02 00:00:00 +0530
categories: [Timeline]
tags: [newsletter, y2k, technology]
---

![Medium article image](/assets/img/posts/y2k-bug-in-2022-and-more-newsletter-issue-sharp-1/medium-image-031f5614c3ff.jpg)

## Y2K22 Bug Explained

So while the world was celebrating the new year 2022 Microsoft Exchange Servers were struggling after the “Microsoft Filtering Management Service” was stopped.

- This issue led to mail flow issues and seemed to stem from a series of errors from the FIP-FS (anti-malware) service stating that “Cannot convert ‘220101001’ to long.”
- Since the service is interconnected with the transport service, mail stops coming in and out,

Workaround “disabling Disable-AntimalwareScanning”

### int32 Variable?

- Microsoft was using signed int32 variable to store the value of a date, appears to have a limit of 31 bit, meaning the maximum value that can be inputted is two to the power of 31
- It has a maximum value of 2,147,483,647, and security researcher[Joseph Roosen mentions](https://twitter.com/JRoosen/status/1477203087421018118?ref_src=twsrc%5Etfw)([via Bleeping Computer,](https://www.bleepingcomputer.com/news/microsoft/microsoft-exchange-year-2022-bug-in-fip-fs-breaks-email-delivery/)) dates in the year 2022 have a minimum value of 2,201,010,001 or larger.
- This is greater than the maximum value that Microsoft is storing in the signed int32 variable, and this can cause the malware scanning engine of Exchange to crash and not send out emails.

So Microsoft Released the fix and it is all resolved, so what’s coming next?

While reading on this topic came across something upcoming similar to this

### Chrome 100 Release

So[User-Agent](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent)is still a thing which i learned about when i came across this article

In layman terms, here is what User Agent is: Chrome says this to websites you visit: “Hi, I am Chrome on Windows”.

- Google Chrome marks its release versions “Chrome/96.0.4664.45” which gives the precise version of the browser
- Web Developers reads the first 2 characters from the release ie 96
- When the version reaches 100 it will be read as 10. and many websites check the version as 96>= 55 etc so when the will read 10 it will be less than there defined version

This Version-Release is set around late march 2022 and developers are already working to mitigate the problem still will break many age-old ancient website and corporate portals

### Reference

- [https://docs.microsoft.com/en-us/answers/questions/680488/microsoft-exchange-fip-fs-scan-engine-failed-to-lo.html](https://docs.microsoft.com/en-us/answers/questions/680488/microsoft-exchange-fip-fs-scan-engine-failed-to-lo.html)
- [https://hothardware.com/news/microsoft-y2k22-bug-brings-down-exchange-servers-and-mail](https://hothardware.com/news/microsoft-y2k22-bug-brings-down-exchange-servers-and-mail)
- [https://securityaffairs.co/wordpress/126205/security/y2k22-bug-microsoft-exchange.html](https://securityaffairs.co/wordpress/126205/security/y2k22-bug-microsoft-exchange.html)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/y2k-bug-in-2022-and-more-newsletter-issue-1-2169a641df28)
