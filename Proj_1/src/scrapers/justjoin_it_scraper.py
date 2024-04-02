from typing import List
from urllib.parse import urljoin

from Proj_1.src.models.job_offer import JobOffer
from Proj_1.src.scrapers.base_scraper import BaseScraper
from Proj_1.src.utils.helpers import remove_non_ascii


class JustJoinItScraper(BaseScraper):

    DEFAULT_SOURCE = 'justjoin.it'
    DEFAULT_LOCATION = 'Cracow'
    DEFAULT_CATEGORY = 'Data'

    SENIORITY_MAP = {
        'mid': 'Mid/Regular',
        'junior': 'Junior',
        'senior': 'Senior'
    }
    CURRENCY_MAP = {
        'ZŁ': 'PLN',
        'EUR': 'EUR',
        'USD': 'USD'
    }

    def __init__(self, headers: dict = None):
        super().__init__(headers=headers)
        self._soup = None

    def scrap(self, url) -> List[JobOffer]:
        self._soup = self.fetch_soup(url)
        return self.find_all_offers(url=url)

    def find_all_offers(self, url: str) -> List[JobOffer]:
        offers = self._soup.find_all('div', attrs={'data-index': True,
                                                   'data-known-size': True,
                                                   'data-item-index': True})
        seniority = url.split('/experience-level_')[1].split('/')[0]
        offers_data = []
        for offer in offers:
            salary_range_with_currency = offer.find('div', class_='css-17pspck')
            salary_list = [tag.text for tag in salary_range_with_currency.contents if tag.name == 'span']
            minimum_salary = self._clean_and_convert_to_int(salary_list[0])
            maximum_salary = self._clean_and_convert_to_int(salary_list[1])
            currency = salary_list[2]
            position = offer.find('h2', class_='css-1gehlh0').text
            company_name = offer.find('div', class_='css-aryx9u').text
            # location = offer.find('div', class_='css-11qgze1').text
            url_path = offer.find('a', class_='offer_list_offer_link css-4lqp8g').attrs.get('href', '')
            link = urljoin(url, url_path)
            detailed_page_soup = self.fetch_soup(link)
            skills_div = detailed_page_soup.find_all('div', class_='css-cjymd2')
            skills_technologies = [skill_div.find('h6').text for skill_div in skills_div] if skills_div else []
            job_offer = JobOffer(
                source=self.DEFAULT_SOURCE,
                link=link,
                position=remove_non_ascii(position),
                location=self.DEFAULT_LOCATION,
                company_name=remove_non_ascii(company_name),
                minimum_salary=minimum_salary,
                maximum_salary=maximum_salary,
                currency=self.CURRENCY_MAP.get(currency, 'PLN'),
                skills_technologies=skills_technologies,
                category=self.DEFAULT_CATEGORY,
                seniority=self.SENIORITY_MAP.get(seniority, '')
            )
            offers_data.append(job_offer)
        return offers_data
