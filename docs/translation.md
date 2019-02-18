---
layout: page
short_title: Translation
title: Helping translate the installer and context menu entry
description: >
  How to contribute translations to the bde-lock installer,
  which will appear in the context menu, the Windows control
  panel, the installer or the documentation
tags:
  - uninstall
  - uninstallation
  - deinstall
  - deinstalllation
  - i180n
  - l10n
  - internationalization
  - localization
  - translation
  - translate
  - language
  - documentation
---

The installer is localized. This means, that the installer itself, the context menu entry and the entry in the Windows control panel can be translated. This page tries to explain, how to contribute new translations, and to give some more context to the strings to translate.

## Add a new translation

To add a new translation, the file [`en.nsh`](https://github.com/dleidert/bde-lock/blob/master/locale/en.nsh) should be downloaded and then renamed to `new_langauge.nsh`. Because it is a simple text file, open the file with a text editor (the Windows text editor works fine) and work on your translation. Then send the file to me.

The file contains basically four different types of entries:

### LoadLanguageFile "${NSISDIR}\Contrib\Language files\\*language\_file*.nlf"

The [`LoadLanguageFile`](https://nsis.sourceforge.io/Reference/LoadLanguageFile) instruction is necessary to load the localized button and page texts of the installer itself. The language file (e.g. `English.nlf`) is provided by the [NSIS project](https://sourceforge.net/p/nsis/code/HEAD/tree/NSIS/trunk/Contrib/Language%20files). Checkout the link to find your language file and replace `English.nlf` with the one for your language.

For German the entry looks like this:

```
LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"
``` 

### LangString Name *language\_id* "*localized\_language\_name*"

[`LangString Name`](https://nsis.sourceforge.io/Reference/LangString) holds the **localized** name of the language. The variable `${LANG_ENGLISH}` is the language ID code for English, defined by the NSIS project. Every language has such a variable. So the language ID code variable needs to be adjusted for the language to be added. If you don't know the ID, just ignore it. I'll care about that.

For German the entry looks like this:

```
LangString Name ${LANG_GERMAN} "Deutsch"
```

### VIAddVersionKey /LANG=*language\_id* "*field*" "*value*"

The [`VIAddVersionKey`](https://nsis.sourceforge.io/Reference/VIAddVersionKey) instruction adds field values to the installer file properties. It also requires to be given the language ID as shown above. Please note, that you must not remove any field here, but not all fields require a translation. See the following table.

Field | Description | Value localized
------|-------------|----------------
`ProductName` | Name of bde-lock | no
`ProductVersion` | Version of bde-lock | no
`FileVersion` | Installer file version | no
`FileDescription` | Installer file description | **yes**
`Comment` | User-friendly comment about the installer | **yes**
`LegalCopyright` | Copyright information | no

So usually only `FileDescription` and `Comment` need to be changed for the translation.

### LangString *variable* *language\_id* "*localized\_text*"

The [`LangString`](https://nsis.sourceforge.io/Reference/LangString) instruction assigns a localized text to a variable. The language ID code defines the corresponding language, under which the variable content should be used. With one exception, all variables should be translated. The following table gives more context and explains, where the strings appear.

Variable | Description | Value localized
---------|-------------|----------------
`LicenseButtonText`   | Button text on the installers license page | yes
`LicenseHeaderText`   | Header text on the installers license page | yes
`MsgBitlockerError`   | Warning shown, if the installer cannot find the registry key, that indicates the presence of BitLocker during installation | yes
`MsgWindowsVersion`   | Warning shown, if the installer finds an unsupported Windows version | yes
`RegContextMenuEntry` | **entry shown in the drive context menu** | yes
`RegUninstallDispNam` | Program name shown in `System properties > Programs > Uninstall program` | yes
`RegUninstallComment` | Comment shown for the program in `System properties > Programs > Uninstall program` | yes
`RegUninstallReadme`  | The name and repository path of the localized (translated) version of [README.md](https://github.com/dleidert/bde-lock/blob/master/README.md) | (yes)
`UserLanguageId`      | Windows language ID (needs to be set correctly, but not translated) | **no**

The most important string is `RegContextMenuEntry`. It is the one shown in the drive context menu to lock the drive.

## Reporting a translation error

If you come across a translation issue, file a [new github issue](https://github.com/dleidert/bde-lock/issues/new).

# Translating the projects README.md

...
