---
layout: default
title: bde-lock
external_site: foo
---

# Getting started

...

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="/bde-lock/{{ post.url }}">{{ post.title }}</a> <!-- {{ post.title | prepend: site.baseurl | prepend: site.url }} -->
    </li>
  {% endfor %}
</ul>

