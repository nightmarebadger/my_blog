# -*- coding: utf-8 -*-

######################################################################
# This is your site's Blogofile configuration file.
# www.Blogofile.com
#
# This file doesn't list every possible setting, it relies on defaults
# set in the core blogofile _config.py. To see where the default
# configuration is on your system run 'blogofile info'
#
######################################################################

######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
site.url = "http://www.natan.termitnjak.net/"

## site.author -- Your name, the author of the website.
# This is optional. If set to anything other than None, the
# simple_blog template creates a meta tag for the site author.
site.author = u"Natan Žabkar"

#### Blog Settings ####
blog = plugins.blog

## blog_enabled -- Should the blog be enabled?
#  (You don't _have_ to use blogofile to build blogs)
blog.enabled = True

## blog_path -- Blog path.
#  This is the path of the blog relative to the site_url.
#  If your site_url is "http://www.yoursite.com/~ryan"
#  and you set blog_path to "/blog" your full blog URL would be
#  "http://www.yoursite.com/~ryan/blog"
#  Leave blank "" to set to the root of site_url
blog.path = "/blog"

## blog_name -- Your Blog's name.
# This is used repeatedly in default blog templates
blog.name = "NMB's Development Blog"

## HTML5 example customizes the blog templates.
## Delete this setting to use the default ones instead.
blog.template_path = "_templates/blog"

## blog_description -- A short one line description of the blog
# used in the RSS/Atom feeds.
blog.description = "Blog with tutorials about Python, web development and various other interesting topics from the world of computers."

## blog_timezone -- the timezone that you normally write your blog posts from
blog.timezone = "Europe/Ljubljana"

## blog_googleanaltics_id -- enable Google Analytics tracking
## TODO: move to plugin/filter?
blog.googleanlytics_id = "UA-XXXXX-X"

## Markdown extensions
## These are turned off by default, but turned on
## to show examples in /blog/2009/07/24/post-2/
filters.markdown.extensions.def_list.enabled = True
filters.markdown.extensions.abbr.enabled = True
filters.markdown.extensions.footnotes.enabled = True
filters.markdown.extensions.fenced_code.enabled = True
filters.markdown.extensions.headerid.enabled = True
filters.markdown.extensions.tables.enabled = True


## My settings:
blog.auto_permalink.enabled = True
blog.auto_permalink.path = ":blog_path/:year/:month/:day/:title"
blog.disqus.enabled = True
blog.disqus.name = "natanblogdev"
## We disable the excerpts and use our custom code in "post_excerpt.mako" since
## the official code doesn't play well with syntax highlighters. Another
## workaround for the syntax highlighters problem is in post.mako
blog.post_excerpts.enabled = False
blog.post_excerpts.word_length = 100

controllers.tutorials.enabled = True


import locale
import os
import shutil


def pre_build():
    locale.setlocale(locale.LC_ALL, 'en_US.utf8')

    # Save the git submodule info
    if not os.path.isdir("_tmp"):
        os.mkdir("_tmp")
    else:
        shutil.rmtree("_tmp")
        os.mkdir("_tmp")
    if os.path.isdir(os.path.join("_site", ".git")):
        shutil.move(os.path.join("_site", ".git"), "_tmp")


def build_finally():
    if os.path.isdir(os.path.join("_tmp", ".git")):
        shutil.move(os.path.join("_tmp", ".git"), "_site")
