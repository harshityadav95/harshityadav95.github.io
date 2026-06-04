---
title: "PostgreSQL In Windows Subsystem for Linux (WSL)"
author: harshityadav95
date: 2019-03-26 00:00:00 +0530
categories: [Dev Kit]
tags: [postgresql, wsl, windows, linux]
---

## PostgreSQL In Windows Subsystem for Linux (WSL)

![Medium article image](/assets/img/posts/postgresql-in-windows-subsystem-for-linux-wsl/medium-image-961245a6e458.jpg)

To start refresh clean up the previous install using :

```
sudo apt-get remove postgresql
```

```
[sudo] password for harshityadav95:Reading package lists... DoneBuilding dependency treeReading state information... DonePackage 'postgresql' is not installed, so not removedThe following package was automatically installed and is no longer required:  libfreetype6Use 'sudo apt autoremove' to remove it.0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
```

Now Install fresh using

```
sudo apt-get install postgresql
```

## Postgres User Setup

postgresql-10 runs under the user`postgres`. We need to give this user a password so that postgres can allow this user to connect to the database.

1. To set the password for postgres, type`sudo passwd postgres`
2. You will get a prompt to enter in your password. It will not show when you are typing, but it is still registering your key-strokes.
3. Close and repoen the terminal.

## Using psql

After your first install, and each time you restart your machine you will have to also restart the postgres service, or else you will get a`Is the server running?`error.

1. To start the service, type`sudo service postgresql start`.
2. To conntect to postgres, type`sudo -u postgres psql`

You should get a prompt asking for your password. If this doesn’t work, then you can try the second option listed below.

1. Switch users to postgres by typing`su - postgres`.
2. Type`psql`.

When this is successful you will see the command line change to look like this`postgres=#`

### Creating user

```
$ sudo -u postgres createuser <username>
```

Creating Database

```
$ sudo -u postgres createdb <dbname>
```

```
if getting error:WARNING:  could not flush dirty data: Function not implemented [Ignore for now]
```

Giving the user a password

```
$ sudo -u postgres psqlpsql=# alter user <username> with encrypted password '<password>';
```

**Granting privileges on database**

```
psql=# grant all privileges on database <dbname> to <username> ;
```

Run a normal arithematic query to see if everything is working , now

## **Connecting Postgresql Instance to GUI Client in Windows**

There are GUI Clients which specially designed for PgAdmin4 or some general managemnt studio which supports different kind of database like

1. Dbeaver [[https://dbeaver.io](https://dbeaver.io)]
2. Adminer [[https://www.adminer.org](https://www.adminer.org)]
3. Table Plus [[https://tableplus.io](https://tableplus.io)]
4. heidisql [[https://www.heidisql.com/](https://www.heidisql.com/)]
5. OmniDB [[https://omnidb.org/en/](https://omnidb.org/en/)
6. [squirrelsql](https://www.squirrelsql.org)[[https://www.squirrelsql.org](https://www.squirrelsql.org)]

Among all the one with stable release and portable package to run without installation I chose Table Plus now to connect Launch the .exe

![Medium article image](/assets/img/posts/postgresql-in-windows-subsystem-for-linux-wsl/medium-image-636b16fee798.png)

click on create new connection and enter the settings :

![Replace the Username , password and database with your config](/assets/img/posts/postgresql-in-windows-subsystem-for-linux-wsl/medium-image-86ca7e1e4284.png)

_Replace the Username , password and database with your config_

or if using PgAdmin

![Medium article image](/assets/img/posts/postgresql-in-windows-subsystem-for-linux-wsl/medium-image-98d224aac0f6.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/postgresql-in-windows-subsystem-for-linux-wsl-6dc751ac1ff3)
