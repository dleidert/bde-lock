---
layout: default
title: Windows registry-keys created by bde-lock
description: Description of all registry keys, which are created by the bde-lock installer to provide a drive context menu entry to lock an unlocked BitLocker encrypted drive
lang: en
---

# Windows registry-keys created by bde-lock

## Drive context menu function

### `HKCR\Drive\shell\bde-lock`

Entry | Type | Explanation | Value | Localized
------|------|-------------|-------|----------
(Default) | REG_SZ | Name of the context menu entry | [`Bitlocker Lock Drive`](/locale/en.nsh#L18) | yes
AppliesTo | REG_SZ | Rule, when the entry should be displayed | [`(System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5) AND NOT C:`](/bdelock.nsi#L77) | no
HasLUAShield | REG_SZ | Adds [UAC shield icon](https://docs.microsoft.com/en-us/windows/desktop/uxguide/winenv-uac#uac-shield-icon) to entry | *(empty)* | no
MultiSelectModel | REG_SZ | Specify the [selection model](https://docs.microsoft.com/en-us/windows/desktop/shell/how-to-employ-the-verb-selection-model) | `Single` | no

### `HKCR\Drive\shell\bde-lock\command`

Entry | Type | Explanation | Value | Localized
------|------|-------------|-------|----------
(Default) | REG_EXPAND_SZ | The command to run | `%SystemRoot%\System32\wscript.exe "%ProgramFiles%\bde-lock\bdelock.vbs" %1` | no
