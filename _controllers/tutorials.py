import os
from blogofile.cache import bf

# We need this inside the eval to get the dates
from datetime import date

config = {"name": "Tutorials controller",
          "description": """
                         Builds html files with disqus commenting enabled
                         from markdown tutorial files. Also builds an index.
                         """,
          "priority": 40.0}

tutorials_dir_base = os.path.join("tutorials", "base")
tutorials_dir = os.path.join("tutorials")


def run():
    tutorials_data, tutorials_chains = read_tutorials()
    write_tutorials(tutorials_data, tutorials_chains)
    write_tutorials_index(tutorials_data)


def read_tutorials():
    """
    Read the tutorials data from the tutorials_data.txt file and generate .html
    names from the .md ones.

    :returns: Tutorials data
    :rtype:   Dictionary
    """
    with open(os.path.join(tutorials_dir_base, 'tutorials_data.txt')) as f:
        tutorials_data = eval(f.read())
    with open(os.path.join(tutorials_dir_base, 'tutorials_chains.txt')) as c:
        tutorials_chains = eval(c.read())
    return tutorials_data, tutorials_chains


def write_tutorials(tutorials_data, tutorials_chains):
    """
    Write .html files from .md ones.

    :param    tutorials_data: Tutorials data
    :type     tutorials_data: Dictionary
    """
    for name, tutorial in tutorials_data.iteritems():

        chain = [i for i in tutorials_chains if name in i]
        previous_tutorial = next_tutorial = None
        if chain:
            chain = chain[0]
            current_tut_chain_pos = chain.index(name)
            if current_tut_chain_pos == 0:
                next_tutorial = (chain[1], tutorials_data[chain[1]])
            elif current_tut_chain_pos == len(chain) - 1:
                previous_tutorial = (chain[-2], tutorials_data[chain[-2]])
            else:
                next_tutorial = (
                    chain[current_tut_chain_pos + 1],
                    tutorials_data[chain[current_tut_chain_pos + 1]]
                )
                previous_tutorial = (
                    chain[current_tut_chain_pos - 1],
                    tutorials_data[chain[current_tut_chain_pos - 1]]
                )

        chain = [(i, tutorials_data[i]) for i in chain]

        bf.template.materialize_template(
            "tutorial.mako",
            os.path.join(tutorials_dir, tutorial['filename']),
            {
                "tutorial": tutorial,
                "chain": chain,
                "name": name,
                "previous_tutorial": previous_tutorial,
                "next_tutorial": next_tutorial,
            }
        )


def write_tutorials_index(tutorials_data):
    bf.template.materialize_template(
        "tutorial_index.mako",
        os.path.join(tutorials_dir, "index.html"),
        {"tutorials_data": tutorials_data}
    )
