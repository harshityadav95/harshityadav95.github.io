---
title: Setup Github SSH in Windows

date: 2023-07-30 00:00:00 +0530
categories: [Dev Kit]
tags: [Git, Github]

---


![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/e103410f-fe64-4d92-99d2-e8c51396b73d)


### Generate SSH keys

The process is the same for both Windows and Mac. On Windows, you can use the powershell terminal and on Mac, the standard terminal will work.

- Open the terminal ,Enter the following:

```powershell
 **ssh-keygen -t ed25519 -C "your@email.com"**
```

- Replace the email with your own and press enter.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/80e5d693-2f9b-4a5a-a396-a69c48b215fe)


- It will prompt to enter a password. Hit enter to skip setting a password and do the same for entering the same passphrase again.

```powershell
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\harsh/.ssh/id_ed25519):
Created directory 'C:\\Users\\harsh/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:\Users\harsh/.ssh/id_ed25519
Your public key has been saved in C:\Users\harsh/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:4Z4OiYAa0OV54doT+eDXAsVvkLiTvLYIFxZdNlHjRCQ harshityadav@outlook.com
The key's randomart image is:
+--[ED25519 256]--+
|    ...+E**      |
| . o.oo=+= .     |
|. . ooBo.o.      |
|..  o==* oo      |
|o ....+oS..      |
|......o= o       |
|.  o.oo.o        |
|    . .o         |
|        .        |
+----[SHA256]-----+
```

1. Once you have confirmed it will generate the above to confirm the keys have been created.
2. Both keys will be stored in the .ssh folder.
3. In order to add our key to Github, we need to get a copy of the public key which is always identified as .pub in your local directory.

```powershell
PS C:\Users\harsh> pbcopy < C:\Users\harsh/.ssh/id_ed25519.pub
```

- This will display the key on your terminal and also copy the content of the file in clipboard

## Adding Your Keys to Github

We now need to add our public key to Github to grant access to the repositories we create.

**Step 1:** Log on to Github

**Step 2:** Click on the profile icon in the top right of the screen and select Settings.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/977eb7dc-eb90-421f-bd7b-e81e455fa34e)


- Click the New SSH key button in Green on the right-hand side of the screen.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/aaa9c4f1-6a1b-4a1e-a3b8-5236fddf3fb0)


- Enter a title and paste in your public key that you copied previously.
- Click the **Add SSH key** button.

You are now ready to access Github via SSH.

## Accessing Repositories

When accessing a repository and using SSH authentication, make sure to always use the SSH address of the repository.
![harshityadav95](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/8facebb1-87db-47cb-8773-a1e12f140fca)



