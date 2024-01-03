---
title: Setup Multiple Git Accounts on Machine

date: 2022-03-26 00:00:00 +0530
categories: [Dev Kit]
tags: [Git, Github]

---

😬 Movie and Show Reference stick longer in the head than textbooks, reference of “Curve 25519” in silicon valley

[https://youtu.be/zdYJi2snJXI](https://youtu.be/zdYJi2snJXI)

<iframe width="560" height="315" src="https://www.youtube.com/embed/zdYJi2snJXI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## 1. Generate SSH

1. Open Terminal.

2. Paste the text below, substituting in your GitHub email address.

   ```
   $ ssh-keygen -t ed25519 -C "your_email@example.com"
   
   Example :
   
   ssh-keygen -t ed25519 -C "harshityadav@outlook.com" -f "harshityadav95"
   ```

This creates a new SSH key, using the provided email as a label.

```
> Generating public/privatealgorithm key pair.
```

1. When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.

   `> Enter a file in which to save the key (/Users/*you*/.ssh/id_*algorithm*): *[Press enter]*`

2. At the prompt, type a secure passphrase. For more information, see ["Working with SSH key passphrases](https://docs.github.com/en/articles/working-with-ssh-key-passphrases).", Remember the passphrase the same will be required later for  while pushing and pulling the repository

   ```
   > Enter passphrase (empty for no passphrase):[Type a passphrase]
   > Enter same passphrase again:[Type passphrase again]
   ```

## **2. Adding the new SSH key to the corresponding GitHub account**

We already have the SSH public keys ready, and we will ask our GitHub accounts to trust the keys we have created. This is to get rid of the need for typing in the username and password every time you make a Git push.

Copy the public key `pbcopy < ~/.ssh/id_rsa.pub` and then log in to your personal GitHub account:

1. Go to `Settings`
2. Select `SSH and GPG keys` from the menu to the left.
3. Click on `New SSH key`, provide a suitable title, and paste the key in the box below
4. Click `Add key` — and you’re done!

## 3**. Creating the SSH config file**

Here we are actually adding the SSH configuration rules for different hosts, stating which identity file to use for which domain.

The SSH config file will be available at **~/.ssh/config**. ****Edit it if it exists, or else we can just create it.

```
$ cd ~/.ssh/
$ touch config           // Creates the file if not exists
$ code config            // Opens the file in VS code, use any editor
```

Make configuration entries for the relevant GitHub accounts similar to the one below in your `~/.ssh/config` file:

```
#user1 account
Host github.com-harshityadav95
   HostName github.com
   User git
   IdentityFile ~/.ssh/harshityadav95
   IdentitiesOnly yes

#user2 account
Host github.optum.com-hyadavXX
   HostName github.harshityadav.com
   User git
   IdentityFile ~/.ssh/hyadavXX
   IdentitiesOnly yes
```

“harshityadav95” is the GitHub user id for the work account.

“**g*ithub.com-*harshityadav95**” is a notation used to differentiate the multiple Git accounts. You can also use “**harshityadav95.g*ithub.com”*** notation as well. Make sure you’re consistent with what hostname notation you use. This is relevant when you clone a repository or when you set the remote origin for a local repository

The above configuration asks ssh-agent to:

- Use **harshityadav95** as the key ****for ****any Git URL that uses **@github.com**
- Use the **hyadavXX** key for any Git URL that uses **@github.com-hyadavXX**

```
$ cd ~/.ssh/
$ touch config           // Creates the file if not exists
$ code config            // Opens the file in VS code, use any editor
```

## 4. **What account should be default?**

Make it global:

```
$git config --global user.name "Harshit Yadav"
$ git config --global user.email "my@pers.on.al"
```

This will be used by default. in case you do not set the local config

## 5. **While Cloning Repositories**

Note: step 7 will help, if we have the repository already available on local.

Now that the configurations are in place, we can go ahead and clone the corresponding repositories. On cloning, make a note that we use the host names that we used in the SSH config.

Repositories can be cloned using the clone command Git provides:

```
git clone git@github.com:personal_account_name/repo_name.git
```

The work repository will require a change to be made with this command:

```
git clone git@github.com-harshityadav95:harshityadav95/testingmultiple.git
```

This change is made depending on the hostname defined in the SSH config. The string between @ and: should match what we have given in the SSH config file.

## 6. **What account should be local?**

Make it the local to that repository:

```
$git config  user.name "Harshit Yadav"
$git config  user.email "harshityadav@outlook.com"
```

This will be used by local and visible in commits.

## 7. **For Locally Existing Repositories**

**If we have the repository already cloned:**

List the Git remote of the repository, `git remote -v`

Check whether the URL matches our GitHub host to be used, or else update the remote origin URL.

```
git remote set-url origin git@github.com-worker_user1:worker_user1/repo_name.git
```

Ensure the string between @ and : matches the Host we have given in the SSH config.

## 8. **If you are creating a new repository on local:**

Initialize Git in the project folder `git init`.

Create the new repository in the GitHub account and then add it as the Git remote to the local repository.

```
git remote add origin git@github.com-work_user1:work_user1/repo_name.git
```

Ensure the string between @ and : matches the Host we have given in the SSH config.

Push the initial commit to the GitHub repository:

```
git add .
git commit -m "Initial commit"
git push -u origin master
```

There are more smaller and cleaner updated way too I came across but were taking longer to grasp the concept 

## Reference

- [https://gist.github.com/Jonalogy/54091c98946cfe4f8cdab2bea79430f9](https://gist.github.com/Jonalogy/54091c98946cfe4f8cdab2bea79430f9)
- [Developing with multiple GitHub accounts on one MacBook](https://medium.com/@ibrahimlawal/developing-with-multiple-github-accounts-on-one-macbook-94ff6d4ab9ca)

