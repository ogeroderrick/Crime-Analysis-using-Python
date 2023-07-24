<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    /* Custom CSS for title and map styling */
    .map-title {
      font-size: 24px;
      font-weight: bold;
      color: blue;
      text-decoration: underline;
      margin-bottom: 10px;
    }
    .legend {
      /* Add your legend styling here */
    }
    .scale {
      /* Add your scale styling here */
    }
    .north-arrow {
      /* Add your north arrow styling here */
    }
    /* Custom CSS for hiding cells with the "@hide" tag */
    .hidden-cell {
      display: none;
    }
  </style>
</head>  
<body>
{%- for cell in nb.cells %}
  {%- if cell.metadata.tags is defined and '@hide' in cell.metadata.tags %}
    <!-- Hide the entire cell with the "@hide" tag -->
    <div class="hidden-cell"></div>
  {%- elif cell.cell_type == 'code' and '@map' in cell.metadata.get('tags', []) %}
    <div class="map-title">Map Output Title</div>
    {{ cell.source | highlight_code(strip=True) | markdown2html }}
    <!-- Modify the above line based on your desired map visualization library (e.g., folium) -->
    <div class="legend">Legend HTML Code Here</div>
    <div class="scale">Scale HTML Code Here</div>
    <div class="north-arrow">North Arrow HTML Code Here</div>
  {%- elif cell.cell_type == 'markdown' %}
    {{ cell.source | markdown2html }}
  {%- endif %}
{%- endfor %}
</body>    
</html>
