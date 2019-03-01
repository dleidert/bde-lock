---
layout: page
shorttitle: Source
title: Getting and changing the source code
description: >
  The source code is hosted in a public repository on github.com. The installer
  uses the Nullsoft Scriptable Install System (NSIS) system and Windows scripting.
  All source files are isimple text files and can be easily edited.
tags:
  - github
  - clone
  - tarball
  - zipball
  - source
  - clone
  - download
extra_json:
  - softwaresourcecode.json
---

... coming soon ...

## Getting involved

These instructions are useful, if you plan to [download the source](#getting-the-source), [build the installer](#build-the-installer) yourself or [con
tribute](#contribute) to the project.

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

