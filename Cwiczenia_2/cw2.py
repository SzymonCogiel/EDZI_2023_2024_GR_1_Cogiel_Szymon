from graphviz import Digraph

from Cwiczenia_2.scraper import LinkScraper


def visualize_tree(node, graph=None):
    if graph is None:
        graph = Digraph()

    # Replace characters in URL to avoid Graphviz warnings related to ports
    node_id = str(node.url).replace(':', '_').replace('/', '_')
    graph.node(name=node_id, label=str(node.url))

    for child in node.children:
        child_id = str(child.url).replace(':', '_').replace('/', '_')
        graph.node(name=child_id, label=str(child.url))
        graph.edge(node_id, child_id)
        visualize_tree(child, graph)

    return graph


if __name__ == '__main__':
    s = LinkScraper(url='https://polon.nauka.gov.pl/aktualnosci/page/74/ ')

    links = s.randomly_scrap(100)
    absolute_links = s.get_absolute_links(s.root_url.children)
    print(links)
    print(absolute_links)

    dot = visualize_tree(s.root_url)
    dot.render('tree_visualization', view=True)
