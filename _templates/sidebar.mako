<%
  from ast import literal_eval
  from datetime import date
  import os

  with open(os.path.join("tutorials", "base", "tutorials_data.txt")) as f:
    tutorials_data = eval(f.read())
%>

<div class="sidebar">
  <div class="well">
    <h4><a href="${bf.util.site_path_helper(bf.config.blog.path)}">Latest posts</a></h4>
    <ul class="sidebar">
      % for post in bf.config.blog.iter_posts_published(5):
      <li><a href="${post.path}">${post.title}</a></li>
      % endfor
    </ul>
  </div>
  <div class="well">
    <h4><a href="${bf.util.site_path_helper(bf.config.blog.path, 'category')}">Popular categories</a></h4>
    <ul class="sidebar">
      % for category, num_posts in sorted(bf.config.blog.all_categories, key = lambda x: x[1], reverse = True)[:5]:
        <li><a href="${category.path}">${category}</a> <span class="badge">${num_posts}</span></li>
      % endfor
    </ul>
  </div>
  <div class="well">
    <h4><a href="${bf.util.site_path_helper('tutorials')}">Latest Tutorials</a></h4>
    <ul class="sidebar">
      % for tut_name, tut_data in sorted(tutorials_data.iteritems(), key = lambda x: x[1]['date'], reverse=True)[:5]:
        <li><a href="${bf.util.site_path_helper('tutorials', tut_data['filename'])}">${tut_name}</a></li>
      % endfor
    </ul>
  </div>
  <div class="well">
    <h4><a href="${bf.util.site_path_helper(bf.config.blog.path, 'archive')}">Archives</a></h4>
    <ul class="sidebar">
      % for archive_path, archive_name, archive_post_number in bf.config.blog.archive_links:
        <li><a href="${bf.util.site_path_helper(bf.config.blog.path, archive_path, '1')}">${archive_name}</a> <span class="badge">${archive_post_number}</span></li>
      % endfor
    </ul>
  </div>

</div>
