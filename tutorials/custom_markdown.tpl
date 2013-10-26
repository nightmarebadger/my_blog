{% extends 'markdown.tpl' %}

{% block input %}
$$code(lang=python)
{{ cell.input }}
$$/code
{% endblock input %}
