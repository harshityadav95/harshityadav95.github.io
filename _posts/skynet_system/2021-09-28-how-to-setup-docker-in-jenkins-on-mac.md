---
title: "How to Setup Docker in Jenkins on Mac"
author: harshityadav95
date: 2021-09-28 00:00:00 +0530
categories: [Skynet System, DevOps]
tags: [docker, jenkins, mac, ci-cd]
---

## How to Setup Docker in Jenkins on Mac

![Medium article image](/assets/img/posts/how-to-setup-docker-in-jenkins-on-mac/medium-image-9a088a9169b4.png)

- Install the Jenkins via Homebrew
- Install Docker from the Docker website

1. Once the Jenkins is setup download and install the docker plugin in Jenkins
2. Open Finder and search for the folder “ cellar”
3. Find the folder jenkins-lts
4. Open the file named “homebrew.mxcl.jenkins-lts.plist”
5. Make the following changes

6. Restart the Jenkins Service

```
brew services restart jenkins-lts
```

## **Reference :**

- [https://stackoverflow.com/questions/40043004/docker-command-not-found-mac-mini-only-happens-in-jenkins-shell-step-but-wo/58688536#58688536](https://stackoverflow.com/questions/40043004/docker-command-not-found-mac-mini-only-happens-in-jenkins-shell-step-but-wo/58688536#58688536)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/how-to-setup-docker-in-jenkins-on-mac-c45fe02f91c5)
