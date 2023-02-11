---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

<h1>Coding Problems:</h1>
<br>

<div>
    <div style="display:table;width:100%;table-layout:fixed;">
      <span style="display:table-cell;text-align:center;">Name</span>
      <span style="display:table-cell;width:50%;text-align:center;">Difficulty</span>
    </div>
  {% for problem in site.data.problems %}
    <div style="display:table;width:100%;table-layout:fixed;">
      <span style="display:table-cell;">{{ problem.Name }}</span>
      <span style="display:table-cell;">{{ problem.Difficulty }}</span>
    </div>
  {% endfor %}    
</div>

