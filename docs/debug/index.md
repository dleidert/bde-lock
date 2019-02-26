---
layout: page
title: Debug page
sitemap: false
---

## Useful links

* Google SC
    * <https://support.google.com/webmasters/answer/2650907?hl=de>
    * <https://search.google.com/structured-data/testing-tool#url=https%3A%2F%2Fdleidert.github.io%2Fbde-lock%2F>
    * <https://search.google.com/structured-data/testing-tool#>
    * <https://developers.google.com/search/docs/guides/prototype#new-page>
    * <https://developers.google.com/search/docs/data-types/article>
    * <https://developers.google.com/custom-search/docs/structured_data>
* JSON-LD
    * <https://jsonld.com/blog-post/>
    * <https://schema.org/>
* Jekyll + Liquid
    * <https://shopify.github.io/liquid/tags/control-flow/>
    * <https://jekyllrb.com/docs/liquid/filters/>
* GitHub
    * <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml>

## Download link

{% assign foo = site.github.latest_release.assets | where: "content_type", "application/x-msdownload" -%}
<{{ foo[0].browser_download_url }}>

## Debug `releases` content

{%- assign releases = site.github.releases | where: "draft", true | sort: "tag_name" | reverse -%}
```JSON
{{ releases | neat_json }}
```

## Debug `site.github` content

<!-- show site.github -->
```JSON
{{ site.github | neat_json }}
```
