---
layout: default
title: bde-lock
---

# Getting started

...

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | prepend: site.url }}">{{ post.title }}</a> <!-- {{ post.title | prepend: site.baseurl }} -->
    </li>
  {% endfor %}
</ul>

