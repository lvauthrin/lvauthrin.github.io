---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

<h2>Coding Problems</h2>
<br>

<div>
    <div style="display:table;width:100%;table-layout:fixed;">
      <span style="display:table-cell;width:30%;text-align:center;">Name</span>
      <span style="display:table-cell;width:20%;text-align:center;">Difficulty</span>
      <span style="display:table-cell;width:50%;text-align:center;">Notes</span>
    </div>
  {% for problem in site.data.problems %}
    <div style="display:table;width:100%;table-layout:fixed;">
      <span style="display:table-cell;"><a href="{{ problem.code }}">{{ problem.name }}</a></span>
      <span style="display:table-cell;">{{ problem.Difficulty }}</span>
      <span style="display:table-cell;">{{ problem.Notes }}</span>
    </div>
  {% endfor %}    
</div>

