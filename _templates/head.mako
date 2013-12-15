<%page args="title_addition=''" />
<%
  # Base values
  title = bf.config.blog.name
  keywords = 'programming, python, natan zabkar, nightmarebadger'
  description = bf.config.blog.description

  # If we have a post, add to the title and keywords
  if post:
    title += ': ' + post.title
    keywords += ', ' + ', '.join(map(str, post.categories))

  # If we have a tutorial, add to the title and keywords, replace the
  # description with the tutorial one
  if tutorial:
    title += ': ' + tutorial_name + ' (tutorial)'
    description = tutorial['description'].replace('<p>', '').replace('</p>', '')

    tutorial_keywords = tutorial.get('keywords')
    if tutorial_keywords:
      keywords += ', tutorial, ' + tutorial_keywords
    else:
      keywords += ', tutorial'
%>

  <title>${title}</title>
  <meta name="description" content="${description}">
%if bf.config.site.author:
  <meta name="author" content="${bf.config.site.author}">
%endif
  <meta name="keywords" content="${keywords}">
  <meta charset="UTF-8">
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed')}" />
  <link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />
  <link rel="shortcut icon" href="${bf.util.site_path_helper('favicon.ico')}">
  <link rel="apple-touch-icon" href="${bf.util.site_path_helper('img/apple-touch-icon.png')}">

  <link rel="stylesheet" href="${bf.util.site_path_helper(bf.config.filters.syntax_highlight.css_dir,'/pygments_'+bf.config.filters.syntax_highlight.style+'.css')}" type="text/css" />

  <script src="${bf.util.site_path_helper('js/libs/modernizr-1.7.min.js')}"></script>

  <link rel="stylesheet" href="${bf.util.site_path_helper('css/bootstrap.min.css')}" />
  <link rel="stylesheet" href="${bf.util.site_path_helper('css/bootstrap-theme.min.css')}" />
  <link rel="stylesheet" href="${bf.util.site_path_helper('css/custom.css')}" />
  <link rel="stylesheet" href="${bf.util.site_path_helper('css/font-awesome/css/font-awesome.min.css')}" />
  % if bf.template_context.render_path.strip('/').startswith('tutorials'):
    <link rel="stylesheet" href="${bf.util.site_path_helper('css/custom-notebook.css')}" />
  % endif


  <%include file="theme.mako"/>
