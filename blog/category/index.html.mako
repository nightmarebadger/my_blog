<%inherit file="_templates/site.mako" />
<article class="page_box">

<h1>A list of all categories, ordered alphabetically</h1>
<ul class="sidebar">
  % for category, num_posts in bf.config.blog.all_categories:
    <li><a href="${category.path}">${category}</a> <span class="badge">${num_posts}</span></li>
  % endfor
</ul>


</article>
