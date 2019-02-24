---
layout: page
title: Debug page
sitemap: false
---

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

