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
    write_tutorials(tutorials_data)
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

def write_tutorials(tutorials_data):
    """
    Write .html files from .md ones.

    :param    tutorials_data: Tutorials data
    :type     tutorials_data: Dictionary
    """
    for tutorial in tutorials_data.itervalues():
        bf.template.materialize_template(
            "tutorial.mako",
            os.path.join(tutorials_dir, tutorial['htmlname']),
            {"tutorial": tutorial}
        )

def write_tutorials_index(tutorials_data):
    bf.template.materialize_template(
        "tutorial_index.mako",
        os.path.join(tutorials_dir, "index.html"),
        {"tutorials_data": tutorials_data}
    )
