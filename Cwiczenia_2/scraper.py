import requests
from requests.exceptions import SSLError, ConnectionError
from bs4 import BeautifulSoup

from numpy.random import randint
from Cwiczenia_2.models import PageUrl


class LinkScraper:
    def __init__(self, url: str):
        self.page_url: PageUrl = PageUrl(url=url)
        self.urls = []
        self.root_url: PageUrl = self.page_url

    def randomly_scrap(self, links_count: int = 100):
        while True:
            links = self.scrap_links_locators()

            if len(links) == 0:
                self.page_url = self.page_url.parent
                continue

            for link in links:
                link = link['href']
                self.urls.append(link)
                self.page_url.add_child(url=link)

                if len(self.urls) >= links_count:
                    return self.urls

            self.page_url = self.page_url.children[randint(0, len(self.page_url.children))] if len(
                self.root_url.children) > 1 else self.page_url.parent.children[randint(0, len(self.page_url.children))]

    def scrap_links_locators(self):
        try:
            response = requests.get(self.page_url.url)
        except SSLError as e:
            return self.request_exception_handling(e)
        except ConnectionError as e:
            return self.request_exception_handling(e)
        self.page_url.invalid = 'Valid'

        bs = BeautifulSoup(response.text, 'html.parser')
        return bs.find_all('a', href=True)

    def get_absolute_links(self, children):
        links = []
        for child in children:
            if isinstance(child, PageUrl):
                links.append(child.url)
                if child.invalid:
                    print(child.invalid)
            if child.children:
                links.extend(self.get_absolute_links(child))
        return links

    def request_exception_handling(self, e):
        print(str(e))
        error_type = str(e.__class__.__name__)
        self.page_url.invalid = error_type

        if self.page_url.url == self.root_url.url:
            raise Exception(f'Invalid root link: {error_type}')

        self.page_url = self.page_url.parent
        return self.scrap_links_locators()
