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
(Default) | REG_SZ | Name of the context menu entry | [Bitlocker Lock Drive](/locale/en.nsh#L18) | yes

### `HKCR\Drive\shell\bde-lock\command`

Entry | Type | Explanation | Value | Localized
------|------|-------------|-------|----------
AppliesTo | REG_SZ | Rule, when the entry should be displayed | [(System.Volume.BitLocker...) AND NOT C:](/bdelock.nsi#L77) | no
HasLUAShield | REG_SZ | Adds UAC shield icon to entry | (empty) | no
MultiSelectModel | REG_SZ | Specify the selection model (here single) | Single | no
