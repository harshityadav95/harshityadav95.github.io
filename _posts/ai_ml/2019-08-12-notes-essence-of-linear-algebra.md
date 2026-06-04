---
title: "Notes : Essence of Linear Algebra"
author: harshityadav95
date: 2019-08-12 00:00:00 +0530
categories: [AI ML]
tags: [linear-algebra, math, notes]
---

## Revision Notes : Essence of Linear Algebra

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-001.jpg)

Video Playlist Followed :[Link to the Video](https://www.youtube.com/playlist?list=PL_w8oSr1JpVCZ5pKXHKz6PkjGCbPbSBYv)by 3Blue1Brown

## **Video 1 :**

- Meaning of Vector for Physicist (arrows pointing in space), CS Student (ordered list of numbers, sets), Mathematician ()
- In Linear Algebra the Vector will always origin at 0,0 in Space
- Vectors are coordinates as to how much distance along the X-axis or Y axis , that can also be represented in form of a 1X2 Matrix
- (Addition)Sum of Two Vectors = move along vector 1 , then move along vector 2 then the total travel is the sum of the two vectors (ie Matrix addition )then following the end point from the origin
- (Scaling)Multiplication of vectors : scaling the factors by a factor multiplied

![Linear Combination of Scalers](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-002.png)

_Linear Combination of Scalers_

![Every point in the Plane can be reached by scaling the two vectors](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-003.png)

_Every point in the Plane can be reached by scaling the two vectors_

## **Video 2: Basis and Span**

- i vector is x-axix and j is y-axis
- i and j are the Basis of the Coordinate System (and everything else is just scaling these basis in the coordinate system)
- [Technical Definition :] The Basis of a vector is a set of linearly independent vectors that span the full space
- The choice of basis vector matters when choosing a coordinate system
- Span : of two vectors is set of all linear combinations (ie the points they can reach)
- If adding two vectors keeps the resultant vector span in the same dimension then they are Linearly dependent , and if their addition adds a new span of dimensions then they are “Linear independent”

## **Video 3: Linear Transformation**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-004.png)

- Linear Transformation :Linear (all lines must remain lines and Origin remains fixed )+ Transformation (a function that takes an input and gives an output, the transformation is used instead of function to bring int the role of moment of vector from its initial position to final position )

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-005.png)

- The Place where original vector lands after the transformation is used as value to be multiplied with other vectors to find where they land after the transformation

## **Video 4: Matrix Multiplication**

- If you want to apply linear Transformation many(Rotation +Shear) times than that is called the Composition

![This is read Right to Left](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-006.png)

_This is read Right to Left_

- Matrix Multiplication is Not Commutative
- Matrix Multiplication is Not Associative

## **Video 5: 3D Linear Transformation**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-007.png)

## **Video 6 : Determinant**

- The Determinant of Matrix is the change in the area covered by the Vectors after the Transformation

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-008.png)

- Determinant is Zero 0 if the area squeeze down to Single
- -ve Determinant is caused due to flipping of Orientation of Space
- In 3D Matrix the Determinant is the Volume changed

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-008.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-009.png)

## **Video 7 : Inverse , Rank**

![System of Linear Equations](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-010.png)

_System of Linear Equations_

- It can be Visually Interpreted as the Transformation required so that the Vector A lands on vector V after the Transformation
- Inverse Transformation is the transformation required from V to go back to A (AInv A is Identity since it ends up doing nothing )
- Unless the the Determinant is Not ZERO the Determinant will Exist (if zero the area will be line and you cannot decompose back line back to area or volume through a single function)
- A Inverse X A is doing Nothing thus the Identity matrix
- Solution can Still exist if the Determinant is zero if the solution exist on the Same Line
- When the output of Determinant is 0 (it squeeze down to a line ) then the Rank of the Matrix is said to be 1 , if the Transformation lands on a 2-D Plane instead of a line than it has the Rank 2
- RANK : is the number of Dimensions in the Output
- Be it Line of Plane : it is called the Columns Space of a Matrix , and column tells where the base vector lands
- Span of Columns = Column Space

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-011.png)

- 0,0 is always in the Column Space since in the Linear Transformation the origin cannot be moved and any number of vectors can land on the origin after the Transformation thus it is the Null Space (Kernel of Matrix)of the Vector

## Video 8: Non Square Matrices and Transformation

- Transformation can occur between inter Dimensions in 1D-2D etc

## Video 9: Dot Product and Duality

![Calculating the Dot product](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-012.png)

_Calculating the Dot product_

- Dot Product is projecting a Vector onto other vector and Multiplying their Length , if the projection is in other direction the Dot Product will be Negative , and if Perpendicular then the projection will be zero

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-013.png)

- Order dosen’t Matter who projects onto whom

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-014.png)

- vector Multiplication (1X2 Matrice = 2D Matrice)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-015.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-016.png)

- Duality : Natural correspondence (ie linear transformation of vector is some other vector in that space ) (ie 2 computation that look similar )

## **Video 10: Cross Product**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-017.png)

- take a vector v and move the vector w to the end of it and then repeat the same in other order (ie take w and move start of v to end of w)the diagram obtained is a parallelogram ) — the Determinant
- +ve and -ve is due to the order (j should be on left of I anticlockwise )

![The Determinant is calculated to find the area](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-018.png)

_The Determinant is calculated to find the area_

![Scaling even a single vector by a factor would scale the entire area by the same factor](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-019.png)

_Scaling even a single vector by a factor would scale the entire area by the same factor_

- The Cross product is not a number its a resultant vector as per Right hand thumb rule of the magnitude given by the number

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-020.png)

## **Video 11 : Cross product + Linear Transformation**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-021.png)

- In 3D the cross product Visualisation

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-022.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-023.png)

## **Video 12 : Crammers Rule**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-024.png)

![Crammers Rule](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-025.png)

_Crammers Rule_

## Video 13: Change of Basis

- getting to the same vectors but by using different basis means scaling differently to land and the same coordinates (describing same thing but in different languages )
- drawing different grid lines for same vectors

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-026.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-027.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-028.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-029.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-030.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-031.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-032.png)

## **Video 14: Eigen Values and Eigen Vectors**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-033.png)

- when a vector is transformed the span of it also changes but sometimes even after transformation the span doesn't changes
- For those vectors which remain on their span even after transformation but stretched are called the eigen vectors of the transformation and eigen values are the factors by which they are stretched or squished

![Solve for Lambda and V](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-034.png)

_Solve for Lambda and V_

![Moving Lambda to the other side](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-035.png)

_Moving Lambda to the other side_

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-036.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-037.png)

- We have to find the value of the lambda so that the determinant is zero so that the following assumption becomes true

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-038.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-039.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-040.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-041.png)

![The Diagonal Matrix make it easy to multiply the matrix n number of times to itself](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-042.png)

_The Diagonal Matrix make it easy to multiply the matrix n number of times to itself_

![Set of Eigen Values that are also diagnonal elements are also called as eigen basis (its easy to calculate for larger values of powers )](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-043.png)

_Set of Eigen Values that are also diagnonal elements are also called as eigen basis (its easy to calculate for larger values of powers )_

- Not all matrices have eigen basis

## **Video 15: Abstract Vector Spaces**

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-043.png)

![Medium article image](/assets/img/posts/notes-essence-of-linear-algebra/medium-image-044.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/notes-essence-of-linear-algebra-7d5388b2a940)
