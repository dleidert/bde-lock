---
layout: page
shorttitle: News
title: Changelog and Release News
description: >
  Detailed changelog and news for the various bde-lock releases including
  links to compare the code differences between the last seven released
  installer versions.
tags:
  - changelog
  - news
  - changes
  - bdelock
  - lock-bde
  - bde-lock
  - release
  - releases
  - installer
---

{%- assign releases = site.github.releases | sort: "tag_name" | reverse -%}

These are the latest versions of `bde-lock` which have been released. For a complete list of all releases and changes please visit {{ site.github.releases_url }}.

## [bdelock UNRELEASED]({{ site.github.repository_url }}/tree/master/)

<time>Unreleased</time> ([compare changes to last release](https://github.com/dleidert/bde-lock/compare/{{ releases[0].tag_name }}...master#files_bucket "Compare changes in master for upcoming release"))

* Determine system drive letter during installation
* 

{% for release in releases limit:3 %}

## [{{ release.name }}]({{ release.html_url }})

Released <time datetime="{{ release.published_at }}">{{ release.published_at | date_to_string }}</time>
{% unless forloop.last -%}
([compare changes to previous release](https://github.com/dleidert/bde-lock/compare/{{ releases[forloop.index].tag_name }}...{{ release.tag_name }}#files_bucket "Compare changes between release versions {{ releases[forloop.index].tag_name }} and {{ release.tag_name }}"))
{%- endunless %}

{{ release.body }}

{% endfor %}



## [bdelock 0.0.4](https://github.com/dleidert/bde-lock/releases/tag/v0.0.4)

Released <time datetime="2019-02-17">Feb. 19th 2019</time> ([compare changes to previous release](https://github.com/dleidert/bde-lock/compare/v0.0.3...v0.0.4#files_bucket "Compare changes between release versions 0.0.3 and 0.0.4"))

* **Fix removal of Uninstall registry key**
* Let the installer calculate the estimated installation size
* Documentation has been added at https://dleidert.github.io/bde-lock/ using [GitHub Pages and Jekyll](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)

## [bdelock 0.0.3](https://github.com/dleidert/bde-lock/releases/tag/v0.0.3)

Released <time datetime="2019-02-14">Feb. 14th 2019</time> ([compare changes to previous release](https://github.com/dleidert/bde-lock/compare/v0.0.2...v0.0.3#files_bucket "Compare changes between release versions 0.0.2 and 0.0.3"))

* Added Changelog
* Changed source file encoding to UTF-8
* public-domain.txt renamed to LICENSE and clarified
* Improved documentation including link fixes
* Localized README added for German

## [bdelock 0.0.2](https://github.com/dleidert/bde-lock/releases/tag/v0.0.2)

Released  <time datetime="2019-02-09">Feb. 9th 2019</time> ([compare changes to previous release](https://github.com/dleidert/bde-lock/compare/v0.0.1...v0.0.2 "Compare changes between release versions 0.0.1 and 0.0.2"))

This is still a beta version. The installer internals and localizations have been polished. Further the installer now tests for the Windows version and the presence of Bitlocker. Please report any issues.

* Add check for Windows version
* Add check, if BitLocker registry key is present
* Minor localization improvements

## <time datetime="2019-02-09">Feb. 9th 2019</time> [bdelock 0.0.1](https://github.com/dleidert/bde-lock/releases/tag/v0.0.1)

This is a first beta release. This is untested on Windows Vista, 7 and 8 (32 and 64 bit)  and Windows 10 (32 bit) due to the lack of these operating systems. Please report any issues you find.
