---
categories: welcome
date: 2013/11/07 00:33:00
tags: new, blog
title: Welcome to the blog!
---

With this post, my blog is officially open for business. It will primarily be
used for Python related stuff and I am working on some [tutorials](/tutorials)
to put on here. The first one is already up so feel free to go read it and
leave your comments!

For the more technically inclined, an explanation of how the blog is set up.

* Built by [Blogofile](http://www.blogofile.com/), a Python static website
  compiler
* [Twitter Bootstrap 3](http://getbootstrap.com/) for responsiveness
* [Disqus](http://disqus.com/) for comments
* Git on [GitHub](https://github.com/) for version control

I use two repositories on GitHub, one for the
[source](https://github.com/nightmarebadger/my_blog) and the second one for the
[generated source](https://github.com/nightmarebadger/my_blog_generated). The
generated source repository is then cloned to the hosting provider and hosted
from there as plain HTML.

The posts themselves can be written in Markdown, HTML or RST, while the
tutorials are written in the [IPython
Notebook](http://ipython.org/notebook.html) and then converted to basic HTML
and integrated into the blog using Blogofile's controllers and [Mako
templates](http://www.makotemplates.org/).

More information on how to set up your own Blogofile blog in a similar way to
follow.
