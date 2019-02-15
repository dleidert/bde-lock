---
layout: default
title: bde-lock
---

# Getting started

...

## Changelog

The latest changes can be found [here](./changelog.html).

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

