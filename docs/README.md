**`English`** | [`Deutsch`](/docs/de/README.md)

# [bde-lock](https://dleidert.github.io/bde-lock)

Simple installer to create a drive context menu function to lock an unlocked BitLocker encrypted drive in Windows

[![current bde-lock version](https://img.shields.io/github/release/dleidert/bde-lock.svg)][url.release]
[![current bde-lock release date](https://img.shields.io/github/release-date/dleidert/bde-lock.svg)][url.release]
[![bde-lock project license](https://img.shields.io/github/license/dleidert/bde-lock.svg)][url.license]
![GitHub top language for bde-lock](https://img.shields.io/github/languages/top/dleidert/bde-lock.svg)
[![build status on appveyor.com](https://img.shields.io/appveyor/ci/dleidert/bde-lock/master.svg)][url.appveyor]
[![build status on travis-ci.org](https://img.shields.io/travis/dleidert/bde-lock/master.svg)][url.travisci]
[![download count on github.com](https://img.shields.io/github/downloads/dleidert/bde-lock/total.svg)][url.download]

[url.release]: https://github.com/dleidert/bde-lock/releases/latest/
[url.license]: https://raw.githubusercontent.com/dleidert/bde-lock/master/LICENSE
[url.appveyor]: https://ci.appveyor.com/project/dleidert/bde-lock
[url.travisci]: https://travis-ci.org/dleidert/bde-lock
[url.download]: https://github.com/dleidert/bde-lock/releases/

  * [About the project](#about-the-project)
  * [Getting started](#getting-started)
    * [Download](#download)
    * [Installation](#installation)
    * [Uninstallation](#uninstallation)
  * [Getting involved](#getting-involved)
    * [Getting the source](#getting-the-source)
    * [Build the installer](#build-the-installer)
    * [Contribute](#contribute)
  * [License](#license)
  * [Credits](#credits)

## About the project

The installer creates an entry in the drive context menu to lock an unlocked BitLocker encrypted drive. During installation it copies a [script](/script/bdelock.vbs) to the Windows programs folder and creates the registry key (including sub-keys) `HKCR/Drive/shell/lock-bde`. The latter basically adds the context menu entry if you right-click on an unlocked drive. For the lock function to work, the Windows program [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) needs to be called with elevated rights and it needs to be given the drive letter. Because it is not possible to achieve both things by calling the program from the registry, the [(short) script](/script/bdelock.vbs) is necessary, which strips the trailing backslash from the drive path (e.g. D:\ becomes D:) and requests the elevated rights.

The installer is localized, supporting German and English at the moment. Adding new languages is very easy. Just download/copy the file [`en.nsh`](/locale/en.nsh), rename it, open it in a text editor, translate the strings and [send](https://github.com/dleidert/bde-lock/issues/new) the file to me.

## Getting started

These instructions will get you a [copy of the installer](#download) and contain [installation](#installation), [usage](#usage) and [uninstalling](#uninstallation) notes.

### Download

[Download the latest installer](https://github.com/dleidert/bde-lock/releases/latest) and execute it.

### Installation

Go to the download folder and execute the [downloaded](#download) file. Because it creates the drive context menu via registry keys in `HKCR`, the installation requires elevated permissions, so it cannot be installed as a user.

### Usage

The installer adds a localized entry called `BitLocker Lock Drive` to the drive context menu, which appears after a right-click on the drive. The entry will be there, if the drive is encrypted with BitLocker and unlocked and if it is **not** the system drive. If your language is supported by the installer, the entry has been translated.

### Uninstallation

The installer adds an entry `BitLocker Drive Locker - Explorer Context Menu Entry` (or its localized string) to Windows `Control Panel > Programs > Uninstall a program`. Selecting `Uninstall` for it will delete and remove all created registry keys and folders.

## Getting involved

These instructions are useful, if you plan to [download the source](#getting-the-source), [build the installer](#build-the-installer) yourself or [contribute](#contribute) to the project.

The project source is [hosted on github](https://github.com/dleidert/bde-lock/tree/master). It is assembled from text files and therefor is human readable. It basically consists of the [main NSIS installer script file `bdelock.nsi`](/bdelock.nsi) including the [translations](https://github.com/dleidert/bde-lock/tree/master/locale), some documentation and the [wrapper script `bdelock.vbs`](/script/bdelock.vbs).

### Getting the source

The easiest way is to clone the repository from

```
https://github.com/dleidert/bde-lock.git
```

The most recent source can further be obtained as [tarball](https://github.com/dleidert/bde-lock/tarball/master) and [zip archive](https://github.com/dleidert/bde-lock/archive/tarball). On the [release page](https://github.com/dleidert/bde-lock/releases/) there are also source archives for every release.

### Build the installer

Install [NSIS](https://nsis.sourceforge.io/) on Windows. Then either set `makensis.exe` to be the default application to open `.nsi` files, or open the graphical user interface and load [`bdelock.nsi`](/bdelock.nsi) or execute the following command:

```Shell
makensis.exe /V3 bdelock.nsi
```

On Linux systems install the NSIS packages too. E.g. on Debian GNU/Linux execute:

```Shell
$ apt-get install nsis
$ makensis -V3 bdelock.nsi
```

### Contribute

You can fork the project from [github](https://github.com/dleidert/bde-lock/), make your changes and [open a pull request](https://github.com/dleidert/bde-lock/compare). Or you can easily participate in helping to translate the installer by following the instructions [here](https://dleidert.github.io/bde-lock/translation).

[![Support via PayPal](https://cdn.rawgit.com/twolfson/paypal-github-button/1.0.0/dist/button.svg)](https://www.paypal.me/dleidert/)

## License

The project is released under the [UNLICENSE](/LICENSE) license into the public domain.

## Credits

Special credits go to Shawn Brink, who published [this howto including a vbscript](http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html).

<details>
  <summary>More resources ...</summary>
There are more resources to look at. The most popular ones are probably


* <https://social.technet.microsoft.com/Forums/windows/en-US/41607938-7452-440d-8253-67fe8657bc0f/how-to-relock-a-drive-with-bitlocker?forum=w7itprosecurity>
* <https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/hot-to-lock-the-bitlocker-encrypted-drive-without/6ae82827-38ee-46dc-93d2-f5d2888324c2>
</details>

