import os
from blogofile.cache import bf

# We need this inside the eval to get the dates
from datetime import date

config = {"name"        : "Tutorials controller",
          "description" : """
                            Builds html files with disqus commenting enabled
                            from markdown tutorial files. Also builds an index.
                          """,
          "priority"    : 40.0}

tutorials_dir = os.path.join("tutorials")

def run():
    tutorials_data = read_tutorials()
    tutorials_names = [(i['filename'], i['htmlname'])
                       for i in tutorials_data.itervalues()]
    write_tutorials(tutorials_names)
    write_tutorials_index(tutorials_data)

def read_tutorials():
    """
    Read the tutorials data from the tutorials_data.txt file and generate .html
    names from the .md ones.

    :returns: Tutorials data
    :rtype:   Dictionary
    """
    with open(os.path.join(tutorials_dir, 'tutorials_data.txt')) as f:
        tutorials_data = eval(f.read())
    for i in tutorials_data.itervalues():
        i['htmlname'] = i['filename'].rstrip('.md') + '.html'
    return tutorials_data

def write_tutorials(tutorials_names):
    """
    Write .html files from .md ones.

    :param    tutorials_names: File and HTML names
    :type     tutorials_names: Tuple
    """
    for file_name, html_name in tutorials_names:
        bf.template.materialize_template(
            "tutorial.mako",
            os.path.join(tutorials_dir, html_name),
            {"tutorial_name": file_name,
             "tutorial_htmlname": html_name,
            }
        )

def write_tutorials_index(tutorials_data):
    bf.template.materialize_template(
        "tutorial_index.mako",
        os.path.join(tutorials_dir, "index.html"),
        {"tutorials_data": tutorials_data}
    )
