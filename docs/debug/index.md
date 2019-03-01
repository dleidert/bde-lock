---
layout: page
title: Debug page
sitemap: false
extra_json:
  - softwareapplication.json
  - softwaresourcecode.json
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
    * <https://github.com/18F/open-source-guide/blob/18f-pages/pages/making-readmes-readable.md>
    * <https://gist.github.com/PurpleBooth/109311bb0361f32d87a2>
* NSIS
    * <https://stackoverflow.com/questions/10581570/setting-the-uac-publisher-field-for-a-nsis-installer>
    * <https://docs.microsoft.com/en-us/windows/desktop/seccrypto/makecert>
    * <https://docs.microsoft.com/en-us/previous-versions/bb756995(v=msdn.10)>
    * <https://nsis.sourceforge.io/Detect_Drives>
    * <https://nsis.sourceforge.io/GetDrives>
    * <https://nsis.sourceforge.io/Adding_DropList_with_available_drives_instead_of_directory_page>
    * <http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave-forge/admin/Windows/DetectDrives.nsi>

## Download link

{% assign foo = site.github.latest_release.assets | where: "content_type", "application/x-msdownload" %}
<{{ foo[0].browser_download_url }}>

## Debug `releases` content

{% assign releases = site.github.releases | where: "draft", false | sort: "tag_name" | reverse %}

<!-- show releases -->
```JSON
{{ site.github.releases | where: "draft", false | sort: "tag_name" | reverse | neat_json }}
```

## Debug `site.github` content

<!-- show site.github -->
```JSON
{{ site.github | neat_json }}
```
