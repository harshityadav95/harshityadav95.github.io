---
title: "Install GUI Desktop in WSL2 Ubuntu 20.04 LTS in Windows 10"
author: harshityadav95
date: 2020-09-12 00:00:00 +0530
categories: [Dev Kit]
tags: [wsl2, ubuntu, windows, desktop]
---

## Install GUI Desktop in WSL2 Ubuntu 20.04 LTS in Windows 10

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-f110cac9e713.png)

First check if you Windows 10 Version supports WSL 2 or not checkout the link[[Link]](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-79477230e914.png)

## Setup

Once you are done with installation, you can set wsl2 to be default using command:

```
wsl --set-default-version 2
```

you can check the version of the distro using command (our case ubuntu 2)

```
wsl -l -v
```

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-c59d940294a7.png)

You can change the version using command if its WSL version 1

```
wsl --set-version <Distro> 2
```

Once your distro is up and running you can setup either Xfce

1 . Update the Distro installation and remove previous install of xrdp

```
$sudo apt-get update && sudo apt-get -y upgrade$sudo apt-get purge xrdp
```

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-b3a166218e28.png)

2. Install Xfce , select lightdm or gdm3 as per your prefernce when asked

```
# install xfce sudo apt-get install -y xfce4 xfce4-goodies
```

3 . Install Xrdp

```
# install xrdpsudo apt-get install xrdp
```

4 .Open the file in location and edit as shown in the image

```
sudo nano /etc/xrdp/startwm.sh
```

and add comment the last 2 lines and add the following in the end

```
# xce4Startxfce4
```

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-f2efcdd0bd81.png)

5. No run the following to set the port and other settings

```
$sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak$sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini$sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini$sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.iniecho xfce4-session > ~/.xsession#enable dbus$sudo systemctl enable dbus$sudo /etc/init.d/dbus start$sudo /etc/init.d/xrdp start
```

6. Open RDP in windows and connect to localhost :3390

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-49819ba6b600.png)

And if all went well it should log in with your username and password of WSL2

![Medium article image](/assets/img/posts/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10/medium-image-ecd6168aa1be.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/install-gui-desktop-in-wsl2-ubuntu-20-04-lts-in-windows-10-ae0d8d9e4459)
