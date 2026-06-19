---
title: "How to Sign git Commits with GPG in Github in Windows 10"
author: harshityadav95
date: 2019-02-28 00:00:00 +0530
categories: [Skynet System, Dev Kit]
tags: [git, github, gpg, windows]
---

## How to Sign git Commits with GPG in Github in Windows 10

![Medium article image](/assets/img/posts/how-to-sign-git-commits-with-gpg-in-github-in-windows-10/medium-image-579132c7f3d9.png)

In this article, I’ll cover how to set up signing commits with GPG and verifying those signatures on GitHub.

### What is GPG?

[GPG](https://www.gnupg.org/)stands for GNU Privacy Guard. It is a form of encryption much like SSH–in fact, GNUPG version 2 includes support for SSH. It can be used to verify the identify of a sender–in this case, committer.

### Install the necessary tools

1. If Using Linux , or Windows Subsystem for Linux no need to set up you are ready to go
2. For Mac or windows User Install Some[GPG4Win](https://www.gpg4win.org)[While Running the GPG4Win GUI Installer install only the essential gpg package and unchecked all the other packages like Kleopatra etc]

**Steps 1:**

Open the the Terminal and enter

```
gpg --gen-key
```

When Running for the First Time it will ask for Name , Email , password , pass phrase

When asked for an email, it is important to use the*same email*as the one on your GitHub profile–which should also be the same as the one used for Git. If these three emails do not match,**verification will fail**

After going through all the options and generation of the key it will give some output like

```
pub   4096R/<key> 2019-02-28
```

```
Key fingerprint = <Long Key>
```

```
uid                  Harshit Yadav (This is the GPG Key to Sign Keys) <harshityadav95@gmail.com>
```

```
sub   4096R/<Key> 2019-02-28
```

**Add the Key to your Github Account**

First Export the Key using the command

```
gpg --gen-key <Key>
```

Which will generate long text which will generate your public key

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
```

```
<Long Random Text>-----END PGP PUBLIC KEY BLOCK-----
```

**Add the GPG Public Key to you Account**

![Medium article image](/assets/img/posts/how-to-sign-git-commits-with-gpg-in-github-in-windows-10/medium-image-41d146c2e9e7.png)

Add the Signing Key to your global git config so that all your git commits are verified

```
git config --global user.signingkey <Key>
```

**Last Step : Now Commit using the command**

```
git commit -S -m "My commit msg"
```

Hopefully that helped you. If you encounter any errors I didn’t account for, drop a response below and I’ll add it to this post.You could also checkout some reference link to help you out :

>[https://github.com/alvarogzp/git-sign-commits](https://github.com/alvarogzp/git-sign-commits)

>[https://medium.com/@ryanmillerc/use-gpg-signing-keys-with-git-on-windows-10-github-4acbced49f68](https://medium.com/@ryanmillerc/use-gpg-signing-keys-with-git-on-windows-10-github-4acbced49f68)

>[https://docs.gitlab.com/ee/user/project/repository/gpg_signed_commits/](https://docs.gitlab.com/ee/user/project/repository/gpg_signed_commits/)

>[https://stackoverflow.com/questions/36810467/git-commit-signing-failed-secret-key-not-available](https://stackoverflow.com/questions/36810467/git-commit-signing-failed-secret-key-not-available)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/how-to-sign-git-commits-with-gpg-in-github-in-windows-10-5d9589494c1e)
