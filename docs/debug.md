---
layout: page
title: Debug page
sitemap: false
---

<!--
{{ site.github.latest_release.body | markdownify | jsonify }}
-->

<!--
{% assign releases = site.github.releases | limit 3 %}
{{ releases | inspect }}
-->

<!--
{% assign releases = site.github.releases | sort: "tag_name" | reverse %}
{% for release in releases limit:3 %}
{{ release.tag_name }} + {{ forloop.index }} + {{ releases[forloop.index].tag_name }}
{{ release.prerelease }}
{% if release.prerelease %}(pre-release){% endif %}
{% endfor %}

-->

<!--
{% assign foo = site.github.latest_release.assets | where: "content_type", "application/x-msdownload" %}
result: {{ foo[0].browser_download_url }}
-->

<!--
  {% assign asset = site.github.latest_release.assets %}
  inspect: {{ asset | inspect }}

  1 {{ asset[0] }}
  2 {{ asset['browser_download_url'] }}
  3 {{ site.github.latest_release['assets'].browser_download_url }}
  4 {{ asset[0].browser_download_url }}
  5 {{ site.github.latest_release.assets[0].browser_download_url }}
  6 {{ site.github.latest_release['assets'].browser_download_url }}

  url1: {{ asset.url }}, {{ asset.browser_download_url }}

  url2: {{ site.github.latest_release.assets.url }}, {{ site.github.latest_release.assets.browser_download_url }}

  {{ site.github.releases_url }}/download/latest/bdelock-{{ site.github.latest_release.tag_name | strip | | remove: "v" }}-setup.exe

  tag_name: {{ site.github.latest_release.tag_name }}

  inspect: {{ site.github | inspect }}

  license: {{ site.github.license.url }}
-->

