import asyncio
from typing import Dict, List

from playwright.async_api import async_playwright

from Proj_2.src.schemas.job_offer import JobOffer


class APIScraper:
    intercepted_data: Dict = None

    def __init__(self, url):
        self.url = url

    @classmethod
    def _is_offer_api_request(cls, url: str) -> bool:
        return all([
            pattern in url for pattern in ['offers', 'experienceLevels', 'withSalary', 'https://api.justjoin.it/v2/', 'sortBy']
        ])

    async def _check_json(self, response) -> None:
        try:
            if self._is_offer_api_request(response.url):
                body = await response.json()
                if body.get('data', False):
                    self.intercepted_data = body
                else:
                    self.intercepted_data = {'Error': 'Wrong intercepted data'}
        except Exception as e:
            print("Error processing JSON:", e)

    async def scrape_offers(self):
        async with async_playwright() as p:
            browser = await p.chromium.launch()
            page = await browser.new_page()
            page.on('response', self._check_json)
            await page.goto(self.url)
            await page.close()
            await browser.close()
        return self.intercepted_data


class JustJoinItScraper:
    DEFAULT_SOURCE = 'justjoin.it'
    DEFAULT_CATEGORY = 'Data'
    DEFAULT_STREET = 'ul. leca w ch... z biurem w Krk'
    TARGET_CITY = 'Kraków'

    SENIORITY_MAP = {
        'mid': 'Mid/Regular',
        'junior': 'Junior',
        'senior': 'Senior'
    }

    def __init__(self, url):
        self.api_scraper = APIScraper(url)

    async def scrape_data(self):
        return await self.api_scraper.scrape_offers()

    def extract_location(self, offer):

        krakow_location = next(filter(lambda location: location['city'] == self.TARGET_CITY, offer['multilocation']))

        if krakow_location is None:
            return 'To juz napewno leca w ...'

        work_place = offer.get('workplaceType')
        main_office_city = offer.get('city')
        main_office_street = offer.get('street')
        main_office_latitude = offer.get('latitude')
        main_office_longitude = offer.get('longitude')

        cracow_office_street = krakow_location.get('street', 'centrum')
        cracow_latitude_office = krakow_location.get('latitude')
        cracow_longitude_office = krakow_location.get('longitude')

        if work_place == 'remote' and cracow_office_street == 'centrum':
            return f'{self.DEFAULT_STREET} za to mają biuro w {main_office_city} przy ul. {main_office_street}, {main_office_latitude} N {main_office_longitude} E'
        else:
            return f'{cracow_office_street}, {self.TARGET_CITY}, {cracow_latitude_office} N {cracow_longitude_office} E'

    @classmethod
    def is_offers_posted(cls, offers):
        return offers and offers.get('data', False)

    def create_offers(self) -> List[JobOffer]:
        offers = asyncio.run(self.scrape_data())
        return [] if not self.is_offers_posted(offers) else [
            JobOffer(
                source=self.DEFAULT_SOURCE,
                link='https://justjoin.it/offers/' + next(
                    filter(lambda location: location['city'] == self.TARGET_CITY, offer['multilocation'])
                ).get('slug'),
                position=offer.get('title'),
                location=self.extract_location(offer),
                company_name=offer.get('companyName'),
                minimum_salary=offer.get('employmentTypes', {})[0].get('from'),
                maximum_salary=offer.get('employmentTypes', {})[0].get('to'),
                currency=offer.get('employmentTypes', {})[0].get('currency', '').upper(),
                skills_technologies=offer.get('requiredSkills'),
                category=self.DEFAULT_CATEGORY,
                seniority=self.SENIORITY_MAP.get(offer.get('experienceLevel'), '')
            )
            for offer in offers['data']
        ]
