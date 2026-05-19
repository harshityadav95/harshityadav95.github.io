---
title: "Basic Git Commands"
author: harshityadav95
date: 2017-05-20 00:00:00 +0530
categories: [SDE]
tags: [Project and Progress, Git]
description: "Migrated from Blogger."
published: true
---

So before beginning down ..here is a Defination of Git as per Wikipedia :

Git is a version control system (VCS) for tracking changes
in computer files and coordinating work on those files among multiple people.
It is primarily used for software development, but it can be used to keep track
of changes in any files. As a distributed revision control system it is aimed
at speed, data integrity, and support for distributed, non-linear workflows.

So fast forward  ....apart from having local git  repositories we have some web based version control systems like Github and Bitbucket


[![](/assets/img/posts/2017-05-20-basic-git-commands/github_vs_bitbucket.png)](/assets/img/posts/2017-05-20-basic-git-commands/github_vs_bitbucket.png)

And If you are not a Command Liner Fan you have a nice Set of  GUI applications to manage you git from both Github and Bitbucket  respectively which are :

[![](/assets/img/posts/2017-05-20-basic-git-commands/git_edited.jpg "Github Desktop & Source Tree")](/assets/img/posts/2017-05-20-basic-git-commands/git_edited.jpg)

**Terms to be known with Github**



**Command Line:** The computer program we use to
input Git commands. On a Mac, it’s called Terminal. On a PC, it’s a non-native
program that you download when you download Git for the first time (we’ll do
that in the next section). In both cases, you type text-based commands, known
as prompts, into the screen, instead of using a mouse.

**Repository:** A directory or storage space where
your projects can live. Sometimes GitHub users shorten this to “repo.” It can
be local to a folder on your computer, or it can be a storage space on GitHub
or another online host. You can keep code files, text files, image files, you name
it, inside a repository.

**Version Control:** Basically, the purpose Git was
designed to serve. When you have a Microsoft Word file, you either overwrite
every saved file with a new save, or you save multiple versions. With Git, you
don’t have to. It keeps “snapshots” of every point in time in the project’s
history, so you can never lose or overwrite it.

**Commit:** This is the command that gives Git its
power. When you commit, you are taking a “snapshot” of your repository at that
point in time, giving you a checkpoint to which you can reevaluate or restore
your project to any previous state.



**Branch:** How do multiple people work on a project
at the same time without Git getting them confused? Usually, they “branch off”
of the main project with their own versions full of changes they themselves
have made. After they’re done, it’s time to “merge” that branch back with the
“master,” the main directory of the project.

**[Pull Requests](https://help.github.com/articles/about-pull-requests/) and [Merging Pull Requests](https://help.github.com/articles/merging-a-pull-request/)**



**Git-Specific Commands**

- ·
  **git init:** Initializes a new Git
  repository. Until you run this command inside a repository or directory, it’s
  just a regular folder. Only after you input this does it accept further Git
  commands.
- ·
  **git
  config:** Short for
  “configure,” this is most useful when you’re setting up Git for the first time.
- ·
  **git
  status:** Check the
  status of your repository. See which files are inside it, which changes still
  need to be committed, and which branch of the repository you’re currently
  working on.
- ·
  **git add:** This does *not* add
  new files to your repository. Instead, it brings new files to Git’s attention.
  After you add files, they’re included in Git’s “snapshots” of the repository.
- ·
  **git diff
  :** shows the difference between the working directory and the staging area
- ·
  **git
  commit:** Git’s most
  important command. After you make any sort of change, you input this in order
  to take a “snapshot” of the repository. Usually it goes git commit -m
  “Message here.” The -m indicates that the following section of
  the command should be read as a message.
- ·
  **git
  checkout:** Literally
  allows you to “check out” a repository that you are not currently inside. This
  is a navigational command that lets you move to the repository you want to
  check. You can use this command as git checkout master to look at the
  master branch, or git checkout  to look at another
  branch.
- ·
  **git show
  :** to display the latest commit on your brach
- ·
  **git
  checkout HEAD filename :** will restore the file in your working
  directory to look exactly as it did when you last made a commit.
- ·
  **git reset
  HEAD filename :** This command resets the file in the staging
  area to be the same as the HEAD commit. It does not discard file
  changes from the working directory, it just removes them from the staging area.
- ·
  **git reset**: This command works by using the first 7 characters of the SHA of
  a previous commit.



o
**git
checkout HEAD filename:** Discards changes in the working directory.

o
**git reset
HEAD filename**: Unstages file changes in the staging area.

o
**git reset
SHA:** Can be used to reset to a previous commit in your commit history.

- ·
  **git
  branch:**  This command
  will let you build a new branch, or timeline of commits, of changes and file
  additions that are completely your own. Your title goes after the command



o
**git
branch -d branch\_name :** will delete the specified branch from
your Git project**.**

o
**git merge
branch\_name:** Used to join file changes from one branch to another.

o
**git merge
branch\_name**: Used to join file changes from one branch to another.

- ·
  **git merge:** When you’re done working on
  a branch, you can merge your changes back to the master branch, which is
  visible to all collaborators. git merge cats would take all the
  changes you made to the “cats” branch and add them to the master.



Working in a Team

- ·
  **git clone
  remote\_location clone\_name :** command to clone this remote
  repository from remote location to  your
  location with the name of your choice
- ·
  **git remote
  -v :** to see a list of a Git project's remotes with the command:
- ·
  **git fetch:** to bring
  remote changes (remote) to remote branch (local)   (no merge)
- ·
  **git merge
  origin/master :** to merge remote brach fetch to your own local  master brach
- ·
  **git push:** If you’re
  working on your local computer, and want your commits to be visible online on
  GitHub as well, you “push” the changes up to GitHub with this command.
- ·
  **git push
  origin your\_branch\_name :** will push your branch up to the remote
