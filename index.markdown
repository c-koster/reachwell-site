---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
liquid:
  error_mode: 'warn'
---


Hi Jesse: Here is an interactive choropleth map for you.



<iframe src="http://www.cultonkoster.com/reachwell/" width="1200" height="800" frameborder="0" allowfullscreen></iframe>





<script src="https://cdn.jsdelivr.net/npm/vega@5"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-lite@5"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-embed@6"></script>
<div id="vis"></div>

<script type="text/javascript">
  var spec = "https://raw.githubusercontent.com/c-koster/vega-specs/master/reachwell/multi-choropleth.json";
  vegaEmbed('#vis', spec).then(function(result) {}).catch(console.error);
</script>
