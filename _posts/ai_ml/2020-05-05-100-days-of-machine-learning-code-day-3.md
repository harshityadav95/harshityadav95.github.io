---
title: "100 Days of Machine Learning Code Day 3"
author: harshityadav95
date: 2020-05-05 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Harshit Yadav, AI, Project and Progress, Machine Learning, artificial intelligence, Python]
description: "Migrated from Blogger."
published: true
---

Day 3 : Taking one Step at a time , creating first Neuron

I have came across project using image and video processing using machine learning to identify faces, masks recognition etc and i hade heard about the library OpenCV but never actually did anything in it so going in this direction further i tried to get my hands on in OpenCV, interstingly it was developed by Intel , Tesseract was started in HP this one in intel and still Google ended up as industry leader in AI

So for my task for today was a coursera assignment in which i had to use OpenCV to identify faces in an Image of newspapper and also use tesseract to run OCR on the newspaper cliping and link word labels to the image

- [Hands on in OpenCV](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%203/OpenCV%20Google%20colab.ipynb)

- [Working with Webcam Stream in OpenCV](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%203/Webcam_in_google_colab_working.ipynb)

- [Problem Statement with solution](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%203/project%20key.ipynb)

Its whe  running these solution on Google Colab vs Running on local instance when one start appreciating the power of cloud ,and this is when we are just getting started in ML .In parallel to this i have been been doing ML course by Andrew NG+ Tensorflow in Practise course so with this i created my first tiny intelligence :D , if you look in that way i have come across many examples during lectures , slides and video using numpy , pytorch etc how to create your first neural network but this is by far the smoothest and best mind blowing starter for beginners [provided you have know the underlying mechanism and terms , which i do]. so with that i wrote whats called the "Hello World " in Tensorflow , the thing about me is whenver i learn something new framework , tech or something else i always look up breif history and development that brought that thing in existence which over year starts conencting together in a dense mesh grraph in a chronological timeline and as i procced and learn more it becomes wider and sometimes even help learn more better and faster being able to see bit above and sideways of that topic and broadning the knowledge tree

One of the videos i found internsing was by one of my favourite podcast host  [@lexfridman](https://twitter.com/lexfridman) the model.fit() fn is truly mindblowing after dealing with manually writing activation function and entire thing manually

Thats how " Hello World " code looks like :

```
![](/assets/img/posts/2020-05-05-100-days-of-machine-learning-code-day-3/0_Y-0kYk-sCYPCxgba.png)Complete code to Implement in colab would be like :

```
import tensorflow as tf
import numpy as np
from tensorflow import kerasmodel = tf.keras.Sequential([keras.layers.Dense(units=1, input_shape=[1])])model.compile(optimizer='sgd', loss='mean_squared_error')xs = np.array([-1.0,  0.0, 1.0, 2.0, 3.0, 4.0], dtype=float)ys = np.array([-3.0, -1.0, 1.0, 3.0, 5.0, 7.0], dtype=float)model.fit(xs, ys, epochs=500)print(model.predict([10.0]))
```
```

-  [Implementation in Google colab](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%203/Course_1_Part_2_Lesson_2_Notebook.ipynb)

! Dont forget to google out or understand individual component and try playing with number of epochs ;) ,[everyone has a differnet method of learning make your own path which suits you the most keeping both learning and motivation optimal]

PS : Also completed my python Specialisation today

[![](/assets/img/posts/2020-05-05-100-days-of-machine-learning-code-day-3/Screenshot_from_2020-05-06_02-46-26.png)](/assets/img/posts/2020-05-05-100-days-of-machine-learning-code-day-3/AVvXsEiToAphxONv0XbRri2ugnLA8jnzZdPqnu-_jK5W76_00mt6ElkL5pQJMb5t7anJYC-fFN4g2FpjO-3SPvmhoPWPdpiROdJ3_9MOD9CZ3SN4TCEgHtKepe_-2GBxNAQ7lPD8dQHYxjqFxWZ0.png)
