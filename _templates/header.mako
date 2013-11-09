<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="${bf.util.site_path_helper()}">${bf.config.blog.name}</a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="navbar-collapse collapse">
      <%
        def nav_class():
          render_path = bf.template_context.render_path.strip('/')
          if render_path.startswith('./about.html'):
            return 'about'
          if render_path.startswith('blog/archive'):
            return 'archive'
          if render_path.startswith('blog/category'):
            return 'categories'
          if render_path.startswith('blog'):
            return 'blog'
          if render_path.startswith('tutorials'):
            return 'tutorials'
          if render_path.startswith('./'):
            return 'home'
          return None

        path_name = nav_class()
        %>
      <ul class="nav navbar-nav">
        <li class="${path_name == 'home' and 'active' or ''}">
          <a href="${bf.util.site_path_helper()}">Home</a>
        </li>
        <li class="${path_name == 'blog' and 'active' or ''}">
          <a href="${bf.util.site_path_helper(bf.config.blog.path)}">Blog</a>
        </li>
        <li class="${path_name == 'categories' and 'active' or ''}">
          <a href="${bf.util.site_path_helper(bf.config.blog.path, 'category')}">Categories</a>
        </li>
        <li class="${path_name == 'tutorials' and 'active' or ''}">
          <a href="${bf.util.site_path_helper('tutorials')}">Tutorials</a>
        </li>
        <li class="${path_name == 'archive' and 'active' or ''}">
          <a href="${bf.util.site_path_helper(bf.config.blog.path, 'archive')}">Archives</a>
        </li>
        <li class="${path_name == 'about' and 'active' or ''}">
          <a href="${bf.util.site_path_helper('about.html')}">About me</a>
        </li>
      </ul>
    </div>
  </div>
</nav>




