---
layout: default
title: About
description: About the bde-lock project and its author(s)
---

# About the project

In Windows a manually or automatically unlocked BitLocker encrypted drive stays unlocked until the system is restarted. This is not optimal for everybody, especially if the drive in question holds sensible data, which should only be unlocked for a specific event and then be locked afterwards again. For example: Some backup is stored on an encrypted drive. The drive gets unlocked to update the backup copy. As soon as the update is complete, there is no further need for this drive to stay unlocked.

For whatever reason Microsoft does not provide a drive context menu function to re-lock the drive. Many users therefor have asked Microsoft support or their fellow Windows users, how they can lock the drive without restarting the system. Several solutions have been suggested. First the tool required is [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) and is already installed on every Windows system providing BitLocker encryption. To make it easy for the user (any myself) I prefer a context menu entry (righ-click on the drive), which executes the necessary command, instead of desktop shortcut for specific drives or manually executing the tool via command or powershell. This entry requires to create some registry keys.

To make it easier for fellow Windows users I decided to create [the bde-lock installer](https://github.com/dleidert/bde-lock/releases/latest), which will create all [required registry keys for the context menu entry](./registry-keys) and install a [small script to perform the lock task with the required permissions](./manage-bde). The installer will also provide an uninstaller, which will remove all created registry keys and all installed files.

# About the author

...

