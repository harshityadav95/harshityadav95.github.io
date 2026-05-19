---
title: "Backups ,System Updates  & Partitioning"
author: harshityadav95
date: 2016-08-09 00:00:00 +0530
categories: [Skynet System]
tags: [Troubleshooting and Maintenance]
description: "Migrated from Blogger."
published: true
---

With the Windows 10 Anniversary update
coming this week and the current version giving me a hard time with lots of
bugs like (frame freeze in the Movie Player when resized, Sudden Wi-Fi loss due
to DHCP client crash and delay in reading my fingerprint during login by
windows Hello ) . I finally had a chance to fix all this in one go with the Latest
Redstone update.

As I began to
download the update (the offline setup as i don't trust my internet connection
for a direct live update: P)  It came to my thought that apart from my
regular backup updates inside Windows ,I should create a system image as a last
restore option as I couldn't risk losing all my progress on my Internship
Project .So i started the windows image tool which ran for about a minute or so
but kept crashing due to some conflict in Windows Shadow Copy Function 0x8078012D

After an hour of searching i found out that it   due to Less Space in System Reserved
Partition which I resolved using the tool : <http://www.minitool.com/partition-manager.html>

With
1 hour of downloading 2 hours of installation and next 2 hours in system maintenance
and Disk Defragment I was back On my system that was  much faster ,stable  , and better in interface ( although the
fingerprint reader completely stopped working after the update ). Looking
Forward to update my Linux Ubuntu to 16.04 LTS update as soon as my Internship
Project is complete.

[![](/assets/img/posts/2016-08-09-backups-system-updates-partitioning/uyvf.JPG.JPG)](/assets/img/posts/2016-08-09-backups-system-updates-partitioning/uyvf.JPG.JPG)
