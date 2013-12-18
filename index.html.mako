<%inherit file="_templates/site.mako" />
<article class="page_box">
<%self:filter chain="markdown">

Welcome to my site
==================

Hello and welcome to my site. For now, it is a simple blog lacking in posts or
information, but I hope to see it grow into a hub of my tutorials, tips and
tricks.

I will try to post various pieces that I find useful or interesting while
slowly building up a base of full-fledged Python tutorials.

Now go look around and read a [post or two](blog) or [learn something from a
tutorial](tutorials). And of course, if you find something interesting, feel
free to comment and/or share!

<div id="share-buttons">
  <div id="twitter" data-text="Share" data-title="Tweet" class="col-xs-4"></div>
  <div id="facebook" data-text="Share" data-title="Like" class="col-xs-4"></div>
  <div id="googleplus" data-text="Share" data-title="+1" class="col-xs-4"></div>
</div>

</%self:filter>
</article>
