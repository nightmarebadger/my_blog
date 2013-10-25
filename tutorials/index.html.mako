## -*- coding: utf-8 -*-
<%
    file = open('tutorials/Pyglet.md')
    s = u''
    flag = False
    for line in file:
        line = line.decode('utf8')
        if line.startswith('    '):
            if not flag:
                s += u'$$code(lang=python)\n'
                flag = True
            s += line[4:]
        elif not line.startswith('    '):
            s += line
            if flag:
                s += u'$$/code\n'
                flag = False
%>

<%inherit file="_templates/site.mako" />

<article class="page_box">
<%self:filter chain="syntax_highlight, markdown">

${s}

</%self:filter>
</article>
