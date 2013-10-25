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
      <h2 class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h2>
      <p><small><span class="blog_post_date">${post.date.strftime("%B %d, %Y at %I:%M %p")}</span> | categories:
        <span class="blog_post_categories">${", ".join(category_links)}</span>
        % if bf.config.blog.disqus.enabled:
        | <a href="${post.permalink}#disqus_thread">View Comments</a>
        % endif
      </small></p>
    </header>
    <div class="post_prose">
      ${self.post_prose(post)}
    </div>
    <!-- This is needed here so we don't get caught 'inside' the code highlighter when building excrements. I know it's not nice, but it's the only way I could make it work right now and even though it's far from perfect, it doesn't break the site -->
    </pre></tr></tbody></thead></table>
    <!-- End code highlighter workaroung -->
    <p class="well well-sm post-author">
      Written by: ${post.author or bf.config.site.author}
    </p>
    ${self.post_excerpt()}
    %if bf.config.blog.disqus.enabled:
      <hr>
    %endif
  </div>
</article>

<%def name="post_prose(post)">
  ${post.content}
</%def>
<%def name="post_excerpt()">

</%def>
