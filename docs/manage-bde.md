---
layout: default
title: Usage of manage-bde.exe and Lock-BitLocker
description: >
  Unlocked BitLocker protected drives can be locked using the BitLocker
  control panel or using the manage-bde.exe command-line tool or the
  Lock-BitLocker PowerShell cmdlet.
tags:
  - manage-bde.exe
  - manage-bde
  - bde
  - Lock-Bitlocker
  - forcedismount
  - lock
  - BitLocker
---

## Usage of `manage-bde.exe` via command shell

[`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) is a command-line tool, which can be used instead of the BitLocker drive encryption control panel. It is available on Windows systems in the `%windir%\system32\` path (usually `C:\Windows\system32\manage-bde.exe`). It accepts different parameters to request information about the drive encryption, enable or disable BitLocker encryption, manage protection methods and lock or unlock drives. To manually lock an unlocked BitLocker protected drive (`Drive:` needs to replaced with the actual drive letter) the following command can be used:

```Batchfile
manage-bde.exe -lock Drive: -forcedismount
```

in a command shell (`cmd.exe`). Because of the `-forcedismount` switch the locking action will be forced. Without the switch Windows might refuse to lock the drive, if it detects, that the drive in question is still in use. **It seems a really bad idea to run this command on the system drive or system relevant drives!** I have not tested it and I therefor don't know, if `manage-bde.exe` will refuse to lock the system drive. If not, this may cause heavy damage. The command further needs to be executed with elevated permissions or it may fail too. This can be achieved by executing the command in a command shell, which is run as administrator.

## Usage of `Lock-BitLocker` via powershell

There is also a bunch of [PowerShell cmdlets for BitLocker](https://docs.microsoft.com/en-us/powershell/module/bitlocker/?view=win10-ps). To lock the drive the cmdlet [`Lock-BitLocker`](https://docs.microsoft.com/en-us/powershell/module/bitlocker/lock-bitlocker?view=win10-ps) can be used. Likewise the switch `-ForceDismount` forces the lock action. But the cmdlet also offers a switch `-Confirm` to ask for confirmation. The following command can be executed in a PowerShell.

```PowerShell
Lock-BitLocker -MountPoint "Drive:" -ForceDismount -Confirm
```

Again, **it seems a really bad idea to run this command to lock the system drive or system relevant drives during operation!**
