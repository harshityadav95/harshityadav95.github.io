---
title: "Django -Marathon 3/6"
author: harshityadav95
date: 2017-01-07 00:00:00 +0530
categories: [SDE Developer, Python]
tags: [Django, Cloud]
description: "Migrated from Blogger."
published: true
---

How to create a object in Django ?

- -
  import django
- -
  django.setup()
- -
  from app.models import Artist
- -
  newArtist=Artist(name =”Artist Name
  ”,year\_formed=2015);
- -
  newArtist.save();



-
// Save Function is inherited in the model class

-
// check migrations carefully if save is not
working  ‘

Updating an Object

- -
  newArtist.name="Maroon"
- -
  newArtist.save()



Queries in Django

[![](/assets/img/posts/2017-01-07-django-marathon-3-6/1.png)](/assets/img/posts/2017-01-07-django-marathon-3-6/1.png)

-

>>>
allArtist=Artist.objects.all() [.all() to get all records  ]

>>>
allArtist[0].name

>>>
allArtist[0].ID

>>>
altArtist=Artist.objects.get(id=1) [Use try catch in get for exception]

>>>
altArtis[0]

Using Basic
Filter Statement in the “get” Statement

>>>
console=Artist.objects.get(name="Maroon")

>>>
print (console.id)

Using filter on
the objects

>>>
console=Artist.objects.filter(name\_\_startswith="M")

// ‘I’ for case
insensitive search

>>>
console=Artist.objects.filter(name\_\_istartswith="M")

// using exact
match in the data

>>>
console=Artist.objects.filter(name\_\_exact="Maroon")

>>>
console=Artist.objects.filter(name\_\_iexact="Maroon")

// Displaying
multiple Query results using for Loop

>>>
for artist in console:

...     print(artist.name)

// Using
multiple filter restrictions conditions in the ORM query  ‘.’

Operator

>>>
console=Artist.objects.filter(name\_\_iexact="Maroon").filter(year\_formed=2015)

>>>
console=Artist.objects.filter(name\_\_iexact="Maroon").exclude(year\_formed=2015)

// using
Foreign Key  for connecting two tables [Join
Statements]

>>>
Album(name="Up",artist=allArtist[0]).save()

>>>
Album(name="down",artist=allArtist[0]).save()

>>>
newAlbum=Album.objects.get.all()

Where allArtist
is an instance OF THE CLASS Artist , Inserting foreign key elements by
referring them to the instance of another class

>>>
for storage in newAlbum:



...     print(storage.id,storage.name)
