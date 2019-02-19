---
layout: page
shorttitle: Home
title:  Lock unlocked BitLocker encrypted drives via context menu
description: >
  Documentation about the bde-lock project, a simple Windows installer, which adds
  'Bitlocker Lock drive' to the drive context menu entry to lock / re-lock an unlocked
  BitLocker encrypted drive without the need to restart the Windows system.
tags:
  - bdelock
  - bde-lock
  - lock-bde
  - bde
  - bitlocker
  - relock
  - unlocked
  - windows
  - installer
  - lock drive
  - re-lock drive
  - encrypted
  - drive
  - download
  - installation
  - uninstallation
  - lock bitlocker encrypted drives
  - bitlocker drive locker
---

`bde-lock` - BitLocker drive locker - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock an unlocked BitLocker encrypted drive without the need to restart Windows

* [Download and Installation](#download-and-installation "Download and installation instructions")
* [Usage](#usage "Usage information and screenshot")
* [Uninstallation](#uninstallation "Uninstallation hints")

## Download and Installation

Get the [latest installer](https://github.com/dleidert/bde-lock/releases/latest "Link to the latest bde-lock installer release") and install it. The installation requires elevated permissions as Administrator.

## Usage

The installer will add a ([localized entry](./translation "Helping translate the bde-lock installer")) `Bitlocker Lock Drive` to the drive context menu. The function is only available for unlocked BitLocker encrypted drives except for the system drive.

**Caution:** Since release 0.0.5 the latter is hardcoded to the drive letter found by reading the `%SystemDrive%` environment variable during installation (since release 0.0.5). In earlier versions the system drive was wired to the drive letter `C:`. A more generic approach is currently on the todo list, see also issue [#1](https://github.com/dleidert/bde-lock/issues/1).

*image here*

## Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose to uninstall `Bitlocker Drive Locker` entry. This will cleanly remove all created or installed keys and files.

