<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script>
  (function() {
    var cx = '001667814214077799583:bmwgdudlvbm';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>

<script src="${bf.util.site_path_helper('js/jquery-1.10.2.min.js')}"></script>
<script src="${bf.util.site_path_helper('js/bootstrap.min.js')}"></script>
<script src="${bf.util.site_path_helper('js/plugins.js')}"></script>

<script>
  var toc = $("#toc ol");
  if (toc.length){
      if (typeof toc_selector === 'undefined'){
          var toc_selector = "h1, h2, h3";
      }
      var tmp = "",
          lastLevel = parseInt(toc_selector[1]);
      $("article").find(toc_selector).each(function(i) {
          var current = $(this),
              currentLevel = parseInt(current.prop('tagName')[1]);
          while (currentLevel > lastLevel) {
              tmp += "<ol>";
              lastLevel += 1;
          }
          while (currentLevel < lastLevel) {
              tmp += "</ol>";
              lastLevel -= 1;
              tmp += "</li>";
          }
          tmp += "<li><a id='#" + current.prop('id') + "-toc' href='#" + current.prop('id') + "'>" + current.html() + "</a>";

      });

      toc.append(tmp);
  }

</script>

<script src="https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>
<script type="text/javascript">
init_mathjax = function() {
    if (window.MathJax) {
        // MathJax loaded
        MathJax.Hub.Config({
            tex2jax: {
                inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                displayMath: [ ['$$','$$'], ["\\[","\\]"] ]
            },
            displayAlign: 'left', // Change this to 'center' to center equations.
            "HTML-CSS": {
                styles: {'.MathJax_Display': {"margin": 0}}
            }
        });
        MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    }
}
init_mathjax();
</script>

<script src="${bf.util.site_path_helper('js/emoticons/jquery.cssemoticons.min.js')}" type="text/javascript"></script>
<script>
  $("article").children().not("#disqus_thread, script, noscript").emoticonize({animate: false});
</script>

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

