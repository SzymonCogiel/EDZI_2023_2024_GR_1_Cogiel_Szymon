import os

from Proj_1.src.serializers.job_offer import JobOfferSerializer
from Proj_2.src.analysis.job_offer_summarizer import JobOfferSummarizer
from Proj_2.src.scrapers.async_justjoin_it_scraper_v2 import JustJoinItScraper
from Proj_2.src.scrapers.pracuj_pl_scraper import PracujPlScraper
from Proj_2.src.utils.database_utils import create_offer


def scrap_offer(headers=None):
    job_offers_list = []
    summarizer = JobOfferSummarizer()
    scraper = PracujPlScraper(headers=headers, summarizer=summarizer)

    jobs = scraper.scrap('https://it.pracuj.pl/praca/krakow;wp?rd=0&et=17%2C4%2C18&sal=1&its=big-data-science&iwhpl=false')

    job_offers_list.extend(jobs)

    for seniority in ['junior', 'mid', 'senior']:
        scraper = JustJoinItScraper(
            headers=headers,
            summarizer=summarizer,
            url=f'https://justjoin.it/krakow/data/experience-level_{seniority}/with-salary_yes'
        )
        jobs = scraper.scrap()
        job_offers_list.extend(jobs)

    offers_file_path = os.path.join('../data', 'job_offers.json')
    jos = JobOfferSerializer()
    jos.list_to_json(job_offers_list, offers_file_path)

    for job_offer in job_offers_list:
        create_offer(job_offer)


if __name__ == '__main__':
    scrap_offer()
