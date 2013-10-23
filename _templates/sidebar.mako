<aside>
  <section>
    <h1 class="post_header_gradient theme_font">Latest Posts</h1>
    <ul>
      % for post in bf.config.blog.iter_posts_published(5):
      <li><a href="${post.path}">${post.title}</a></li>
      % endfor
    </ul>
  </section>
  <section>
    <h1 class="post_header_gradient theme_font">Categories</h1>
    <ul>
      % for category, num_posts in bf.config.blog.all_categories:
        <li><a href="${category.path}">${category}</a> (${num_posts})</li>
      % endfor
    </ul>
  </section>
  <section>
    <h1 class="post_header_gradient theme_font">Archives</h1>
    <ul>
      % for archive_path, archive_name, archive_post_number in bf.config.blog.archive_links:
        <li><a href="${bf.config.blog.path}/${archive_path}/1">${archive_name}</a> (${archive_post_number})</li>
      % endfor
    </ul>
  </section>
  <section>
    <h1 class="post_header_gradient theme_font">Tags</h1>
    <ul>
      % for category, num_posts in bf.config.blog.all_tags:
        <li><a href="${category.path}">${category}</a> (${num_posts})</li>
      % endfor
    </ul>
  </section>
  <section>
    <ul>
      <li>${bf.config.blog.all_tags}</li>
      <li>${bf.config.blog.all_categories}</li>
      <li>${bf.config.blog.plugins}</li>
    </ul>
  </section>

</aside>
