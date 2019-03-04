[`English`](/docs/README.md) | **`Deutsch`**

# [bde-lock](https://dleidert.github.io/bde-lock)

Einfacher Installer, der im Laufwerks-Kontextmenü einen Eintrag erzeugt, um ein unter Windows mit Bitlocker geschütztes entsperrtes Laufwerk zu sperren

[![Aktuelle bde-lock Version](https://img.shields.io/github/release/dleidert/bde-lock.svg)][url.release]
[![bde-lock Veröffentlichungsdatum](https://img.shields.io/github/release-date/dleidert/bde-lock.svg)][url.release]
[![bde-lock Lizenzinformation](https://img.shields.io/github/license/dleidert/bde-lock.svg)][url.license]
![GitHub meistgenutzte Top-Programmiersprache für bde-lock](https://img.shields.io/github/languages/top/dleidert/bde-lock.svg)
[![Baustatus auf appveyor.com](https://img.shields.io/appveyor/ci/dleidert/bde-lock/master.svg)][url.appveyor]
[![Baustatus auf travis-ci.org](https://img.shields.io/travis/dleidert/bde-lock/master.svg)][url.travisci]
[![Downloadzähler für github.com](https://img.shields.io/github/downloads/dleidert/bde-lock/total.svg)][url.download]

[url.release]: https://github.com/dleidert/bde-lock/releases/latest/
[url.license]: https://raw.githubusercontent.com/dleidert/bde-lock/master/LICENSE
[url.appveyor]: https://ci.appveyor.com/project/dleidert/bde-lock
[url.travisci]: https://travis-ci.org/dleidert/bde-lock
[url.download]: https://github.com/dleidert/bde-lock/releases/

  * [Über das Projekt](#über-das-projekt)
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

## Über das Projekt

Der Installer kopiert ein [Skript](/script/bdelock.vbs) in das Programm-Verzeichnis und erstellt den Registry-Schlüssel `HKCR/Drive/shell/lock-bde` (inklusive Unterschlüssel). Letzterer ist notwendig, um den Eintrag im Kontextmenü zu erzeugen, das bei einem Rechtsklick auf das entsperrte Laufwerk erscheint. Um das Laufwerk zu sperren, wird das Windows-Programm [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) mit erhöhten Rechten und dem Laufwerksbuchstaben aufgerufen. Um das zu erreichen, ist ein [(kleines) Skript](/script/bdelock.vbs) notwendig, dass einerseits den Backslash vom Laufwerkspfad entfernt (Beipiel: aus D:\ wird D:) und andererseits die Administratorrechte anfordert.

Der Installer beherrscht mehrere Sprachen. Momentan werden Deutsch und Englisch unterstützt. Weitere Sprachen hinzuzufügen, ist sehr einfach. Hierzu muss lediglich die Datei [`en.nsh`](/locale/en.nsh) kopiert, umbenannt, in einem Texteditor geöffnet, die einzelnen Passagen übersetzt und an mich [gemailt](https://github.com/dleidert/bde-lock/issues/new) werden.

## Getting started

These instructions will get you a [copy of the installer](#download) and contain [installation](#installation), [usage](#usage) and [uninstalling](#uninstallation) notes.

### Download

Den [aktuellen Installer herunterladen](https://github.com/dleidert/bde-lock/releases/latest) und ausführen.

### Installation

In den Download-Ordner wechseln und den [aktuellen Installer](https://github.com/dleidert/bde-lock/releases/latest) ausführen. Da der Installer einen Registry-Schlüssel in `HKCR` erzeugt, werden für die Installation Administratorrechte benötigt. Eine Installation als Benutzer ist nicht möglich.

### Usage

The installer adds a localized entry called `BitLocker Lock Drive` to the drive context menu, which appears after a right-click on the drive. The entry will be there, if the drive is encrypted with BitLocker and unlocked and if it is **not** the system drive. If your language is supported by the installer, the entry has been translated.

### Deinstallation

In Windows `Systemsteuerung > Programme > Programme deinstallieren` aufrufen. Dort befindet sich ein Eintrag `Bitlocker Drive Locker - Explorer Kontextmenüeintrag` (bzw. der abhängig von der Sprache des Betriebssystems lokalisierte Eintrag). `Deinstallieren` auswählen und alle erstellten Registry-Schlüssel und der Programmoderner werden entfernt.

## Getting involved

Der [komplette Quellcode](https://github.com/dleidert/bde-lock/tree/master) setzt sich aus Textdateien zusammen und ist menschenlesbar. Er besteht aus der [NSIS Installer-Skriptdatei](/bdelock.nsi) inklusive der [Übersetzungen](https://github.com/dleidert/bde-lock/tree/master/locale), Dokumentation und dem [Mantelskript für `manage-bde.exe`](/script/bdelock.vbs).

Der Installer kann einfach selbst erstellt werden. Dafür wird lediglich das aktuelle [Nullsoft Scriptable Install System (NSIS)](https://sourceforge.net/projects/nsis/files/latest/download) benötigt, mit dem die Datei [`bdelock.nsi`](/bdelock.nsi) kompiliert wird.

Selbst ohne genaue Kenntnis von NSIS- oder VBcript-Syntax sind die Quelldateien und was sie tun, gut zu verstehen.

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

## Danksagung

Ein spezieller Dank geht an Shawn Brink, der [dieses Howto inklusive eines Skripts](http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html) veröffentlicht hat.

<details>
  <summary>Mehr ...</summary>
Es gibt viele weitere Blog- und Foreneinträge, die sich mit dem Thema beschäftigen. Die populärsten sind vermutlich


* <https://social.technet.microsoft.com/Forums/windows/en-US/41607938-7452-440d-8253-67fe8657bc0f/how-to-relock-a-drive-with-bitlocker?forum=w7itprosecurity>
* <https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/hot-to-lock-the-bitlocker-encrypted-drive-without/6ae82827-38ee-46dc-93d2-f5d2888324c2>
</details>
