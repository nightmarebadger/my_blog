<%inherit file="post.mako" />
<%def name="post_prose(post)">
  ${' '.join(post.content.split(' ', bf.config.blog.post_excerpts.word_length)[:bf.config.blog.post_excerpts.word_length])}
</%def>
