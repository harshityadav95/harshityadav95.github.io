---
title:  AutoMount Azure Storage Account in Windows VM
author: harshityadav95
date: 2023-07-31 00:00:00 +0530
categories: [Software Development]
tags: [Azure, Windows, VM]

---

To let the FileShare connection script be autorun at the start of the virtual machine instance and the fileshare be mounted using the same drive letter in VMSS where Talend is deployed

1. Create the file named script.ps1 in the following folder location

```xml
C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```

1. With its content as the connection script provided by azure for mounting FileShare, go to the Azure file storage account 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/30f598ac-cec2-44e9-92c0-5a069de52359)

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/f55f8d42-9435-4bb2-9b3e-c2b7a82e7047)


2. In the Same folder create a file startup.bat with the following code

```xml
@ECHO OFF
Powershell.exe -executionpolicy bypass -File  .\script.ps1

```

And Done ! on every VM or Windows Machine Restart your Storage Account will be Mounted as Z: drive in your OS  as the Shell Script will be Auto Executed in Windows
