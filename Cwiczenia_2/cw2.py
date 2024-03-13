from Cwiczenia_2.scraper import LinkScraper

if __name__ == '__main__':
    s = LinkScraper(url='https://home.agh.edu.pl/~dwornik/')
    print(s.randomly_scrap())
    links = s.get_absolute_links(s.page_url.children)
    print(links)
