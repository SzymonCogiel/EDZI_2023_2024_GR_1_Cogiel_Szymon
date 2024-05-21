from Proj_2.src.scrapers.base_scraper import BaseScraper
from typing import List
import re
from Proj_2.src.schemas.job_offer import JobOffer
from Proj_2.src.utils.helpers import remove_non_ascii
from typing import Callable
from Proj_2.src.analysis.job_offer_summarizer import JobOfferSummarizer


class PracujPlScraper(BaseScraper):
    OFFER_CLASS = 'default-offer'
    POSITIONED_OFFER_CLASS = 'positioned-offer'

    DEFAULT_SOURCE = 'it.pracuj.pl'
    DEFAULT_LOCATION = 'Cracow'
    DEFAULT_CATEGORY = 'BigData/Data Science'

    CURRENCY_MAP = {
        'ZŁ': 'PLN',
        'EUR': 'EUR',
        'USD': 'USD'
    }

    STANDARD_WORK_HOURS_PER_MONTH = 168

    SENIORITY_MAP = {
        'Specjalista (Mid / Regular)': 'Mid/Regular',
        'Młodszy specjalista (Junior)': 'Junior',
        'Senior Specialista (Senior)': 'Senior'
    }

    def __init__(self, headers: dict = None, summarizer: Callable = JobOfferSummarizer()):
        super().__init__(headers=headers)
        self._soup = None
        self.summarizer = summarizer

    def _is_offer(self, tag):
        return tag.name == 'div' and tag.get('data-test') in [self.OFFER_CLASS, self.POSITIONED_OFFER_CLASS]

    def find_all_offers(self) -> List[JobOffer]:
        offers_data = []
        offers = self._soup.find_all(self._is_offer)
        for offer in offers:
            salary_str = offer.find('span', {'data-test': 'offer-salary'}).text
            company_name = offer.find('h4', {'data-test': 'text-company-name'}).text.strip()
            a_title = offer.find('h2', {'data-test': 'offer-title'}).a
            position = a_title.text.strip()
            link = a_title['href']
            ul_element = offer.find('ul', class_='tiles_bv2t2w7')
            detailed_page_soup = self.fetch_soup(link)
            location = detailed_page_soup.find('div', {'data-test': 'offer-badge-title', 'class': 't1g3wgsd'}).text
            skills_div = detailed_page_soup.find('div', {'data-test': 'section-technologies-expected'})
            skills_li = skills_div.find_all('li', {'data-test': 'item-technology'}) if skills_div else None
            skills_technologies = [skill.text for skill in skills_li] if skills_li else []
            salary_pattern = re.compile(
                r"(\d+\s?\d*)–(\d+\s?\d*)\s*(\w+)\s*(netto|brutto)?(?:\s*\(\+\s*VAT\))?\s*/\s*(godz\.|mies\.)")

            section_about_project = detailed_page_soup.find('section', {'data-test': 'section-about-project'}).text
            section_about_project = section_about_project if section_about_project else ''
            section_responsibilities = detailed_page_soup.find('section', {'data-test': 'section-responsibilities'}).text
            section_responsibilities = section_responsibilities if section_responsibilities else ''
            section_requirements = detailed_page_soup.find('section', {'data-test': 'section-requirements'}).text
            section_requirements = section_requirements if section_requirements else ''

            text_to_summary = section_about_project + section_responsibilities + section_requirements
            summary = self.summarizer(text_to_summary)

            match = salary_pattern.search(salary_str)
            if match:
                minimum_salary = self._clean_and_convert_to_int(match.group(1))
                maximum_salary = self._clean_and_convert_to_int(match.group(2))
                currency = self.CURRENCY_MAP.get(match.group(3).upper(), 'PLN')
                # netto_or_brutto = match.group(4)
                salary_type = match.group(5)

                if salary_type == 'godz.':
                    minimum_salary *= self.STANDARD_WORK_HOURS_PER_MONTH
                    maximum_salary *= self.STANDARD_WORK_HOURS_PER_MONTH

                raw_seniority = ul_element.contents[0].text.strip() if ul_element else 'Mid/Regular'
                seniority = self.SENIORITY_MAP.get(raw_seniority, 'Senior')

                job_offer = JobOffer(
                    source=self.DEFAULT_SOURCE,
                    link=link,
                    position=remove_non_ascii(position),
                    location=location,
                    company_name=remove_non_ascii(company_name),
                    minimum_salary=minimum_salary,
                    maximum_salary=maximum_salary,
                    currency=currency,
                    skills_technologies=skills_technologies,
                    category=self.DEFAULT_CATEGORY,
                    seniority=seniority,
                    summary=summary
                )
                offers_data.append(job_offer)
        return offers_data

    def scrap(self, url: str) -> List[JobOffer]:
        self._soup = self.fetch_soup(url)
        return self.find_all_offers()
