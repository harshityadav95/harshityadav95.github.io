---
title: "Django –Marathon 4/6"
author: harshityadav95
date: 2017-01-07 00:00:00 +0530
categories: [SDE Developer, Python]
tags: [Django, Python]
description: "Migrated from Blogger."
published: true
---

Topic Covered: URL and Routing

What is the need of
routing  ?

- -
  To make URL easy and better for SEO
- -
  To not show user specific files like .html and
  .py as request
- -
  To show details as per user request or
  action

[![](/assets/img/posts/2017-01-07-django-marathon-4-6/1.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/1.png)

Django uses Regular expressions for patterns (called perl
regular expression)


[![](/assets/img/posts/2017-01-07-django-marathon-4-6/2.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/2.png)

- $Contact  ---must
  start with contact ie contactus
- Us^ --- end with us ie
  contactus
- \d – for digits
- \D – Non digit
- \w – Word character
  or alphanumeric  (A-Z,0-9,\_)
- \W – non word character

To Create you own range use square bracket

-
[a-z] lower case a to z

-
[az] specifically a or z

-
[a-zA-Z ] means lower case a through Z  and upper A through Z ie all Letters of
alphabets

For Specific Choices
,Few Examples  [Look more  ] // Regular Expressions

- -\d   For a single
  Digit
- -\d\d od \d{2} for two digits , brackets applies to item
  immediately proceeding it  (asd\d){2}
- -\d{1,2} means minimum and maximum number of items
- - \d+ : + means Zero or more
- -\d\* : \* means zero or more
- -\d? ? means item is optional

[![](/assets/img/posts/2017-01-07-django-marathon-4-6/3.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/3.png)

Reference For Lookup:

-
<https://regexlib.com/?AspxAutoDetectCookieSupport=1>

-
<https://www.diveintopython3.net/regular-expressions.html>

Django Chooses the First pattern that matches


[![](/assets/img/posts/2017-01-07-django-marathon-4-6/4.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/4.png)



[![](/assets/img/posts/2017-01-07-django-marathon-4-6/5.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/5.png)



[![](/assets/img/posts/2017-01-07-django-marathon-4-6/6.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/6.png)



[![](/assets/img/posts/2017-01-07-django-marathon-4-6/7.png)](/assets/img/posts/2017-01-07-django-marathon-4-6/7.png)

# Example  :

//in Url.py

url(r'^artists$',app.views.artists,name='home'),

url(r'^artists/(?P[A-Za-z]+)$',app.views.artistdetails,name='artistdetails'),

//in
views.py

from django.http import HttpRequest,HttpResponse

def artists(request):

return HttpResponse('Hello,
Django!

# Helllo World

');

def artistdetails(request,name):

output=''+name

output+='

# '+ name

output+=''

return HttpResponse(output);

Start
Server for output to see instantenous changes

**## !!
Correction ..^ to Start $ to end**
