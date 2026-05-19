---
title: "100 Days of Machine Learning Code Day 14"
author: harshityadav95
date: 2020-05-15 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Ai, Project and Progress, machine learning, artificial intelligence]
description: "Migrated from Blogger."
published: true
---

![](/assets/img/posts/2020-05-15-100-days-of-machine-learning-code-day-14/1_Otz2USCrp96Soqn4VthYhQ.png)

Day 14: MNIST dataset for handwriting classification  using Tensorflow

**Q. Whats MNIST Dataset  ?**

A. The MNIST dataset is an image dataset of handwritten digits made available by [Yann LeCun et. al.](http://yann.lecun.com/) [here](http://yann.lecun.com/exdb/mnist/). It has has 60,000 training images and 10,000 test images, each of which are grayscale 28 x 28 sized images. It is a good beginner’s dataset to try learning techniques and pattern recognition methods on real-world data while spending minimal efforts on pre-processing and formatting

Key Takeaways  :

- Sequential: That defines a SEQUENCE of layers in the neural network
- Flatten: Remember earlier where our images were a square, when you printed them out? Flatten just takes that square and turns it into a 1 dimensional set.
- Dense: Adds a layer of neurons
- Relu effectively means "If X>0 return X, else return 0" -- so what it does it it only passes values 0 or greater to the next layer in the network.
- Softmax takes a set of values, and effectively picks the biggest one, so, for example, if the output of the last layer looks like [0.1, 0.1, 0.05, 0.1, 9.5, 0.1, 0.05, 0.05, 0.05], it saves you from fishing through it looking for the biggest value, and turns it into [0,0,0,0,1,0,0,0,0] -- The goal is to save a lot of coding!

**Revision from Day 5****Q .What will happen if we change the Number Of Dense Neurons (512) in our Neural Network  ?**Ans . by adding more Neurons we have to do more calculations, slowing down the process, but in this case they have a good impact -- we do get more accurate. That doesn't mean it's always a case of 'more is better', you can hit the law of diminishing returns very quickly**Q. What would happen if you remove the Flatten() layer. Why do you think that's the case?**Ans. You get an error about the shape of the data. It may seem vague right now, but it reinforces the rule of thumb that the first layer in your network should be the same shape as your data. Right now our data is 28x28 images, and 28 layers of 28 neurons would be infeasible, so it makes more sense to 'flatten' that 28,28 into a 784x1. Instead of wriitng all the code to handle that ourselves, we add the Flatten() layer at the begining, and when the arrays are loaded into the model later, they'll automatically be flattened for us.**Q .Consider the final (output) layers. Why are there 10 of them? What would happen if you had a different amount than 10?**Ans. You get an error as soon as it finds an unexpected value. Another rule of thumb -- the number of neurons in the last layer should match the number of classes you are classifying for. In this case it's the digits 0-9, so there are 10 of them, hence you should have 10 neurons in your final layer.**Q. Consider the effects of additional layers in the network. What will happen if you add another layer between the one with 512 and the final layer with 10.**Ans .There isn't a significant impact -- because this is relatively simple data. For far more complex data including color images to be classified , extra layers are often necessary.**Q. Consider the impact of training for more or less epochs. Why do you think that would be the case?**Ans .Try 15 epochs -- you'll probably get a model with a much better loss than the one with 5 Try 30 epochs -- you might see the loss value stops decreasing, and sometimes increases. This is a side effect of something called 'overfitting' which you can learn about [somewhere] and it's something you need to keep an eye out for when training neural networks. There's no point in wasting your time training if you aren't improving your loss, right! :)

Source :  [Notebook](https://github.com/lmoroney/dlaicourse/blob/master/Course%201%20-%20Part%204%20-%20Lesson%202%20-%20Notebook.ipynb)

My Solution with Callback  : [In Coursera Jupyter Notebook](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%2014/Exercise2-Question-Answer.ipynb)

My Solution without callback: [In Google Colab Notebook](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%2014/Copy_of_Exercise2_Question.ipynb)
