---
title: "MVA Know it prove it- Web Development -2 HTML5 & CSS3 - iii"
author: harshityadav95
date: 2017-05-14 00:00:00 +0530
categories: [SDE]
tags: [Cloud, Web Devlopment]
description: "Migrated from Blogger."
published: true
---

Article Tag

Article is a HTML5 semantic element, similar to

and . It is most commonly used to contain information that may be distributed independently from the rest of the site or application it appears in.


The HTML5

element represents a complete composition in a web page or web application that is independently distributable or reusable, e.g. in syndication. This could be a forum post, a magazine or newspaper article, a blog entry, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.



Section Tag

The section element represents a generic section of a document or application. A section, in this context, is a thematic grouping of content, typically with a heading.


Examples of sections would be chapters, the various tabbed pages in a tabbed dialog box, or the numbered sections of a thesis. A Web site's home page could be split into sections for an introduction, news items, and contact information.



DIV Tag

The HTML

tag is used for defining a section of your document. With the div tag, you can group large sections of HTML elements together and format them with CSS.
The difference between the div tag and the span tag is that the div tag is used with block-level elements whilst the span tag is used with inline elements.




Forms Tag

The HTML  tag is used to create an HTML form and it has following syntax:

```
 action="Script URL" method="GET|POST">
    form elements like input, textarea etc.
```

Two commonly used methods for a request-response between a client and server are: GET and POST.

- **GET** - Requests data from a specified resource
- **POST** - Submits data to be processed to a specified resource

Reset CSS



A CSS reset is a set of styles you load prior to your other styles, to remove browser built-in styles. One of first and most popular ones was Eric Mayer's [Reset CSS](http://meyerweb.com/eric/tools/css/reset/).

Another option is to harmonize browser built-in styles. The most popular tool to achieve this is currently [Normalize.css](http://necolas.github.com/normalize.css/).

Selectors

## **Selectors** define to which elements a set of CSS rules apply.

[Type selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors)
This basic selector chooses all elements that matches the given *name*.
**Syntax:** eltname
**Example:** input will match any  element.
[Class selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors)
This basic selector chooses elements based on the value of their class attribute.
**Syntax:** .classname
**Example:** .index will match any element that has the class index (likely defined by a class="index" attribute or similar).
[ID selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors)
This basic selector chooses nodes based on the value of its id attribute. There should be only one element with a given ID in a document.
**Syntax:** #idname
**Example:** #toc will match the element that has the id toc (likely defined by a id="toc"attribute or similar).
[Universal selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors)
This basic selector chooses all nodes. It also exists in a one-namespace only and in an all-namespace variant too.
**Syntax:** \* ns|\* \*|\*
**Example:** \* will match all the elements of the document.
[Attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
This basic selector chooses nodes based on the value of one of its attributes.
**Syntax:** [attr] [attr=value] [attr~=value] [attr|=value] [attr^=value] [attr$=value] [attr\*=value]
**Example:** [autoplay] will match all the elements that have the autoplay attribute set (to any value).
Cascading order of preference

[![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/CascadeOfStyles5.JPG/600px-CascadeOfStyles5.JPG)](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/CascadeOfStyles5.JPG/600px-CascadeOfStyles5.JPG)

Canvas Element

The HTML  element is used to draw graphics, on the fly, via JavaScript.

The  element is only a container for graphics. You must use JavaScript to actually draw the graphics.

Canvas has several methods for drawing paths, boxes, circles, text, and adding images.

What is SVG

**Scalable Vector Graphics** (**SVG**) is an XML-based vector image format for two-dimensional graphics with support for interactivity and animation. The **SVG**specification is an open standard developed by the World Wide Web Consortium (W3C) since 1999



The difference between vector and raster graphics is that raster graphics are composed of pixels, while vector graphics are composed of paths. A raster graphic, such as a gif or jpeg, is an array of pixels of various colors, which together form an image.

Vendor Prefixes

When CCS3 was first being introduced, a number of excited properties began to hit different browsers at different times. For example, the webkit-powered browsers (Safari and Chrome) were the first ones to introduce some of the animation-style properties like transform and transition. By using vendor prefixed properties, web designers were able to use those new features in their work and have them seen on the browsers that supported them right away, instead of having to wait for every other browser manufacturer to catch up!



So from the perspective of a front-end web developer, browser prefixes are used to add new CSS features onto a site while  having comfort knowing that the browsers will support those styles. This can be especially helpful when different browser manufacturers implement properties in slightly different ways or with a different syntax.

**Responsive  Web Design**

Responsive web design (RWD) is an approach to [web design](https://en.wikipedia.org/wiki/Web_design "Web design") aimed at allowing desktop webpages to be viewed in response to the size of the screen or web browser one is viewing with. In addition it's important to understand that Responsive Web Design tasks include offering the same support to a variety of devices for a single website. As mentioned by the Nielsen Norman Group: content, design and performance are necessary across all devices to ensure usability and satisfaction

**Bootstrap**

Bootstrap is a free and open-source front-end web framework for designing websites and web applications. It contains HTML- and CSS-based design templates for typography, forms, buttons, navigation and other interface components, as well as optional JavaScript extensions. Unlike many web frameworks, it concerns itself with front-end development only.

Link : <https://html5boilerplate.com/> , <http://getbootstrap.com/>
