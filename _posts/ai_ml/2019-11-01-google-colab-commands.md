---
title: "Google Colab Commands"
author: harshityadav95
date: 2019-11-01 00:00:00 +0530
categories: [AI/ML]
tags: [google-colab, python, notebook]
---

## Google Colab Commands

![Medium article image](/assets/img/posts/google-colab-commands/medium-image-001.png)

---

Click this Link if Stopped by Medium Paywall :[https://medium.com/@harshityadav95/google-colab-commands-60f779842d3c?source=friends_link&sk=e66e440f3ced23d2c66f4ba4281204d3](https://medium.com/@harshityadav95/google-colab-commands-60f779842d3c?source=friends_link&sk=e66e440f3ced23d2c66f4ba4281204d3)

## Running a Cell

***SHIFT + ENTER***

## Executing Bash Commands

Simply add an`!`before, for example:

```
!ls '/content/gdrive/My Drive/Colab Notebooks/'
```

Let’s check the information of OS, processors and RAM they are using:

```
!cat /proc/version!cat /proc/cpuinfo!cat /proc/meminfo
```

## Uploading Files

You can simply upload files manually to your Google Drive, and access them using codes above. Alternatively, you can use the following code:

```
from google.colab import filesuploaded = files.upload()
```

## Libraries

## Installing Libraries

Use`pip`in bash command:

```
!pip install <PACKAGE_NAME>
```

**Bash Commands**

Bash commands can be run by prefixing the command with ‘!’.

- Cloning a git repository

```
!git clone [git clone url]
```

- Directory commands*!ls, !mkdir.*

```
!ls
```

**Installing Libraries**

Although most of the commonly used Python libraries are pre-installed, new libraries can be installed using the below packages:

```
!pip install [package name]
```

OR

```
!apt-get install [package name]
```

Referneces for MPI on python

- [https://rabernat.github.io/research_computing/parallel-programming-with-mpi-for-python.html](https://rabernat.github.io/research_computing/parallel-programming-with-mpi-for-python.html)
- [https://github.com/xhzhao/PyTorch-MPI-DDP-example](https://github.com/xhzhao/PyTorch-MPI-DDP-example)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/google-colab-commands-60f779842d3c)
