---
permalink: /search/
layout: page
title: "Search"
sitemap: false
---

{% include search %}

<h2>{{ site.data.language.search_result }}</h2>

<ul id="search-results" class="toc"></ul>

<script>
  window.store = {
    {% for post in site.posts %}
      "{{ post.url | slugify }}": {
        "title": "{{ post.title | xml_escape }} [{{post.date | date: '%Y-%m' }}]",
        "author": "{{ post.author | xml_escape }}",
        "category": "{{ post.category | xml_escape }}",
        "content": {{ post.content | strip_html | strip_newlines | jsonify }},
        "url": "{{ post.url | xml_escape | absolute_url }}"
      }
      {% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
</script>
<script src="{{ "/assets/js/lunr.min.js" | absolute_url }}"></script>
<script src="{{ "/assets/js/search.js" | absolute_url }}"></script>
 