---
title: "Notes :Binomial Heap [Draft]"
author: harshityadav95
date: 2019-09-12 00:00:00 +0530
categories: [SDE Developer]
tags: [data-structures, binomial-heap, notes]
---

## Notes :Binomial Heap [Draft]

- A binomial*heap*is made up of a list of binomial*trees*
- The main application of[Binary Heap](http://geeksquiz.com/binary-heap/)is as implement priority queue Binomial Heap is an extension of[Binary Heap](http://geeksquiz.com/binary-heap/)that provides faster union or merge operation together with other operations provided by Binary Heap

![Medium article image](/assets/img/posts/notes-binomial-heap-draft/medium-image-ff378a0a480e.jpg)

- A binomial tree of order 0 is a single node
- A binomial tree of order*k*has a root node whose children are roots of binomial trees of orders*k*−1,*k*−2, …, 2, 1, 0 (in this order)
- A binomial tree of order*k*has 2^k nodes, height*k*

![Order 3 has 8 nodes since 2³=8](/assets/img/posts/notes-binomial-heap-draft/medium-image-f338fae5e4ff.png)

_Order 3 has 8 nodes since 2³=8_

Binomial tree of order*k*can be constructed from two trees of order*k*−1 trivially by attaching one of them as the leftmost child of the root of the other tree

- If we have a heap with 13 items, we can express this in binary as 1101. This would translate to a binary tree of degree 3, a tree of degree 2, and a tree of degree 0 (with 2³ + 2² + 2⁰ = 8 + 4 + 1 items respectively = 13 total items)
- A Binomial Tree of Order n and depth r has nCr nodes (binomial coefficient )

A binomial heap is implemented as a set of binomial trees that satisfy the*binomial heap properties*:

- Each binomial tree in a heap obeys the[*minimum-heap property*](https://en.wikipedia.org/wiki/Minimum-heap_property): the key of a node is greater than or equal to the key of its parent.

(The first property ensures that the root of each binomial tree contains the smallest key in the tree, which applies to the entire heap.)

- There can only be either*one*or*zero*binomial trees for each order, including zero order. (eg number 13 is 1101 in binary)

// pending : Implementing Binomial Heap In Code

## Merge Better

the advantage of a binomial heap is that it supports**log(n) merging**given two binomial heaps.

![binomial heap, you earn faster merging, but give up the O(1) find-min of a binary heap.](/assets/img/posts/notes-binomial-heap-draft/medium-image-4804be3d892f.png)

_binomial heap, you earn faster merging, but give up the O(1) find-min of a binary heap._

## Links

The typical method of implementing the links between nodes is to have pointers to a parent, sibling and child. A tree does not have a direct link to all it’s immediate children, instead it goes to its first child and then iterates through each sibling. Here is an illustration of the regular pointer structure for a binomial tree.

![Medium article image](/assets/img/posts/notes-binomial-heap-draft/medium-image-d10b122bfdbf.png)

## Operations

## Find minimum

Find minimum iterates through the roots of each binomial tree in the heap.

## Insert

Insert creates a new heap with the inserted element which are then combined using the union operation.

## Union

The union operation merges the two heaps together by continually linking trees of the same order until no two trees of the same order exist.

![Medium article image](/assets/img/posts/notes-binomial-heap-draft/medium-image-8324a84de7da.png)

## Extract minimum

Extract minimum iterates through the roots of each binomial tree in the heap to find the smallest node which is removed. The tree fragments are then reversed to form another heap

## Decrease key

Decrease key reduces the specified node’s key and then bubbles it up through its ancestors until the tree meets the conditions of a heap

## Delete

Delete is performed by calling decrease key to reducing the node to negative infinity which pulls the node to the top of the tree.

**References**

- [https://www.growingwiththeweb.com/data-structures/binomial-heap/overview/](https://www.growingwiththeweb.com/data-structures/binomial-heap/overview/)
- [https://www.geeksforgeeks.org/binomial-heap-2/](https://www.geeksforgeeks.org/binomial-heap-2/)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/notes-binomial-heap-draft-ccd9c00c2241)
