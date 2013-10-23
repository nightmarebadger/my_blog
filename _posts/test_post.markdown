---
categories: Test
date: 2009/03/09 13:09:05
tags: 'tag1, tag2'
title: Test syntax highlighting
---
<p>
This tests some syntax highlighting, using the
<a href="http://github.com/EnigmaCurry/blogofile.com/blob/master/_filters/syntax_highlight.py">
syntax highlight</a> filter based on <a href="http://pygments.org">pygments</a>:
</p>

<p>Some Python, in the default <i>murphy</i> style:
$$code(lang=python)
def test():
    for x in "Hello, Python!":
        print x.upper(),
    print "done"
$$/code
</p>

<p>
Some Haskell, with line numbers turned on:

$$code(lang=haskell, linenums=true)
hamming = 1 : map (2*) hamming `merge` map (3*) hamming `merge` map (5*) hamming
     where merge (x:xs) (y:ys)
            | x < y = x : xs `merge` (y:ys)
            | x > y = y : (x:xs) `merge` ys
            | otherwise = x : xs `merge` ys
$$/code

</p>

<p>
Some javascript, using the <i>monokai</i> style and line numbers on:

$$code(lang=javascript, style=monokai, linenums=true)
document.write("<h1>This is a header</h1>");
$(document).ready(function(){
   $("a").click(function(event){
       alert("jQuery is cool!");
   });
});
$$/code

</p>
<p>
  Some plain HTML:

$$code(lang=html)
    <h1>This is a test</h1>
    <p>
      This is <a href="http://www.blogofile.com">Blogofile</a>.
    </p>
    <p>
      Notice how in the source, <tags> don't have to be re-written
      with HTML entities like some syntax highlighters out there.
    </p>
$$/code

</p>
