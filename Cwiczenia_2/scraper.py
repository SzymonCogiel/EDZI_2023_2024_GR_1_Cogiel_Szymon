from playwright.sync_api import sync_playwright
from numpy.random import randint
from Cwiczenia_2.models import PageUrl


class LinkScraper:
    def __init__(self, url: str):
        self.page_url: PageUrl = PageUrl(url=url)
        self.urls = []
        self.parent_url: PageUrl = self.page_url

    def randomly_scrap(self, links_count: int = 100):
        with sync_playwright() as playwright:
            browser = playwright.chromium.launch(headless=True)
            page = browser.new_page()

            while True:
                links = self.scrap_links_locators(page)
                amount_of_links = links.count()

                if amount_of_links == 0:
                    self.page_url = self.page_url.parent
                    continue

                for index in range(amount_of_links):
                    link = links.nth(index).get_attribute('href')
                    self.urls.append(link)
                    self.page_url.add_child(url=link)

                    if len(self.urls) >= links_count:
                        return self.urls

                self.page_url = self.page_url.children[randint(0, len(self.page_url.children))] if len(
                    self.parent_url.children) > 1 else self.page_url.parent.children[randint(0, len(self.page_url.children))]

    def scrap_links_locators(self, page):
        try:
            page.goto(self.page_url.url)
        except Exception as e:
            print(str(e))
            page.goto(self.page_url.parent.children[randint(0, len(self.page_url.children))].url)
        return page.locator('a')

    def get_absolute_links(self, children):
        links = []
        for child in children:
            if isinstance(child, PageUrl):
                links.append(child.url)
            if child.children:
                links.extend(self.get_absolute_links(child))
        return links
