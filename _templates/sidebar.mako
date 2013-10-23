<div class="sidebar">
  <div class="well">
    <h4>Latest posts</h4>
    <ul class="sidebar">
      % for post in bf.config.blog.iter_posts_published(5):
      <li><a href="${post.path}">${post.title}</a></li>
      % endfor
    </ul>
  </div>
  <div class="well">
    <h4>Popular categories</h4>
    <ul class="sidebar">
      % for category, num_posts in sorted(bf.config.blog.all_categories, key = lambda x: x[1], reverse = True)[:5]:
        <li><a href="${category.path}">${category}</a> <span class="badge">${num_posts}</span></li>
      % endfor
    </ul>
  </div>
  <div class="well">
    <h4>Archives</h4>
    <ul class="sidebar">
      % for archive_path, archive_name, archive_post_number in bf.config.blog.archive_links:
        <li><a href="${bf.config.blog.path}/${archive_path}/1">${archive_name}</a> <span class="badge">${archive_post_number}</span></li>
      % endfor
    </ul>
  </div>
</div>
