import numpy as np

from Cwiczenia_2.scraper import LinkScraper

if __name__ == '__main__':
    s = LinkScraper(url='https://www.onet.pl/')
    links = s.randomly_scrap(100)
    absolute_links = s.get_absolute_links(s.root_url.children)
    print(links)
    print(absolute_links)
