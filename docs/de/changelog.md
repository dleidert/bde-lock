---
layout: page
shorttitle: Aktuelles
title: Änderungshistorie und aktuelle Veröffentlichungen
description: Ausführliche Versionshistorie und Liste mit allen Änderungen für die
  veröffentlichten bde-lock Releases - inklusive Links, um die Änderungen am Quellcode
  zwischen den Veröffentlichungen darzustellen.
tags:
- änderungshistorie
- neuigkeiten
- änderungen
- bdelock
- lock-bde
- bde-lock
- veröffentlichung
- veröffentlichungen
- installationsdatei
---

{%- assign releases = site.github.releases | where: "draft", false | sort: "tag_name" | reverse -%}
{%- assign drafts   = site.github.releases | where: "draft", true | sort: "tag_name" | reverse -%}

Dies ist eine Übersicht der aktuell und zuletzt veröffentlichten Versionen von `bde-lock`. Eine vollständige Übersicht aller Releases und Änderungen findet sich unter {{ site.github.releases_url }}.

## [{% if drafts[0].name -%}{{ drafts[0].name }}{% else %}bdelock{%- endif %} NICHT VERÖFFENTLICHT]({% if drafts[0].html_url -%}{{ drafts[0].html_url }}{%- else -%}{{ site.github.repository_url }}/tree/master/{%- endif %})

Noch nicht veröffentlichte [Änderungen in master]({{ site.github.repository_url }}/compare/{{ releases[0].tag_name }}...master#files_bucket "Vergleiche Änderungen in master für den nächsten Release") für den bevorstehenden Release {% if drafts[0].name -%}von {{ drafts[0].name }}{%- endif %} release

{% if drafts[0].body -%}{{ drafts[0].body }}{%- endif %}

{% for release in releases limit:5 %}

## [{{ release.name }}]({{ release.html_url }}) {% if release.prerelease -%}(Beta-Version){%- endif %}

Veröffentlicht <time datetime="{{ release.published_at | date_to_xmlschema }}">{{ release.published_at | date_to_string }}</time>
{% unless release.tag_name == "v0.0.1" -%}
([Vergleiche Änderungen zur vorherigen Version]({{ site.github.repository_url }}/compare/{{ releases[forloop.index].tag_name }}...{{ release.tag_name }}#files_bucket "Vergleiche Änderungen zwischen den Versionen {{ releases[forloop.index].tag_name }} und {{ release.tag_name }}"))
{%- endunless %}

{{ release.body }}

{% endfor %}
