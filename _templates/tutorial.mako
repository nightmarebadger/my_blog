## -*- coding: utf-8 -*-

<%
    file = open('tutorials/' + tutorial_name)
    s = u''
    flag = False
    for line in file:
        line = line.decode('utf8')
        if line.startswith('    '):
            if not flag:
                s += u'$$code(lang=python)\n'
                flag = True
            s += line[4:]
        elif not line.startswith('    '):
            s += line
            if flag:
                s += u'$$/code\n'
                flag = False
%>

<%inherit file="_templates/site.mako" />

<article class="page_box">
<%self:filter chain="syntax_highlight, markdown">

${s}

</%self:filter>
</article>

% if bf.config.blog.disqus.enabled:
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_url = "${bf.config.site.url + bf.util.site_path_helper('tutorials', tutorial_htmlname)[1:]}";
</script>
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
