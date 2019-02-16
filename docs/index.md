---
layout: default
title: bde-lock project documentation pages
---

# bde-lock

`bde-lock` - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock and unlocked BitLocker encrypted drive

## About the project

In Windows a manually or automatically unlocked BitLocker encrypted drive stays unlocked until the system is restarted. This is not optimal for everybody, especially if the drive in question holds sensible data, which should only be unlocked for a specific event and then be locked afterwards again. For example: Some backup is stored on an encrypted drive. The drive gets unlocked to update the backup copy. As soon as the update is complete, there is no further need for this drive to stay unlocked.

For whatever reason Microsoft does not provide a drive context menu function to re-lock the drive. Many users therefor have asked Microsoft support or their fellow Windows users, how they can lock the drive without restarting the system. Several solutions have been suggested. First the tool required is [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) and is already installed on every Windows system providing BitLocker encryption. To make it easy for the user (any myself) I prefer a context menu entry (righ-click on the drive), which executes the necessary command, instead of desktop shortcut for specific drives or manually executing the tool via command or powershell. This entry requires to create some registry keys.

To make it easier for fellow Windows users I decided to create [the bde-lock installer](https://github.com/dleidert/bde-lock/releases/latest), which will create all [required registry keys for the context menu entry](./registry-keys) and install a [small script to perform the lock task with the required permissions](./manage-bde). The installer will also provide an uninstaller, which will remove all created registry keys and all installed files.

## Usage

The installer will add a ([localized](./translation)) string to the drive context menu function. The entry only appears for unlocked BitLocker encrypted drives except for the system drive. **Caution: The latter is currently hardcoded to the drive letter `C:` until a more generic approach is found. See also issue dleidert/bde-lock#1.**

*image here*

## Changelog

The latest changes of the [bde-lock installer](https://github.com/dleidert/bde-lock/releases/latest) can be found [here](./changelog).

## Download and Installation



## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

