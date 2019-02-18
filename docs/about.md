---
layout: default
title: About
description: >
  About the bde-lock project and its author(s)
tags:
  - bde-lock
  - windows
  - manage-bde
  - project description
---

# About the project

In Windows a manually or automatically unlocked BitLocker encrypted drive stays unlocked until the system is restarted. This is not optimal for everybody, especially if the drive in question holds sensible data, which should only be unlocked for a specific event and then be locked afterwards again. For example: Some backup is stored on an encrypted drive. The drive gets unlocked to update the backup copy. As soon as the update is complete, there is no further need for this drive to stay unlocked.

For whatever reason Microsoft does not provide a drive context menu function to re-lock the drive. Many users therefor have asked Microsoft support or their fellow Windows users, how they can lock the drive without restarting the system. Typical questions are:

> How to lock / re-lock the Bitlocker encrypted drive without restarting the system?

> How to re-lock a drive with bitlocker?

> How to add a lock feature to Windows bitlocker encrypted drives?

Several solutions have been suggested, using the command shell or tasks or adding shortcuts or context menu entries. All solutions rely on the tool [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde), which is already installed on every Windows system providing BitLocker encryption. Further I prefer a context menu entry (righ-click on the drive), which executes the necessary command, instead of a desktop shortcut or task. The entry can be created by adding some keys to the Windows regstry.

To make it easier for fellow Windows users I decided to create [the bde-lock installer](https://github.com/dleidert/bde-lock/releases/latest), which will create all [required registry keys for the context menu entry](./registry-keys) and install a [small script to perform the lock task with the required permissions](./manage-bde). The installer will also provide an uninstaller, which will remove all created registry keys and all installed files.

# About the author

...

