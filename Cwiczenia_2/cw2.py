from Cwiczenia_2.scraper import LinkScraper

if __name__ == '__main__':
    s = LinkScraper(url='https://en.wikipedia.org/wiki/Zinc')
    print(s.randomly_scrap())
    print(s.get_absolute_links(s.page_url.children))
