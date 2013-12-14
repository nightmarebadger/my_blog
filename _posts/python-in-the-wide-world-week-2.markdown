---
categories: python
date: 2013/12/17 20:15:00
title: Python in the wide world week - day 2, Dropbox
draft: True
---

Yesterday, at the start of the very first "XXX week", we [looked at
XBMC](/blog/2013/12/16/python-in-the-wide-world-week-day-1-xbmc/). Today, we
will look at [Dropbox], a could storage file synchronisation service.

## [Dropbox]

<a href="https://www.dropbox.com/"><img src="/images/dropbox_logo.png" alt="Dropbox"></a>

[Dropbox] is a file hosting service that offers simple cloud storage and file
synchronisation for average users as well as big companies. From a humble start
in 2008 it grew faster then anyone could have predicted and [hit 200M users on
Nov 13,
2013](http://techcrunch.com/2013/11/13/dropbox-hits-200-million-users-and-announces-new-products-for-businesses/).
Even though it has many competitors like [Google
Drive](http://www.google.com/drive/about.html), [Microsoft
SkyDrive](http://windows.microsoft.com/en-us/skydrive/download) and
[Box.net](https://www.box.com/) (and many, many others), [Dropbox] continues to
stand at the top of the game.

## Where is Python used?

> It would have been virtually impossible to do Dropbox without Python
>
> -- Rian Hunter, Dropbox Engineer

The better question would be - where isn't it used? More then 99% of both the
server and client code is written in Python. Using Python allowed the engineers
to be able to quickly test their ideas, fix any problems and bring frequent
updates. They were lucky, as many of their Python solutions scaled surprisingly
well, which meant that "*(they) could get to 40M users without having to write
thousands of lines of C code*", as the whole platform was still running only a
few hundred lines of Python code even when the number of users started reaching
tens of millions.

Rian also said that every time they tried to anticipate things or "be clever in
advance", they failed - it was much easier to just stay on top of the
architecture as it grew and keep tabs on it, which probably wouldn't be
possible if they weren't using Python.

[Dropbox]: https://www.dropbox.com/
