---
categories: python
date: 2013/12/21 23:37:00
title: Python in the wide world week - day 6, Science
---

Today, we will not be looking at a particular program, but rather at a field
where Python is used more and more - science (of course it's especially used in
[physical science](http://en.wikipedia.org/wiki/Outline_of_physical_science)
and [applied science](http://en.wikipedia.org/wiki/Applied_science)).

More and more people are switching to Python for scientific purposes (look at
[this list](http://www.python.org/about/success/#scientific) to see some of the
possible uses).

## Why would you use Python in science?

Why would someone use Python instead of things like
[Mathematica](http://www.wolfram.com/mathematica/),
[MatLab](http://www.mathworks.com/products/matlab/),
[R](http://www.r-project.org/), [Octave](http://www.gnu.org/software/octave/)
etc.?

### Price

First of all, Python is free, which is often not the case with other software.
For personal use, the prices are not *that* steep, especially for students, but
if you want to use it professionally, the price quickly becomes big enough that
smaller businesses or startups just cannot afford it (for instance, Mathematica
"home" edition is 295€, the "Standard" edition is 3.185€ and the "Enterprise"
edition is 8.920€ at the time of writing[^1])

### Readability

Readability was a primary consideration when Python's syntax was designed. You
can often hear the joke that turning pseudo-code into Python code is just a
matter of correct indentation. This is very important in collaboration, as it
is much easier for other people (especially beginners) to understand your code
and contribute to it if they don't first need to take a few days off to
understand what it does.

### Language interoperability

Python is often used to glue other languages together and this can really come
in handy. For instance, let's say you already have some code that will solve
this particular part of the problem really fast, but it's written in FORTRAN,
and R would be perfect to then parse that data easily and quickly.

If you're using something besides Python, you will need to re-create those
functions / tools in the language you're using, or come up with a different
way. In Python however, you can simply use
[F2PY](http://cens.ioc.ee/projects/f2py2e/) and
[RPY2](http://rpy.sourceforge.net/rpy2.html) and use the scripts you already
have.

### Balancing high level and low level coding

As Python is a high-level programming language it often times means that some
things will naturally be slower then when written in a low-level language such
as C. There are many way around that - for instance, you could use
[Cython](http://cython.org/) to statically type variables (you do something
like `cdef int x` to declare `x` as an integer), which gives massive speed-ups,
as typed variables are treated using low-level types rather then Python
variables.

### Libraries

Python has some great libraries that are great when using Python in science. To
list just a few them that I've personally used:

**_[NumPy/SciPy](http://www.scipy.org/):_**

A pair of amazing libraries for working with arrays, matrix structures, linear
algebra, numerical optimisation, random number generation, Fourier transforms,
image processing and many many more.

I've used these two when trying our 3D graphics using [OpenGL
4](http://www.opengl.org/) in [Pyglet](http://pyglet.org/).

**_[Cython](http://www.cython.org/):_**

As mentioned before, it allows you to make parts of your program faster. Used
it very little apart from testing it out myself.

**_[SQLAlchemy](http://www.sqlalchemy.org/):_**

Essentially a wrapper around an SQL database, it makes working with databases a
breeze with a set of intuitive query operators, especially if you aren't used
to pure SQL commands. Combine it with [sqlite](http://www.sqlite.org/) (which
is embedded in Python's standard library) and you can leverage databases for
scientific work easily.

I've used it when working witk [Kotti](http://kotti.pylonsproject.org/).

**_[IPython](http://ipython.org/):_**

IPython is basically an enhanced Python shell, but it has grown to be much much
more. The IPython notebook is seeing more and more use in scientific circles,
as it allows you to easily make interactive presentations that can be exported
to many formats such as HTML, stripped down HTML (for using it in blogs etc.),
presentations (using [reveal.js](http://lab.hakim.se/reveal-js/#/)), PDF and
many more. It's easy to write your own rules for exporting, so new formats can
be added if you wish to. There are even whole webpages build using only IPython
notebook with a customised HTML export (had a link here but I cannot find it
again :( ).

The [tutorials](/tutorials) on this site are actually made in the notebook -
they are exported to stripped down HTML and used as the base for "tutorial
posts".


[^1]: <http://www.wolfram.com/mathematica/how-to-buy/industry-individuals.html>
