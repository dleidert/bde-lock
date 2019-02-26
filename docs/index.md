---
layout: page
shorttitle: Home
title:  Lock unlocked BitLocker encrypted drives via context menu
description: >
  bde-lock is a simple Windows installer, which adds a 'Bitlocker Lock drive'
  function to the drive context menu entry to lock / re-lock an unlocked
  BitLocker encrypted drive without the requirement to restart the Windows system.
tags:
  - lock bitlocker encrypted drives
  - bitlocker drive locker
  - bdelock
  - bde-lock
  - lock-bde
  - bde
  - manage-bde
  - manage-bde.exe
  - bitlocker
  - relock
  - unlocked
  - windows
  - installer
  - lock drive
  - relock drive
  - encrypted
  - drive
  - download
  - installation
  - uninstallation
extra_json:
  - softwareapplication.json
---

`bde-lock` - BitLocker drive locker - simple [Windows installer](https://github.com/dleidert/bde-lock/releases/latest) to create a drive context menu entry to lock an unlocked BitLocker encrypted drive without the need to restart Windows

[![current bde-lock version](https://img.shields.io/github/release/dleidert/bde-lock.svg)][url.release]
[![current bde-lock release date](https://img.shields.io/github/release-date/dleidert/bde-lock.svg)][url.release]
[![bde-lock project license](https://img.shields.io/github/license/dleidert/bde-lock.svg)][url.license]
[![build status on appveyor.com](https://img.shields.io/appveyor/ci/dleidert/bde-lock/master.svg?label=AppVeyour%20CI)][url.appveyor]
[![build status on travis-ci.org](https://img.shields.io/travis/dleidert/bde-lock/master.svg?label=TRAVIS%20CI)][url.travisci]
[![download count on github.com](https://img.shields.io/github/downloads/dleidert/bde-lock/total.svg)][url.download]

[url.release]: https://github.com/dleidert/bde-lock/releases/latest/
[url.license]: https://raw.githubusercontent.com/dleidert/bde-lock/master/LICENSE
[url.appveyor]: https://ci.appveyor.com/project/dleidert/bde-lock
[url.travisci]: https://travis-ci.org/dleidert/bde-lock
[url.download]: https://github.com/dleidert/bdelock/releases/

* [About the project](#about "About the bde-lock project")
* [Download and Installation](#download-and-installation "Download and installation instructions")
    * [Supported Windows versions](#supported-windows-versions)
    * [Supported languages](#supported-languages)
* [Usage](#usage "Usage information and screenshot")
* [Uninstallation](#uninstallation "Uninstallation hints")

## About the project

In Windows a manually or automatically unlocked BitLocker encrypted drive stays unlocked until the system is restarted. This is not optimal for everybody, especially if the drive in question holds sensible data, which should only be unlocked for a specific event and then be locked afterwards again. For example: Some backup is stored on an encrypted drive. The drive gets unlocked to update the backup copy. As soon as the update is complete, there is no further need for this drive to stay unlocked.

For whatever reason Microsoft does not provide a drive context menu function to re-lock the drive. Many users therefor have asked Microsoft support or their fellow Windows users, how they can lock the drive without restarting the system. Typical questions are:

> How to lock / re-lock the Bitlocker encrypted drive without restarting the system?

> How to re-lock a drive with bitlocker?

> How to add a lock feature to Windows bitlocker encrypted drives?

Several solutions have been suggested, using the command shell or tasks or adding shortcuts or context menu entries. All solutions rely on the tool [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde), which is already installed on every Windows system providing BitLocker encryption. Further I prefer a context menu entry (righ-click on the drive), which executes the necessary command, instead of a desktop shortcut or task. The entry can be created by adding some keys to the Windows regstry.

To make it easier for fellow Windows users I decided to create [the bde-lock installer]({{ site.github.releases_url }}/latest), which will create all [required registry keys for the context menu entry](./registry-keys) and install a [small script to perform the lock task with the required permissions](./manage-bde). The installer will also provide an uninstaller, which will remove all created registry keys and all installed files.

## Download and Installation

{% assign current = site.github.latest_release -%}

[Download the installer]({{ current.assets[0].browser_download_url }} "Download the latest released bde-lock installer {{ current.assets[0].name }}") and execute it. _The installation requires elevated permissions as Administrator!_ The current release is [{{ current.name }}]({{ current.html_url }}) published on <time datetime="{{ current.published_at | date_to_xmlschema }}">{{ current.published_at | date_to_string }}</time>.

{{ current.body }}

For a more complete changelog either visit the [News page](./changelog) or the [projects release site]({{ site.github.releases_url }}).

### Supported Windows versions

The installer can be used on all Windows versions providing BitLocker: Windows Vista, Windows 7, Windows 8 / 8.1 and Windows 10.

### Supported languages

Currently English and German are supported, but [adding translations is quite easy](./translation).

## Usage

The installer will add a ([localized entry](./translation "Helping translate the bde-lock installer")) `Bitlocker Lock Drive` to the drive context menu. The function is only available for unlocked BitLocker encrypted drives except for the system drive.

**Caution:** Since release 0.0.5 the system drive letter is hardcoded in the [registry](./registry-keys#hkcrdriveshelllock-bde) to the drive letter found by reading the `%SystemDrive%` environment variable during installation. In earlier versions the system drive was wired to the drive letter `C:`. A more generic approach is currently on the todo list, see also issue [#1]({{ site.github.issues_url }}/1).

*image here*

## Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose to uninstall `Bitlocker Drive Locker` entry. This will cleanly remove all created or installed keys and files.

