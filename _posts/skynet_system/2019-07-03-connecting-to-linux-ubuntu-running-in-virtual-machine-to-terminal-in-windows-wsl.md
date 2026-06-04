---
title: "Connecting to Linux|Ubuntu running in Virtual Machine to Terminal in Windows |WSL"
author: harshityadav95
date: 2019-07-03 00:00:00 +0530
categories: [Dev Kit]
tags: [linux, ubuntu, virtual-machine, wsl]
---

## Connecting to Linux|Ubuntu running in Virtual Machine to Terminal in Windows |WSL

![Medium article image](/assets/img/posts/connecting-to-linux-ubuntu-running-in-virtual-machine-to-terminal-in-windows-wsl/medium-image-e5515c0e9925.png)

After have installed Ubuntu, login your virtual Machine ubuntu with username and password inserted during the installation:

Install openssh-server

```
sudo apt-get update
```

```
sudo apt-get install openssh-server
```

Now Stop the Virtual Machine and go to the Network Setting of your Virtual Machine

![Medium article image](/assets/img/posts/connecting-to-linux-ubuntu-running-in-virtual-machine-to-terminal-in-windows-wsl/medium-image-efa901a57397.png)

Click on the Advanced Option and add the following rule:

![Medium article image](/assets/img/posts/connecting-to-linux-ubuntu-running-in-virtual-machine-to-terminal-in-windows-wsl/medium-image-0debfeff745d.png)

Start your Virtual Machine:

When your VM is started, open your terminal and try to connect:

```
ssh yourusername@127.0.0.1 -p 2222
```

and you will be inside your Virtual Machine

![Medium article image](/assets/img/posts/connecting-to-linux-ubuntu-running-in-virtual-machine-to-terminal-in-windows-wsl/medium-image-f86918e1ec53.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/connecting-to-linux-ubuntu-running-in-virtual-machine-to-terminal-in-windows-wsl-1b0f51d4787d)
