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
![GitHub top language for bde-lock](https://img.shields.io/github/languages/top/dleidert/bde-lock.svg)
[![build status on appveyor.com](https://img.shields.io/appveyor/ci/dleidert/bde-lock/master.svg?label=appveyor%20ci)][url.appveyor]
[![build status on travis-ci.org](https://img.shields.io/travis/dleidert/bde-lock/master.svg?label=travis%20ci)][url.travisci]
[![download count on github.com](https://img.shields.io/github/downloads/dleidert/bde-lock/total.svg)][url.download]

[url.release]: https://github.com/dleidert/bde-lock/releases/latest/ "Check out the last bde-lock release"
[url.license]: https://raw.githubusercontent.com/dleidert/bde-lock/master/LICENSE "Check out the license of the bde-lock project"
[url.appveyor]: https://ci.appveyor.com/project/dleidert/bde-lock "Check out the AppVeyor CI build status for bde-lock"
[url.travisci]: https://travis-ci.org/dleidert/bde-lock "Check out the TRAVIS CI build status bde-lock"
[url.download]: https://github.com/dleidert/bde-lock/releases/ "Check out the bde-lock release page"

* [About the project](#about "About the bde-lock project")
* [Getting started](#getting-started)
    * [Download](#download "Getting the bde-lock installer")
    * [Installation](#installation "Install bde-lock")
        * [Supported Windows versions](#supported-windows-versions "Read the list of supported Windows versions")
        * [Supported languages](#supported-languages "Read more about language support")
    * [Usage](#usage "Usage information and screenshot")
    * [Uninstallation](#uninstallation "Uninstallation hints")
* [Getting involved](# "")
* [Authors](# "")
* [License](# "")
* [Acknowledgments](# "")

## About the project

Recent Windows versions since Windows Vista ship an onboard solution [BitLocker](https://en.wikipedia.org/wiki/BitLocker) to encrypt drives. Unfrtunately a manually or automatically unlocked BitLocker encrypted drive stays unlocked until the system is restarted. This is not optimal for everybody, especially if the drive in question holds sensible data, which should only be unlocked for a specific event and then be locked afterwards again. For example: Some backup is stored on an encrypted drive. The drive gets unlocked to update the backup copy. As soon as the update is complete, there is no further need for this drive to stay unlocked.

Microsoft does not provide a drive context menu function to re-lock the drive. Many users therefor have asked Microsoft support or their fellow Windows users, how they can lock the drive without restarting the system. Typical questions are:

> How to lock / re-lock the Bitlocker encrypted drive without restarting the system?

> How to re-lock a drive with bitlocker?

> How to add a lock feature to (the context menu for) Windows bitlocker encrypted drives?

Several solutions have been suggested, using the command shell or tasks or adding shortcuts or context menu entries. All solutions rely on the tool [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde), which is already installed on every Windows system providing BitLocker encryption. I prefer a context menu entry (righ-click on the drive), which executes the necessary command, instead of a desktop shortcut or task. Such an entry can be created by adding some keys to the Windows regstry.

To make it easier for fellow Windows users I decided to create [the bde-lock installer](#download-and-installation), which will create all [required registry keys for the context menu entry](./registry-keys) and install a [small script to perform the lock task with the required permissions](./manage-bde). The installer will also provide an [uninstaller](#uninstallation), which will remove all created registry keys and all installed files.

## Getting started

These instructions will get you a [copy of the installer](#download) and contain [installation](#installation), [usage](#usage) and [uninstallation](#uninstallation) notes.

### Download

{% assign current = site.github.latest_release -%}

[Download the current release {{ current.name }}]({{ current.assets[0].browser_download_url }} "Download the current installer release {{ current.assets[0].name }}"), published on <time datetime="{{ current.published_at | date_to_xmlschema }}">{{ current.published_at | date_to_string }}</time>:

{{ current.body }}

The latest release can always be found [here]({{ site.github.release_url }}/latest/). For a complete changelog either visit the [News page](./changelog) or the [projects release site]({{ site.github.releases_url }}).

### Installation

For installation execute the [downloaded file](#download). _Please note, that the installation requires elevated permissions as Administrator!_

#### Supported Windows versions

The installer can be used on all Windows versions providing BitLocker: Windows Vista, Windows 7, Windows 8 / 8.1 and Windows 10.

#### Supported languages

Currently English and German are supported, but [adding translations is quite easy](./translation).

### Usage

The installer will add a ([localized entry like `Bitlocker Lock Drive`](./translation "Helping translate the bde-lock installer")) to the drive context menu, which appears for a right-click on the drive. The function is only available for unlocked BitLocker encrypted drives except for the system drive.

**Note:** The system drive letter is hardcoded in the `AppliesTo` value in [registry key `HKCR\Drive\shell\lock-bde`]((./registry-keys#hkcrdriveshelllock-bde)). Since release 0.0.5 the installer gets the system drive letter from reading the `%SystemDrive%` environment variable during installation. In earlier versions the system drive was assumed to be drive `C:`.

*image here*

### Uninstallation

Go to the Windows `Control panel > Programs > Uninstall program` and choose to uninstall `Bitlocker Drive Locker` entry. This will remove all created or installed keys and files.

## Getting involved

Please read [this page](./source), if you want to download the source, build the installer from scratch or get involved in the development of the installer.

## Authors

* Daniel Leidert - Initial work - [site.github.owner_name]({{ site.github.owner_url }})

## License

The project is licensed under the _Unlicense_ license. For a complete copy please read <{{ site.github-license.url }}>.

## Acknowledgments


