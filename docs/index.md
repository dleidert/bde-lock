---
layout: page
shorttitle: Home
title: Lock unlocked BitLocker encrypted drives
description: >
  Documentation about bde-lock, a simple Windows installer to create a
  drive context menu entry to lock / re-lock an unlocked BitLocker
  encrypted drive without the need to restart Windows, and the registry
  keys and files it creates or installs
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
---

`bde-lock` - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock an unlocked BitLocker encrypted drive without the need to restart Windows

## Download and Installation

Get the [latest installer](https://github.com/dleidert/bde-lock/releases/latest) and install it. The installation requires elevated permissions as Administrator.

## Usage

The installer will add a ([localized](./translation)) string to the drive context menu function. The entry only appears for unlocked BitLocker encrypted drives except for the system drive. **Caution: The latter is currently hardcoded to the drive letter `C:` until a more generic approach is found. See also issue [#1](https://github.com/dleidert/bde-lock/issues/1).**

*image here*

## Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose to uninstall `Bitlocker Drive Locker`.
