---
title: "100 Days of Machine Learning Code Day 5"
author: harshityadav95
date: 2020-05-07 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Harshit Yadav, AI, Project and Progress, Machine Learning, artificial intelligence]
description: "Migrated from Blogger."
published: true
---

Day 5  :

[![](/assets/img/posts/2020-05-07-100-days-of-machine-learning-code-day-5/Screenshot_from_2020-05-07_15-13-48.png)](/assets/img/posts/2020-05-07-100-days-of-machine-learning-code-day-5/AVvXsEjW8s9MQYiL7wEDUaUW8a_davpIEUDOUr8HNkWAL0vyYBUxu432kipOev-nWsS8PmQOnUecGOUL2PD1Wh7jDU61A1ZTrAzw6H7Sdd6cbVfQw0KDh2V6UGbibkA1jRKlMT2252v1ow9n94z2.png)

Continuing with the tensflow , to digest in in with the all the equations and formulas best practise is to pick up a pen and paper and write it down to understand it well . There are plenty of cheat sheets and books on the context the one i prefered to was  [" Neural Network and Depp Learning " by Charu C Aggarwal](https://books.google.co.in/books?id=achqDwAAQBAJ&source=gbs_navlinks_s) and "[Deep Learning](https://books.google.co.in/books/about/Deep_Learning.html?id=BdPrrQEACAAJ&redir_esc=y)

[A Practitioner’s Approach "](https://books.google.co.in/books/about/Deep_Learning.html?id=BdPrrQEACAAJ&redir_esc=y)Josh Patterson and Adam Gibson by O'REILLY  [the explnation in book was good], while practising or looking for numerical on backpropogation this video was really helpful , the topics studied are crucial from both learning and syllabus point of view for my semester so will revise back and revisit it again

coming back to tensorflow and playing around with MNIST.faishon database was really good in understanding while the optimizer and loss method i came across wasnt one i have learnt so far so need to study that , here is my implmentation of  it in google colab notebook

- [Mnist.fashion workbook  + excersie](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%205/MNIST_faishon_in_Google_Colab.ipynb)

Also key takeaways after going throught the code above were :

- Experiment with different values for the dense layer with 512 neurons. What different results do you get for loss, training time etc? [law of diminishing return]
- What would happen if you remove the Flatten() layer. ?
- Consider the final (output) layers. Why are there 10 of them? What would happen if you had a different amount than 10? For example, try training the network with 5 ?
- Consider the effects of additional layers in the network. What will happen if you add another layer between the one with 512 and the final layer with 10
- Consider the impact of training for more or less epochs. Why do you think that would be the case? [Overfitting]
- Before you trained, you normalized the data, going from values that were 0-255 to values that were 0-1. What would be the impact of removing that? Here's the complete code to give it a try. Why do you think you get different results?
- Callback functions

Unforunately the Tensorflow Course i was following on coursera has to wait until 18 may as 2 weeks of progress in 2-3 days made me ahead of schedule or maybe its a live course maybe so halt on tensorflow till may 18 will continue with the rest in meantime

[![](/assets/img/posts/2020-05-07-100-days-of-machine-learning-code-day-5/tensoflow.png)](/assets/img/posts/2020-05-07-100-days-of-machine-learning-code-day-5/AVvXsEhEr3raOC8oDn8vJduzfttW-mH6fEZslHliZ-miPnag4SkPExITQv7_G7mvj-xwbSYdh5cS5qejyznUTOWyGkbB4xSr5XU77a-HfSxHGS3Zof8EdC6jiwy2i8U4knDvunyAfdK0A0aQfVR1.png)
