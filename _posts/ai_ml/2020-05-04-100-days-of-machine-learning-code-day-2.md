---
title: "100 Days of Machine Learning Code Day 2"
author: harshityadav95
date: 2020-05-04 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Harshit Yadav, Ai, Project and Progress, artificial intelligence]
description: "Migrated from Blogger."
published: true
---

|  |
| --- |
|  |
| Tesseract in Marvel Universe , Unfortunately the one we will be dealing with is powerful enough too :) |


Day 2 : There are plenty of resources online for the machine learning and for my learning apart from my theoretical lessons in University I am following "Andre NG ,deep learning.ai "course and "Tensorflow in practise" specialisation course in parallel for mix of theory and practical assignment but my posts and tasks will be more of goal oriented and one can refer to any resource of choice to fill in the knowledge gaps which are created during lessons , my advice is when learning a topic refer to many sources as possible unless you are clear with the topic and when learning something always  try to think what can you do with that thing or real life example of its implementation .

For the todays task we will be trying our hands on with [Tesseract OCR engine](https://en.wikipedia.org/wiki/Tesseract_(software)), [Kraken](https://pypi.org/project/kraken/), [OpenCV](https://opencv.org/) .Tesseract was intially developed at HP from (1985-1994) until it was open sourced in 2005 and later picked by Google in 2006 .Since then Tessearct has been widely used and now supports over 100 languages including hindi and also comes in [JS package](https://tesseract.projectnaptha.com/) too which can be implmented in web browsers also .

Here is the Link to my [Implementation of Tesseract in Google Colab](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%202/Day_2%20Google%20Colab.ipynb)

Here are the key takeaways and things to lookup :

- Image Binarize
- Image.NEAREST
- Image.BOX
- Image.BILINEAR
- Image.HAMMING
- Image.BICUBIC
- Image.LANCZOS

![The Art of Hotel Transylvania 3. The Kraken - Scott Wills http ...](/assets/img/posts/2020-05-04-100-days-of-machine-learning-code-day-2/ee01cc7d19a62e6175fbb132974c8720.jpg)

 Next up we will be going through another image processing library called **Kraken** which is used for
edge detection and drawing boxes around the text in the image , and return you the coordinates  of the boxes around the text
The task here is to take in input image , find the box coordinates and draw on top of it, the later part includes the code to get even more accurate results by identifying the line gap by calculating the distance between them and drawing a line horizontaly
Interestingly running few function pixel by pixel over a large image is resource intensive and using Kraken in an live project would be slow(there are faster methods to to that)

- Hers is the code [implementation in google colab](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%202/kraken_in_google_colab.ipynb) and preview


[![](/assets/img/posts/2020-05-04-100-days-of-machine-learning-code-day-2/2.png)](/assets/img/posts/2020-05-04-100-days-of-machine-learning-code-day-2/2.png)[![](/assets/img/posts/2020-05-04-100-days-of-machine-learning-code-day-2/3.png)](/assets/img/posts/2020-05-04-100-days-of-machine-learning-code-day-2/3.png)


there were part of functions that were difficult to understand at first but by implmenting it line by line tweaking it and trying out with changes gave more clarity of that and how each line of code is was working

Till now we havent started with actual machine learning and this was just the warmup, implementing all these library and OCR method gave rise to a question in my mind how did these library do OCR and image to text in 80's when the c machine learning didnt exist as we know it ?
The best answer i found is in this IEEE Paper -DOI: [10.1109/ICDAR.2007.4376991](https://doi.org/10.1109/ICDAR.2007.4376991)

Coming up with Opencv followed by some basic algorithms or maybe simple neural networl we will start into actual machine learning

PS: I this the above link dosent work or you need individual files here is link to my #100DaysofMLcode  [Github repository](https://github.com/harshityadav95/100-Days-of-Machine-Learning)
