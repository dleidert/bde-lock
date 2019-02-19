---
layout: page
shorttitle: Home
title: BitLocker Drive Locker - Lock unlocked BitLocker encrypted drives via drive context menu
description: >
  Documentation about the bde-lock project, a simple Windows installer, which adds
  'Bitlocker Lock drive' to the drive context menu entry to lock / re-lock an unlocked
  BitLocker encrypted drive without the need to restart the Windows system. The
  installer creates the necessary registry keys and installs a small script. If
  uninstalled, it will also remove all created and installed content.
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
---

`bde-lock` - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock an unlocked BitLocker encrypted drive without the need to restart Windows

* [Download and Installation](#download-and-installation "Download and installation instructions")
* [Usage](#usage "Usage information and screenshot")
* [Uninstallation](#uninstallation "Uninstallation hints")

## Download and Installation

Get the [latest installer](https://github.com/dleidert/bde-lock/releases/latest "Link to the latest bde-lock installer release") and install it. The installation requires elevated permissions as Administrator.

## Usage

The installer will add a ([localized](./translation "Helping translate the bde-lock installer")) string to the drive context menu function. The entry only appears for unlocked BitLocker encrypted drives except for the system drive. **Caution: The latter is currently hardcoded to the drive letter `C:` until a more generic approach is found. See also issue [#1](https://github.com/dleidert/bde-lock/issues/1).**

*image here*

## Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose to uninstall `Bitlocker Drive Locker`.

