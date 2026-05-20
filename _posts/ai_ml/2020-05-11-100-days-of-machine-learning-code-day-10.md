---
title: "100 Days of Machine Learning Code Day 10"
author: harshityadav95
date: 2020-05-11 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Harshit Yadav, AI, Project and Progress, Machine Learning, artificial intelligence, Python]
description: "Migrated from Blogger."
published: true
---

![Introduction to Deep Learning with PyTorch from Facebook-Udacity ...](/assets/img/posts/2020-05-11-100-days-of-machine-learning-code-day-10/1_yAjBjQhiPkp2txWEfMMaAA.png)

Day 10  : Hello world in Pytorch , but before that difference we need to know PyTorch vs TensorFlow

|  |  |
| --- | --- |
| PyTorch | Tensorflow |
| Based on the Torch library | Based on Theano library |
| Distinguish Feature : Support for CUDA | Distinguish Feature : TensorBoard |
| Debugging :Dynamic computational process. | Debugging : Requires the TensorFlow debugger tool |
| PyTorch offers an advantage with its dynamic nature of creating the graphs. The graphs are built, interpreting the line of code corresponding to that particular aspect of the graph. However, in the case of TensorFlow, as the construction is static and the graph is required to go through compilation and then executed on execution engine. | Tensorflow works on a static graph concept that means the user first has to define the computation graph of the model and then run the ML model, whereas PyTorch believes in a dynamic graph that allows defining/manipulating the graph on the go. |
| PyTorch, on the other hand, has fewer features comparatively. | TensorFlow supports a higher level of functionality and gives a broad spectrum of options to work with by providing certain operations like:  Flipping a tensor along with dimension Checking the Tensor for infinity and NaN Providing support for fast Fourier transforms Uses a package named contrib, for the creation of models. |

TensorFlow Graph Explained : [Video](https://www.youtube.com/watch?v=NsiskyCDH_w)

Here is my execution in [Google colab](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%2010/Hello_World_in_Pytorch___Creating_Neural_Network_from_Scratch_in_Pytorch.ipynb)  , After surfing around for Tensorflow vs Pytorch  here are my conclusions as beginner :

- Both are Widely used in Industry with majority of Google Projects in Tensorflow , and Tesla and Facebook other Deep Learning Implementation in pytorch
- Tensorflow is more easy to use and deploy in production and even mobile devices and app
- Static and Dynamic graph computation is a key differnce in basic working
- Both are equally powerful and with one having some advantage over the other
- Tensorflow can utlize Google TPU in cloud where as Pytorch support CUDA core

One of the things that caught my attention is Specialised hardware for ML purpose like Intel Movidious , Google Coral  Chips and other specialised Hardware available in market , so will search more on that

PS: University Decided to conduct the entire remaining semster Online so to make the best use of the daily routine will try to combine the theory lectures codes also in daily implementation , also checkout the videos on how Tesla uses Pytorch for Self Driving by Andrej Karpathy
