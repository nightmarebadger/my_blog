  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="${bf.util.site_path_helper('js/jquery-1.10.2.min.js')}"></script>
  <script src="${bf.util.site_path_helper('js/bootstrap.min.js')}"></script>
  <script src="${bf.util.site_path_helper('js/plugins.js')}"></script>

  <!--[if lt IE 7 ]>
  <script src="js/libs/dd_belatedpng.js"></script>
  <script> DD_belatedPNG.fix('img, .png_bg');</script>
  <![endif]-->
  <script>
      var _gaq=[['_setAccount','${bf.config.blog.googleanlytics_id}'],['_trackPageview']];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
      g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
      s.parentNode.insertBefore(g,s)}(document,'script'));
  </script>
  % if bf.config.blog.disqus.enabled:
  <script>
  (function() {
      var links = document.getElementsByTagName('a');
      var query = '?';
      for(var i = 0; i < links.length; i++) {
          if(links[i].href.indexOf('#disqus_thread') >= 0) {
              query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
          }
      }
      document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/get_num_replies.js' + query + '"></' + 'script>');
  })();
  </script>
  % endif

