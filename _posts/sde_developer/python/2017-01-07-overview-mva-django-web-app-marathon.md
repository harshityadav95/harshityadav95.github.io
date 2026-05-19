---
title: "Overview MVA Django Web  App Marathon"
author: harshityadav95
date: 2017-01-07 00:00:00 +0530
categories: [SDE]
tags: [Django, Cloud, Python]
description: "Migrated from Blogger."
published: true
---

As per my estimate the Course was to be completed in  a day and was about to complete it , when in the final Module  while deploying the app  and database on the cloud it finally happend . Connecting an  application to the database with the right connector is always a lengthy task for the first time ...in finding the right database  ....setting up the connection and adding the right library to the project (that's always the part which troubles the  most if you are trying a latest framework to an old database)
whether it be Qt , C# , and now Django connecting Mysql Client Package to a Python Environment 3.5  took me almost 2 days to fix as 3.5 being the latest release wasn't  supported in SQL CLIENT

So After many GIT  revert commit and trying multiple  solution was able to fix it by both changing  the Environment 3.4   or by using the same 3.5 version and manually building and linking the package .

Link  :<http://www.lfd.uci.edu/~gohlke/pythonlibs/#mysqlclient>

Once Fixed Deploying and trying the App on both Azure and AWS  was a piece of Cake  ;)

Looking Forward to make few of Small  apps before starting with a project and learning JavaScript and Bootstrap before my College reopens  and continuing my Code practice at hacker-rank  side by side

Web APP  : <http://databasefun20170107035036.azurewebsites.net/>


[![](/assets/img/posts/2017-01-07-overview-mva-django-web-app-marathon/aef.JPG.JPG)](/assets/img/posts/2017-01-07-overview-mva-django-web-app-marathon/aef.JPG.JPG)
