<%
  data = []
  data.append(('IPython notebook', 'base/' +
                                   tutorial['filename'].rstrip('.html') +
                                   '.ipynb')
  )
  data.append(('Source repository', tutorial.get('source-repository-link')))
  data.append(('Source download', tutorial.get('source-download-link')))

  data_html = ' | '.join(['<a href="{1}" target="_blank">{0}</a>'.format(
                                                                    i[0], i[1])
                          for i in data if i[1]])

%>

<%inherit file="_templates/site.mako" />

<article class="tutorial_box">

<div id="toc" class="well well-sm">
  <p class="toctitle centered">
    Contents
    <span>
      [<a data-toggle="collapse" data-parent="#toc" href="#toc-content">show/hide</a>]
    </span>
  </p>
  <ol id="toc-content" class="collapse">
  </ol>
</div>

<div id="source" class="well well-sm">
  <p class="toctitle centered">
    Source
    <span>
      [<a data-toggle="collapse" data-parent="#source" href="#source-content">show/hide</a>]
    </span>
  </p>
  <div id="source-content" class="collapse">
    <p class="centered source-links">
      ${data_html}
    </p>
  </div>
</div>

<%include file="${bf.util.site_path_helper('tutorials', 'base', tutorial['filename'])}" />

% if tutorial_chain:
  <h1 id="Related-tutorials">Related tutorials</h1>
  <p>
    This tutorial is part of a chain of tutorials:
    <ul>
    % for chain_name, chain_data in tutorial_chain:
      <li>
        <a href="${chain_data['filename']}">${chain_name}</a>
        % if tutorial_name == chain_name:
          - current
        % endif
      </li>
    % endfor
    </ul>
  </p>

  <br>
  % if tutorial_previous or tutorial_next:
    <hr>
    % if tutorial_previous:
      <span class="pull-left">Previous tutorial:
        <a href="${tutorial_previous[1]['filename']}">${tutorial_previous[0]}</a>
      </span>
    % endif

    % if tutorial_next:
      <span class="pull-right">Next tutorial:
        <a href="${tutorial_next[1]['filename']}">${tutorial_next[0]}</a>
      </span>
    % endif
    <br>
    <hr>
  % endif
  <br>
% endif

<div id="share-buttons">
  <div id="twitter" data-text="Share" data-title="Tweet" class="col-xs-4"></div>
  <div id="facebook" data-text="Share" data-title="Like" class="col-xs-4"></div>
  <div id="googleplus" data-text="Share" data-title="+1" class="col-xs-4"></div>
</div>

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
  var disqus_url = "${bf.config.site.url + bf.util.site_path_helper('tutorials', tutorial['filename'])[1:]}";
</script>
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
</article>
