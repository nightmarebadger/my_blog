---
categories: sublime text, programming tools, editors
date: 2013/12/08 22:00:00
title: My Sublime Text 2 settings
---

In this post I will go through the core addons I use (I might use some more
here and there but these are the ones I find the most useful).


## Addons I use

<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>Addon name and link</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <a href="https://github.com/simme--/Auto-Encoding-for-Python">
                    Auto Encoding for Python
                </a>
            </td>
            <td>

                Automatically include utf-8 Python encoding where needed.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/spadgos/sublime-jsdocs">
                    DocBlockr
                </a>
            </td>
            <td>

                Simplifies writing DocBlock comments in JS, CoffeScript,
                Actionscript, PHP, C, ...

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/revolunet/sublimetext-markdown-preview">
                    Mako
                </a>
            </td>
            <td>

                Added support for Mako templates highlighting.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/revolunet/sublimetext-markdown-preview">
                    Markdown Preview
                </a>
            </td>
            <td>

                Preview for your markdown files.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/borist/SublimePaneNavigation">
                    Pane Navigation
                </a>
            </td>
            <td>

                Changes tab navigation (Ctrl + Tab) to be more in
                line with what we're used to.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/titoBouzout/SideBarEnhancements">
                    SideBarEnhancements
                </a>
            </td>
            <td>

                Gives extra options in the sidebar.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/SublimeCodeIntel/SublimeCodeIntel">
                    SublimeCodeIntel
                </a>
            </td>
            <td>

                Code intelligence plugin (imports autocomplete, function
                tooltips, jump to definition, ... ).

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/SublimeLinter/SublimeLinter">
                    SublimeLinter
                </a>
            </td>
            <td>

                Support for "lint" programs for many languages.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/JulianEberius/SublimeRope">
                    SublimeRope
                </a>
            </td>
            <td>

                Adds Rope (re-factoring library) support.

            </td>
        </tr>
         <tr>
            <td>
                <a href="https://github.com/JulianEberius/SublimeRope">
                    Sublime Wrap Plus
                </a>
            </td>
            <td>

                Extra support for hard line wrap.

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/amisarca/Sublime-Text-2-Table-Cleaner">
                    TableCleaner
                </a>
            </td>
            <td>

                Cleans tables (aligns and cleans nicely on "pipe" character
                (|), useful for Sphinx documentation, LaTeX etc.).

            </td>
        </tr>
        <tr>
            <td>
                <a href="https://github.com/SublimeText/Tag">
                    Tag
                </a>
            </td>
            <td>

                Provides extra support for HTMLish tags - auto close tags on
                slash, automatically indent tags etc.

            </td>
        </tr>
    </tbody>
</table>

### Auto Encoding for Python

Since I speak a language that often uses utf-8 characters, I'm getting tired of
writing `# -*- coding: utf-8 -*-` or something similar on the top of each file
that uses one of those characters. This addon does that for me, only generating
the encoding declaration when it's needed and deleting it when it's not needed
any more.

### DocBlockr

Really simplifies the writing of block comments for functions in JS etc. I've
also started working on Python support, but it's not that far along yet. You
can find what I've added on my
[GitHub](https://github.com/nightmarebadger/sublime-jsdocs/tree/add_python_support).

### Mako

Adds the Mako template syntax highlighter to Sublime Text 2. Very useful for
everyone working with Mako templates.

### Markdown Preview

An addon that allows you quickly build the Markdown in the currently open file
and preview it in the browser. Very useful, especially when you are just
starting to learn Markdown.

Once you generate the file, it's also automatically updated on each save,
making it a very fast way to check how your changes changed the document.

Also supports Git flavoured Markdown, which uses the actual GitHub API, and as
such, a Python with SSL support is required.

### Pane Navigation

Changing between opened files in Sublime Text 2 using *Ctrl+Tab* or
*Ctrl+Shift+Tab* can be an ... interesting experience. It definitely does not
work as you would expect at the beginning (it does not move right or left
through the opened tabs, but rather works through a last-changed list or
something like that).

If you do not like how it's handled in the vanilla install, grab this package,
which changes the navigation to something you're probably more used to
(*Ctrl+Tab* moves right, *Ctrl+Shift+Tab* moves left).

### SideBarEnhancements

Adds many new options like deleting, moving, renaming, copying etc. to the
Sidebar. Frankly I've used this since I started using ST2 so I'm not completely
sure which options are integrated and which options are added by the package,
but you surely have nothing to lose by installing this.

### SublimeCodeIntel

Adds code intelligence, ported from [Open Komodo
Editor](http://www.openkomodo.com/). Adds stuff like function call tool tips,
auto completion from imports, jump to symbol definition etc.

### SublimeLinter

Adds support for "lint" programs for many languages. This is an invaluable tool
that constantly checks your code to see if it's up to the standards, making it
easy to produce better code faster. Do not even think if you need this or not -
just install it :).

### SublimeRope

Adds support for the Rope (re-factoring library), making it even easier to
re-factor and restructure your code, automatically manage your imports, get
documentation, features an extended auto completion etc.

### SublimeWrapPlus

Better hard line wrapping (*Alt+Q*), now works correctly in many instances
where it didn't work as expected before (for instance in Markdown lists).

### TableCleaner

I use it to align tables/data that I write. Very useful when trying to organise
some data or when writing LaTeX or Markdown tables.

### Tag

Extra support for writing HTML tags, makes writing HTML much easier and faster.
It helps with closing tags, adds autocompletion for HTML tags using *Tab* etc.

## Personal settings

I will not list my full settings (which include dictionaries etc.) or settings
for individual addons, but rather just the base settings I think might be
useful to everyone.

    {
        "ensure_newline_at_eof_on_save": true,
        "fallback_encoding": "UTF-8",
        "hot_exit": false,
        "remember_open_files": false,
        "rulers":
        [
            79
        ],
        "tab_size": 4,
        "translate_tabs_to_spaces": true,
        "trim_trailing_white_space_on_save": true
    }

The settings are more or less self explanatory - I make sure to always use
spaces instead of tabs (one tab equals to 4 spaces), ensure a newline at the
end of file and trim trailing white space on save.

I also disabled "hot exit", which closes without prompting to save and
preserves your changes until you open Sublime Text 2 again. This, in addition
to disabling the "remember_open_files" option makes sure I always start with a
clean editor (unless it crashed, where everything is still preserved and all
windows are reopened).

I also set a ruler to 79 characters for keeping with Python coding standards.
