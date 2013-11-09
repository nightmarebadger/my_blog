  <title>${bf.config.blog.name}</title>
  <meta name="description" content="${bf.config.blog.description}">
%if bf.config.site.author:
  <meta name="author" content="${bf.config.site.author}">
%endif
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
  <link rel="stylesheet" href="${bf.util.site_path_helper('css/custom-notebook.css')}" />

  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

  <%include file="theme.mako"/>
