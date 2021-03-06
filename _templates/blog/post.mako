<%page args="post"/>

<%
  category_links = []
  for category in post.categories:
      if post.draft:
          #For drafts, we don't write to the category dirs, so just write the categories as text
          category_links.append(category.name)
      else:
          category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>

<article>
  <div class="blog_post">
    <header>
      <div id="${post.slug}"></div>
      <h1 class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>
      <p><small><span class="blog_post_date">${post.date.strftime("%B %d, %Y at %I:%M %p")}</span> | categories:
        <span class="blog_post_categories">${", ".join(category_links)}</span>
        % if bf.config.blog.disqus.enabled:
        | <a href="${post.permalink}#disqus_thread">View Comments</a>
        % endif
      </small></p>
    </header>

    ${self.post_toc()}

    <div class="post_prose">
      ${self.post_prose(post)}
    </div>
    <!-- This is needed here so we don't get caught 'inside' the code highlighter when building excrements. I know it's not nice, but it's the only way I could make it work right now and even though it's far from perfect, it doesn't break the site -->
    </pre></tr></tbody></thead></table>
    <!-- End code highlighter workaroung -->

    ${self.post_share()}

    <p class="well well-sm post-author">
      Written by: ${post.author or bf.config.site.author}
    </p>
    ${self.post_excerpt()}
    %if bf.config.blog.disqus.enabled:
      <hr>
    %endif
  </div>
</article>

<script>
  var toc_selector = "h2, h3, h4";
</script>

<%def name="post_prose(post)">
  ${post.content}
</%def>
<%def name="post_excerpt()">

</%def>
<%def name="post_toc()">
  ${'''
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
  '''}
</%def>
<%def name="post_share()">
  ${'''
    <div id="share-buttons" class="row">
      <div id="twitter" data-text="Share" data-title="Tweet" class="col-xs-4"></div>
      <div id="facebook" data-text="Share" data-title="Like" class="col-xs-4"></div>
      <div id="googleplus" data-text="Share" data-title="+1" class="col-xs-4"></div>
    </div>
  '''}
</%def>
