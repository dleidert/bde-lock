---
layout: default
title: Start
description: Documentation about bde-lock, a simple Windows installer to create a drive context menu entry to lock and unlocked BitLocker encrypted drive, and the registry keys it creates and the files it installs
---

# bde-lock

`bde-lock` - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock and unlocked BitLocker encrypted drive

## Download and Installation

Get the [latest installer](https://github.com/dleidert/bde-lock/releases/latest) and install it. The installation requires elevated permissions as Administrator.

## Usage

The installer will add a ([localized](./translation)) string to the drive context menu function. The entry only appears for unlocked BitLocker encrypted drives except for the system drive. **Caution: The latter is currently hardcoded to the drive letter `C:` until a more generic approach is found. See also issue [#1](https://github.com/dleidert/bde-lock/issues/1).**

*image here*

## Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose the uninstall `Bitlocker Drive Locker`.

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

