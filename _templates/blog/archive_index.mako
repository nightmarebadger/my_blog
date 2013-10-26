<%inherit file="bf_base_template" />
% for posts in month_posts:
<h1><a href="${bf.util.site_path_helper(bf.config.blog.path, 'archive', posts[0].date.strftime('%Y'), posts[0].date.strftime('%m'), '1')}">${posts[0].date.strftime("%B %Y")}</a></h1>
<ul>
  % for post in posts:
  <li><a href="${post.permapath()}">${post.title}</a></li>
  % endfor
</ul>
% endfor
