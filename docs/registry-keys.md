---
layout: page
title: Windows registry-keys created by bde-lock
description: >
  Description of all registry keys, which are created by the bde-lock installer
  to provide a drive context menu entry to lock an unlocked BitLocker encrypted drive
tags:
  - registry
  - keys
  - windows
  - uninstaller
  - context menu
  - drive
---

This page is about the Windows registry-keys created by `bde-lock`.

## Drive context menu function

The following keys add an entry to the drive context menu and connect it with a command.

### `HKCR\Drive\shell\lock-bde`

Entry | Type | Explanation | Value | Localized
------|------|-------------|-------|----------
`(Default)` | `REG\_SZ` | Name of the context menu entry | [`Bitlocker Lock Drive`](/locale/en.nsh#L18) | yes
`AppliesTo` | `REG\_SZ` | Rule, when the entry should be displayed | [`(System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5) AND NOT C:`](/bdelock.nsi#L77) | no
`HasLUAShield` | `REG\_SZ` | Adds [UAC shield icon](https://docs.microsoft.com/en-us/windows/desktop/uxguide/winenv-uac#uac-shield-icon) to entry | *(empty)* | no
`MultiSelectModel` | `REG\_SZ` | Specify the [selection model](https://docs.microsoft.com/en-us/windows/desktop/shell/how-to-employ-the-verb-selection-model) | `Single` | no

### `HKCR\Drive\shell\lock-bde\command`

Entry | Type | Explanation | Value | Localized
------|------|-------------|-------|----------
`(Default)` | `REG\_EXPAND\_SZ` | The command to run | `%SystemRoot%\System32\wscript.exe "%ProgramFiles%\bde-lock\bdelock.vbs" %1` | no

## Uninstaller entry

The following keys are necessary for an entry in the `Control Panel > Programs > Uninstall program` panel.

### HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\bdelock

The entries below this key are explained [here](https://docs.microsoft.com/en-us/windows/desktop/msi/uninstall-registry-key). The entries `NoModify` and `NoRepair` are described [here](https://docs.microsoft.com/en-us/windows/desktop/msi/arpnomodify) and [here](https://docs.microsoft.com/en-us/windows/desktop/msi/arpnorepair). Some of the keys kan be localized.
