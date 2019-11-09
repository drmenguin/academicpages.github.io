---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

My <a href="https://en.wikipedia.org/wiki/Erd%C5%91s_number" target="_blank">Erdős number</a> is $\leqslant 4$ by the chain: L. Collins (me) $\to$ I. Sciriha $\to$ S. Firoini $\to$ R. J. Wilson $\to$ P. Erdős.

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
