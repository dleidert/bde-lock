**`English`** | [`Deutsch`](/docs/de/README.md)

# [bde-lock](https://dleidert.github.io/bde-lock)

Simple installer to create a drive context menu function to lock an unlocked bitlocker encrypted drive in Windows

  * [About the project](#about-the-project)
  * [Download](#download)
  * [Installation](#installation)
  * [Uninstallation](#uninstallation)
  * [Source](#source)
  * [Credits](#credits)

## About the project

The installer copies a [script](/script/bdelock.vbs) to the programs folder and creates the registry key (including sub-keys) in `HKCR/Drive/shell/lock-bde`. The latter basically adds the context menu entry if you right-click on an unlocked drive. For the lock function to work, the Windows program [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) needs to be called with elevated rights and it needs to be given the drive letter. Because it is not possible to achieve both things by calling the program from the registry, the [(short) script](/script/bdelock.vbs) is necessary, which strips the trailing backslash from the drive path (e.g. D:\ becomes D:) and requests the elevated rights.

The installer is localized, supporting German and English at the moment. Adding new languages is very easy. Just download/copy the file [`en.nsh`](/locale/en.nsh), rename it, open it in a text editor, translate the strings and [send](https://github.com/dleidert/bde-lock/issues/new) the file to me.

## Download

[Download the latest installer](https://github.com/dleidert/bde-lock/releases/latest) and execute it.

## Installation

Go to your download folder and execute the [latest installer](https://github.com/dleidert/bde-lock/releases/latest). Because it creates the drive context menu via registry keys in `HKCR`, the installation requires elevated permissions, so it cannot be installed as a user.

## Uninstallation

Go to the Windows `Control Panel > Programs > Uninstall a program`. There you will find it as `Bitlocker Drive Locker - Explorer Context Menu Entry` (or its localized string). Select `Uninstall` and all created registry keys and folders will be removed.

## Source

The [complete source](https://github.com/dleidert/bde-lock/tree/master) is assembled from text files and is human readable. It basically consists of the [main NSIS installer script file](/bdelock.nsi) including the [translations](https://github.com/dleidert/bde-lock/tree/master/locale), some documentation and the [wrapper script for `manage-bde.exe`](/script/bdelock.vbs).

The installer can be created by downloading and installing the latest [Nullsoft Scriptable Install System (NSIS)](https://sourceforge.net/projects/nsis/files/latest/download) and using it to compile [`bdelock.nsi`](/bdelock.nsi).

Even without knowing the detailed NSIS or VBscript syntax, you should be able to understand the source files.

## Credits

Special credits go to Shawn Brink, who published [this howto including a vbscript](http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html).

<details>
  <summary>More resources ...</summary>
There are more resources to look at. The most popular ones are probably


* https://social.technet.microsoft.com/Forums/windows/en-US/41607938-7452-440d-8253-67fe8657bc0f/how-to-relock-a-drive-with-bitlocker?forum=w7itprosecurity
* https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/hot-to-lock-the-bitlocker-encrypted-drive-without/6ae82827-38ee-46dc-93d2-f5d2888324c2
</details>
