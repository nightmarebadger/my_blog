<% import datetime %>
<footer>
<div id="footer" class="row">
  <div class="col-sm-8">
    <p>
      Copyright 2013-${datetime.datetime.now().year}
      ${bf.config.site.author}
    </p>
    <p>
      <a href="${bf.util.site_path_helper(bf.config.blog.path,'feed','index.xml')}">RSS</a>
      % if bf.config.blog.disqus.enabled:
      | <a href="http://${bf.config.blog.disqus.name}.disqus.com/latest.rss">Comments RSS</a>
      % endif
    </p>
  </div>
  <div class="col-sm-4">
    <p>
      Powered by <a href="http://www.blogofile.com">Blogofile</a>, built with <a href="http://getbootstrap.com/">Bootstrap</a>.
    </p>
  </div>
</div>
</footer>
