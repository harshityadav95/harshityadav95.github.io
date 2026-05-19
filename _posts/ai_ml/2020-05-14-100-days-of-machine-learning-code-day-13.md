---
title: "100 Days of Machine Learning Code Day 13"
author: harshityadav95
date: 2020-05-14 00:00:00 +0530
categories: [AI/ML]
tags: [100daysofMLcode, Harshit Yadav, Ai, Project and Progress, machine learning, artificial intelligence]
description: "Migrated from Blogger."
published: true
---

|  |
| --- |
| An n-gram model is a type of probabilistic language model for ... |
| n-gram |

Day 13 : Making my own  string processing code to generate the N-gram probability table for the given sequence of strings , But why N-gram all of a sudden in a ML learning quest  ?

**Q. Why N-gram though?**

ans . Well, in Natural Language Processing, or NLP for short, n-grams are used for a variety of things. Some examples include auto completion of sentences (such as the one we see in Gmail these days), auto spell check (yes, we can do that as well), and to a certain extent, we can check for grammar in a given sentence.

**Q .N-gram Probabilities ?**

ans .Let’s take the example of a sentence completion system. This system suggests words which could be used next in a given sentence. Suppose I give the system the sentence “Thank you so much for your” and expect the system to predict what the next word will be. Now you and me both know that the next word is “help” with a very high probability. But how will the system know that?

When we’re building an NLP model for predicting words in a sentence, the probability of the occurrence of a word in a sequence of words is what matters. And how do we measure that? Let’s say we’re working with a bigram model here, and we have the following sentences as the training corpus:

1. Thank you so much for your help.
2. I really appreciate your help.
3. Excuse me, do you know what time it is?
4. I’m really sorry for not inviting you.
5. I really like your watch.

Let’s suppose that after training our model with this data, I want to write the sentence “I really like your garden.” Now because this is a bigram model, the model will learn the occurrence of every two words, to determine the probability of a word occurring after a certain word. For example, from the 2nd, 4th, and the 5th sentence in the example above, we know that after the word “really” we can see either the word “appreciate”, “sorry”, or the word “like” occurs. So the model will calculate the probability of each of these sequences.

Suppose we’re calculating the probability of word “w1” occurring after the word “w2,” then the formula for this is as follows:

*count(w2 w1) / count(w2)*

*count(really like) / count(really)
= 1 / 3
= 0.33*

Source PDF : <https://web.stanford.edu/~jurafsky/slp3/3.pdf>

My Jupyter Noteboook Link  :  [Notebook](https://github.com/harshityadav95/100-Days-of-Machine-Learning/blob/master/Day%2013/N%20gram.ipynb)
