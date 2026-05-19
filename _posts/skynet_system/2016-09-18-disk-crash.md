---
title: "Disk Crash !"
author: harshityadav95
date: 2016-09-18 00:00:00 +0530
categories: [Skynet System]
tags: [Troubleshooting and Maintenance]
description: "Migrated from Blogger."
published: true
---

Everything was up and running fine until last Tuesday when my Laptop Suddenly froze while i was working on some C# application in Visual Studio . I waited for about 4-5 minutes for system to become responsive again as I couldn't power it down as i had unsaved work in background ..Since it was around 3:00 AM in midnight so i thought that this might due to background windows 10 update being installed automatically (default timings are between 3-4 AM in most of Windows Devices)
After waiting for a little longer the system did became responsive again but the performance was so sluggish that i had to call it a day and shutdown the system  .

The Next Day when I booted up the PC the Thinkpad Diagnostic gave a beep during the error and when I ran the Diagnostics i showed that the [S.M.A.R.T](https://en.wikipedia.org/wiki/S.M.A.R.T.) status had Failed ...WHAT ..it had been only two years since i got that HDD and my Disk is Failing now ..Back in Windows when i Ran Crystal Disk Info I got this result


[![](/assets/img/posts/2016-09-18-disk-crash/adf.JPG)](/assets/img/posts/2016-09-18-disk-crash/adf.JPG)


Seeing that my Drive had got some bad sectors ...I immediately backed up all my drive and Data ..and created an Windows Image in case the drive fails completely (took about 8 Hours to complete the process ) and did some search online ..turns out sooner or later i have to get my Drive replaced in case the Bad Sector Count Increases ..(Will Upgrade to SSD :D ) but seeing the Cost of SSD I'm holding back the replace and taking the chance to run the Drive until the Bad Sector count reaches 2-3 or the system crash/freeze become intolerable ...So lets see how long the drive will work properly .

PS : Upgrading to SSD will be literally  like driving a Car on Nitro All the time ..pretty excited about ..if the upgrade happens
