<%inherit file="_templates/site.mako" />

<article class="page_box">
<%self:filter chain="syntax_highlight, markdown">

<%include file="${bf.util.site_path_helper('tutorials', tutorial['filename'])}" />

</%self:filter>

<p class="well well-sm post-author">
  Written by: ${tutorial.get('author', '').decode('utf8') or bf.config.site.author}
</p>
<br>
<p class="well well-sm post-author">
  Written on: ${tutorial['date'].strftime("%d %b %Y")}
</p>
% if bf.config.blog.disqus.enabled:
<hr>
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_url = "${bf.config.site.url + bf.util.site_path_helper('tutorials', tutorial['htmlname'])[1:]}";
  console.log(disqus_url);
</script>
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
</article>
