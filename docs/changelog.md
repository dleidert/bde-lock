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

{%- assign releases = site.github.releases | where: "draft", false | sort: "tag_name" | reverse -%}
{%- assign drafts   = site.github.releases | where: "draft", true | sort: "tag_name" | reverse -%}

These are the latest versions of `bde-lock` which have been released. For a complete list of all releases and changes please visit {{ site.github.releases_url }}.

## [{% if drafts[0].name -%}{{ drafts[0].name }}{% else %}bdelock{%- endif %} UNRELEASED]({% if drafts[0].html_url -%}{{ drafts[0].html_url }}{%- else -%}{{ site.github.repository_url }}/tree/master/{%- endif %})

Unreleased [changes to last release]({{ site.github.repository_url }}/compare/{{ releases[0].tag_name }}...master#files_bucket "Compare changes in master for upcoming release"){% if drafts[0].name %} in upoming {{ drafts[0].name }} release{%- endif %}

{% if drafts[0].body -%}{{ drafts[0].body }}{%- endif %}

{% for release in releases limit:5 %}

## [{{ release.name }}]({{ release.html_url }}) {% if release.prerelease -%}(pre-release){%- endif %}

Released <time datetime="{{ release.published_at | date_to_xmlschema }}">{{ release.published_at | date_to_string }}</time>
{% unless release.tag_name == "v0.0.1" -%}
([compare changes to previous release]({{ site.github.repository_url }}/compare/{{ releases[forloop.index].tag_name }}...{{ release.tag_name }}#files_bucket "Compare changes between release versions {{ releases[forloop.index].tag_name }} and {{ release.tag_name }}"))
{%- endunless %}

{{ release.body }}

{% endfor %}
