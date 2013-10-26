<%
  is_excerpt = True
%>
<%inherit file="post.mako" />
<%def name="post_prose(post)">
  ${' '.join(post.content.split(' ', bf.config.blog.post_excerpts.word_length)[:bf.config.blog.post_excerpts.word_length])}
</%def>
<%def name="post_excerpt()">
  ${'''<br><p class="well well-sm post-author">
    This is an excerpt. To see the full post, please click on the title.
  </p>'''}
</%def>
