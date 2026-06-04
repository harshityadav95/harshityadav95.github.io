---
title: "Hello World in TensorFLow"
author: harshityadav95
date: 2020-05-05 00:00:00 +0530
categories: [AI ML]
tags: [tensorflow, machine-learning, python]
---

## Hello World in Tensorflow

![Medium article image](/assets/img/posts/hello-world-in-tensorflow/medium-image-eb94c9b9837c.png)

**Writing a “ Hello World “ in Tensorflow**

```
model=keras.Sequential([keras.layers.Dense(units=1,input_shape=[1])])
```

Explanation : This is written usin python and tensorflow and an API in tensorflow called keras , in Keras Dense is used to define a layer of connected neurons, Unit =1 means it has 1 neuron , sequential as the layers are successive , shape of input =1

```
model.commpile(optimizer='sgd',loss='mean_squared_error')
```

the loss functions is inbuilt , ‘sgd’=stochastic gradient descent

Input = [-1.0,0.0,1.0,2.0,3.0,4.0]

and this is the desired output figure out the logic

Output=[-3.0,-1.0,1.0,3.0,5.0,7.0]

```
xs=np.array([-1.0,0.0,1.0,2.0,3.0,4.0], dtype=float)ys=np.array([-3.0,-1.0,1.0,3.0,5.0,7.0], dtype=float)
```

```
model.fit(xs,ys,epochs=500)#fit x->y iteratrions=500
```

Now using the gained intelligence to predict

```
print(model.predict([10.0]))
```

Complete code to Implement in colab would be like :

```
import tensorflow as tfimport numpy as npfrom tensorflow import keras
```

```
model = tf.keras.Sequential([keras.layers.Dense(units=1, input_shape=[1])])
```

```
model.compile(optimizer='sgd', loss='mean_squared_error')
```

```
xs = np.array([-1.0,  0.0, 1.0, 2.0, 3.0, 4.0], dtype=float)
```

```
ys = np.array([-3.0, -1.0, 1.0, 3.0, 5.0, 7.0], dtype=float)
```

```
model.fit(xs, ys, epochs=500)
```

```
print(model.predict([10.0]))
```

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/hello-world-in-tensorflow-dad5565c1403)
