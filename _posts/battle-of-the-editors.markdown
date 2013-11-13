---
categories: sublime text, programming tools, editors
date: 2013/11/11 02:30:00
tags: sublime text 2
title: Battle of the editors - Sublime Text 2
---

As most of us, I've been struggling with finding the "perfect" editor. For me,
that meant an editor that could be used for many different languages (C,
Python, HTML, CSS, JavaScript, ... ), could also be used for "normal" use
(Markdown, RST, LaTeX), would start up fast and generally be fast enough so I
didn't have to wait around for it and could optionally be extended with various
plugins.

Furthermore, I'd like the "out of the box" functionality to be good, and if at
all possible, it should be easy to synchronise my settings across devices.
Working under multiple platforms would also be a plus, since I couldn't count
on always working on the same operating system.

In the end, I have found what I have been looking for in Sublime Text 2, which,
at least for now, is close enough to my "perfect" editor that I do not feel the
need to test out new editors.

This editor is light, fast and has a nice & clean design. The out of the box
functionality is good, and can very easily be extended using packages from the
Package control. It's also Python based, so writing or changing/adding to
plugins is a breeze. Additionally, it offers some really useful features I
haven't seen in other editors I have used.

## Editors I have used in the past

The editors I've gone through until now are:

* **Vim**: While complex and "strange", it allowed me to do practically
  everything and could be extended in many ways. Since it's a console editor, I
  still use it when I don't have access to the GUI and for simple tasks.
* **TextPad**: We used this at the university, and while it was OK for what we
  needed it, it didn't impress me in any way.
* **Notepad++**: Same as above.
* **Eclipse / Aptana studio**: As I started working with Python more I started
  looking for an IDE that I could use instead of just using Vim. I've come
  across Aptana studio (Eclipse for web development and Python). While
  powerful, it was too big, clunky and slow for my tastes.
* **Sublime Text 2**: Another editor I came across at the university - this
  time a professor used it on his Mac, so I didn't really pay attention to it.
  Later found out it works in Windows and Linux too so I took it for a test run
  and haven't looked back since :)

## Best Sublime Text 2 features

This is in no way a complete list of Sublime Text 2 features, it is just a list
of my personal favourite things about Sublime Text.

### Goto anything

This here is amazing and I use it all the time. Basically, it allows you to
press *Ctrl+P* to search over all the files opened in the editor and (very!)
quickly search and change between them. It is also not only limited to simple
file searching and opening, but you can also:

* Start typing to search between the files
* Type "@"" to search between sections of the file (headers, function
  definitions etc.)
* Type "#"" to search within the file
* Type ":" to go to a line number

And now the real catch - these options can be combined! So I can fire up the
Goto anything using the command *Ctrl+P*, write "edit" to find the
"battle-of-the-editors.markdown" file, then continue with "edit@got" to find
this section, or do an "edit#combined" to directly search for "combined", or do
"edit:50" to go to the 50th line of the file.

Of course you can still use the normal *Ctrl+F* to search inside the opened
file and *Ctrl+G* for goto line.

### Command palette

Just press *Ctrl+Shift+P* to fire up the command palette, which holds
infrequently used functionality (indentation settings, changing the syntax,
sorting, ... ). No more trying to remember hundreds of key bindings or
searching through the menu for every minor thing. As above, this is dynamically
filtered on each keystroke and is very fast.

### Multiple selection

Press *Ctrl+D* to select the next occurrence of the selected word. Once you
have all of them selected, you can simply change them in one go (useful for
changing a variable name etc.).

An even more impressive feature, and one that you find yourself using way more
then you thought you would, is the command *Ctrl+Shift+L*, which splits the
selection into lines. Let's say you want to convert a list of student names
from a .txt file with each student in it's line to an actual Python list. To do
this, you need to add the opening and closing brackets and quotation marks
around each one. Using the above command, it is really simple - just select
everything (*Ctrl+A*), split selection into lines (*Ctrl+Shift+L*)), press
*Home* to get to the beginning of each line and add the quotation mark, press
*End* to go to the end of each line and add a quotation mark and a comma. All
that remains is to add the brackets at the beginning and end. Of course, if you
wanted them all to be in a single line, you could just press *Delete* after
adding the comma.

Believe me, once you get used to doing things this way, you will wonder how you
ever managed to make do without it.

### Hard line wrap

This is a feature I didn't at all until I started writing some more stuff in
Markdown, as I wrap my code by hand. Do you know that feeling when you write a
big paragraph and everything is nicely wrapped at the 80 char limit ... until
you see you forgot to write a word or two that is - you add the words at the
start somewhere, and now the whole paragraph is wrapped wrong. Do you want to
go through the whole thing again by hand and fix it so it's wrapped nicely? I
sure don't.

And that is exactly the reason why I started using the hard line wrap
(*Alt+Q*), which does the work for you. If you ever add or delete a word
somewhere in the paragraph, just press *Alt+Q* and it's done.

To make sure everything works fine even in markdown lists, code comments etc. I
recommend installing the [Sublime Wrap
Plus](https://github.com/ehuss/Sublime-Wrap-Plus) package.

### Spell check

Integrated spell checker to use when writing LaTeX, Markdown, RST etc. It uses
LibreOffice dictionaries so you can download the language you want. Enable it
with *F6*.

### Moving selected lines up or down

Select a few lines of your text, hold down *Ctrl+Shift* and press up or down.
The selection will move up or down according to your commands, "pushing" the
other lines above or below it (depending on which way you're going of course).
A simple and fast way of moving some code around, plus it looks like magic to
anyone looking over your shoulder :).

### [Package control](https://sublime.wbond.net/)

Leaving the best for last, this is the hearth and soul of Sublime Text 2 for
me. It is a great and easy way to install and manage your packages.

Basically it allows you to download packages through the Command palette
(*Ctrl+Shift+P) with the "Package control: Install Package" command, which
looks on the web to find the list of all packages with their descriptions that
can be searched as all other commands in the Command palette can.

Once you find the package you are looking for, just press enter to quickly and
easily install it and add it to your packages, which will automatically update
the packages when a new version is released.

Each package is also neatly organised, and comes with it's own commands
automatically added to the Command palette and it's own default and user
settings.

## Personal settings

A blog post with my personal settings, the packages I use and how I keep
everything synchronised between machines will follow soon.
