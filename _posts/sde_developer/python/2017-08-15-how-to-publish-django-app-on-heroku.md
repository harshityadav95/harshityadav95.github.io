---
title: "How to publish Django app on Heroku"
author: harshityadav95
date: 2017-08-15 00:00:00 +0530
categories: [SDE Developer, Python]
tags: [python, django, heroku, deployment]
---

## How to publish Django app on Heroku

- **The Procfile**

- **The Requirement File (super important)**

- **The runtime.txt**

- Set Up The Static Assets

- Install the**Whitenoise**, and don’t forget to update the**requirements.txt**:

- Add the**Whitenoise**to your Django application in the**wsgi.py**file:

- **Update the settings.py**

`STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'`

- Add config variable to disable static config variable

```
heroku config:set DISABLE_COLLECTSTATIC=1
```

Link :[https://simpleisbetterthancomplex.com/tutorial/2016/08/09/how-to-deploy-django-applications-on-heroku.html](https://simpleisbetterthancomplex.com/tutorial/2016/08/09/how-to-deploy-django-applications-on-heroku.html)

Link :[https://github.com/heroku/heroku-django-template](https://github.com/heroku/heroku-django-template)

## Setting up Database and Admin and project

- run the command python manage.py migrate
- cmd: heroku addons:create heroku-postgresql:hobby-dev — app deploytrials
- add this code :

```
import dj_database_urldb_from_env = dj_database_url.config()DATABASES['default'].update(db_from_env)
```

- heroku run bash — app deploytrials
- migrate>> makemigrations>>createsuperuser

## **Creating New Project Using VS Template**

- Create New Django Project
- Install virtualenv from VS console
- python manage.py startapp webapp
- Include webapp in the project in visual studio
- Add webapp in installed projects
- <Database migration >
- add this in URL file of main project url(r’’,include(‘webapp.urls’)),
- Create a urls.py in the webapp folder and add the following
- add the following code in the[urls.py](https://gist.github.com/harshityadav95/bf9d5872dcedf264aa677f69dbd40301)in the webapp folder ()
- add the following code in the[views.py](https://gist.github.com/harshityadav95/39279028b2c7a2e165c02eaf81661ac9)
- weapp └───templates └───webapp and add home.html

Vola

Now porting the same app on heroku

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/how-to-publish-django-app-on-heroku-6bedb6504a50)
