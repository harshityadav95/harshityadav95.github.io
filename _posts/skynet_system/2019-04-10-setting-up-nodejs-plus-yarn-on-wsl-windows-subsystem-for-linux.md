---
title: "Setting Up Nodejs + Yarn on WSL (Windows Subsystem for Linux)"
author: harshityadav95
date: 2019-04-10 00:00:00 +0530
categories: [Dev Kit]
tags: [nodejs, yarn, wsl, windows]
---

## Setting Up Nodejs + Yarn on WSL (Windows Subsystem for Linux)

![Medium article image](/assets/img/posts/setting-up-nodejs-plus-yarn-on-wsl-windows-subsystem-for-linux/medium-image-d791bb188dba.png)

Launch Window WSL Terminal

Start Up Updating the packages list by typing :

```
$ sudo apt update
```

Install the nodejs using the apt package manager

```
$ sudo apt install nodejs
```

To verify the Installation execute the following command :

```
$ nodejs --version
```

To be able to download npm package, you need to install the npm, the Node.js pacakge manager .To do so type:

```
$ sudo apt install npm
```

To verify the npm Install check using the command :

```
$ npm --version
```

To Downlaod and Setup Yarn

```
$ sudo apt install yarn
```

To check the Installed version of Yarn:

```
$ yarn --version
```

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/setting-up-nodejs-yarn-on-wsl-windows-subsystem-for-linux-e29d952ff6eb)
