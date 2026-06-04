---
title: "Jupyter Notebook in Windows Subsystem for Linux |WSL"
author: harshityadav95
date: 2019-07-02 00:00:00 +0530
categories: [AI ML]
tags: [jupyter, wsl, python, notebook]
---

## Jupyter Notebook in Windows Subsystem for Linux |WSL

![Medium article image](/assets/img/posts/jupyter-notebook-in-windows-subsystem-for-linux-wsl/medium-image-001.jpg)

## Python installation on WSL

Although Python comes preinstalled with most of the Linux distributions but unfortunately it doesn’t comes with WSL. So you have to install it manually and to do that write the following commands —

```
sudo apt update && upgrade
```

```
sudo apt install python3 python3-pip ipython3
```

```
sudo apt install python3-pip
```

This is it. This will install Python 3 in your WSL. To check python version type

```
python3 --version
```

## Installing Jupyter Notebook

You can run Jupyter Notebook in your WSL. Here WSL will act as a jupyter server accessible at localhost with port 8888. The steps to install Jupyter is as following-

1. Install Jupyter by typing the following command in your Bash Shell.

```
pip3 install jupyter
```

It will take some time and install all the packages to be installed

You can run the jupyter notebook from anywhere (i.e., from the Linux or Windows filesystem). The WSL will act as a jupyter server accessible at localhost with port 8888.

## **Switching to Browsers Installed in Windows**

Create alias to launch jupyter without browser from the WSL:  
- Open your bash configuration:`vim ~/.bashrc`- Add to the end of the file and save/exit:  
`alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"`

Now you can run a jupyter server`jupyter-notebook`and access the service with your browser from Windows`localhost:8888.`

When Running for the First time will present you with withs Screen

![Medium article image](/assets/img/posts/jupyter-notebook-in-windows-subsystem-for-linux-wsl/medium-image-002.png)

Now Head back to you WSL Terminal and use the Token to set your Password

![Medium article image](/assets/img/posts/jupyter-notebook-in-windows-subsystem-for-linux-wsl/medium-image-003.png)

And if everything works well

![Medium article image](/assets/img/posts/jupyter-notebook-in-windows-subsystem-for-linux-wsl/medium-image-004.png)

The notebooks you upload get stored in the location inside WSL

```
/home/harshit95/.jupyter
```

or if not you can check the paths used by jupyter by typing :

```
jupyter --path
```

Happy WSL-ing :)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/jupyter-notebook-in-windows-subsystem-for-linux-wsl-8b46fdf0a536)
