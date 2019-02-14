[`English`](/README.md) | **`Deutsch`**

# bde-lock

Einfacher Installer, der im Laufwerks-Kontextmenü einen Eintrag erzeugt, um ein unter Windows mit Bitlocker geschütztes entsperrtes Laufwerk zu sperren 

  * [Über das Projekt](#über-das-projekt)
  * [Download](#download)
  * [Installation](#installation)
  * [Deinstallation](#deinstallation)
  * [Quellcode](#quellcode)
  * [Danksagung](#danksagung)
  
## Über das Projekt

Der Installer kopiert ein [Skript](/script/bdelock.vbs) in das Programm-Verzeichnis und erstellt den Registry-Schlüssel `HKCR/Drive/shell/lock-bde` (inklusive Unterschlüssel). Letzterer ist notwendig, um den Eintrag im Kontextmenü zu erzeugen, das bei einem Rechtsklick auf das entsperrte Laufwerk erscheint. Um das Laufwerk zu sperren, wird das Windows-Programm [`manage-bde.exe`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) mit erhöhten Rechten und dem Laufwerksbuchstaben aufgerufen. Um das zu erreichen, ist ein [(kleines) Skript](/script/bdelock.vbs) notwendig, dass einerseits den Backslash vom Laufwerkspfad entfernt (Beipiel: aus D:\ wird D:) und andererseits die Administratorrechte anfordert.

Der Installer beherrscht mehrere Sprachen. Momentan werden Deutsch und Englisch unterstützt. Weitere Sprachen hinzuzufügen, ist sehr einfach. Hierzu muss lediglich die Datei [`en.nsh`](/locale/en.nsh) kopiert, umbenannt, in einem Texteditor geöffnet, die einzelnen Passagen übersetzt und an mich [gemailt](https://github.com/dleidert/bde-lock/issues/new) werden.

## Download

Den [aktuellen Installer herunterladen](https://github.com/dleidert/bde-lock/releases/latest) und ausführen.

## Installation

In den Download-Ordner wechseln und den [aktuellen Installer](https://github.com/dleidert/bde-lock/releases/latest) ausführen. Da der Installer einen Registry-Schlüssel in `HKCR` erzeugt, werden für die Installation Administratorrechte benötigt. Eine Installation als Benutzer ist nicht möglich.

## Deinstallation

In Windows `Systemsteuerung > Programme > Programme deinstallieren` aufrufen. Dort befindet sich ein Eintrag `Bitlocker Drive Locker - Explorer Kontextmenüeintrag` (bzw. der abhängig von der Sprache des Betriebssystems lokalisierte Eintrag). `Deinstallieren` auswählen und alle erstellten Registry-Schlüssel und der Programmoderner werden entfernt.

## Quellcode

Der [komplette Quellcode](https://github.com/dleidert/bde-lock/tree/master) setzt sich aus Textdateien zusammen und ist menschenlesbar. Er besteht aus der [NSIS Installer-Skriptdatei](/bdelock.nsi) inklusive der [Übersetzungen](https://github.com/dleidert/bde-lock/tree/master/locale), Dokumentation und dem [Mantelskript für `manage-bde.exe`](/script/bdelock.vbs).

Der Installer kann einfach selbst erstellt werden. Dafür wird lediglich das aktuelle [Nullsoft Scriptable Install System (NSIS)](https://sourceforge.net/projects/nsis/files/latest/download) benötigt, mit dem die Datei [`bdelock.nsi`](/bdelock.nsi) kompiliert wird.

Selbst ohne genaue Kenntnis von NSIS- oder VBcript-Syntax sind die Quelldateien und was sie tun, gut zu verstehen.

## Danksagung

Ein spezieller Dank geht an Shawn Brink, der [dieses Howto inklusive eines Skripts](http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html) veröffentlicht hat.

<details>
  <summary>Mehr ...</summary>
Es gibt viele weitere Blog- und Foreneinträge, die sich mit dem Thema beschäftigen. Die populärsten sind vermutlich


* https://social.technet.microsoft.com/Forums/windows/en-US/41607938-7452-440d-8253-67fe8657bc0f/how-to-relock-a-drive-with-bitlocker?forum=w7itprosecurity
* https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/hot-to-lock-the-bitlocker-encrypted-drive-without/6ae82827-38ee-46dc-93d2-f5d2888324c2
</details>
