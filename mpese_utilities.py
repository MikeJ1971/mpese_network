import networkx as nx


def texts(graph):
    """ Extract the text nodes """
    return [n for n, a in graph.node.items() if a['type'] == 'text']


def texts_x_witness(graph, x=1):
    """ Extract texts that only have x witness. By default we show 1. """

    # text nodes
    text_nodes = texts(graph)

    # nodes with 1 witness (will include lots of MS)
    witness_nodes = [node for node, degree in graph.degree() if degree == x]

    # get just the texts
    return set(text_nodes) & set(witness_nodes)


def text_url(file, base="https://mpese.ac.uk/t/"):
    """ Take an XML filename for a text and return a full URL """
    html_file = file.replace(".xml", ".html")
    return base + html_file
