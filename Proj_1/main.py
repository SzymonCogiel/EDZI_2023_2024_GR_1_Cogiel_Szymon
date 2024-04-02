import os.path
import json
from itertools import islice
from Proj_1.src.analysis.plots import hist_plot, position_plot
import pandas as pd

from Proj_1.src.scrapers.justjoin_it_scraper import JustJoinItScraper
from Proj_1.src.scrapers.pracuj_pl_scraper import PracujPlScraper
from Proj_1.src.serializers.job_offer import JobOfferSerializer
from Proj_1.src.analysis.processing import calculate_frequency, calculate_statistic_per_position


def scrap_offer(file_path: str, headers=None):
    offer_list = []
    scraper = PracujPlScraper(headers=headers)
    jobs = scraper.scrap('https://it.pracuj.pl/praca/krakow;wp?rd=0&et=17%2C4%2C18&sal=1&its=big-data-science&iwhpl=false')

    offer_list.extend(jobs)

    for seniority in ['junior', 'mid', 'senior']:
        scraper = JustJoinItScraper()
        jobs = scraper.scrap(f'https://justjoin.it/krakow/data/experience-level_{seniority}/with-salary_yes')
        offer_list.extend(jobs)

    jos = JobOfferSerializer()
    jos.list_to_json(offer_list, file_path)


def analyze_offers(offers_file_path):
    with open(offers_file_path, 'r') as file:
        offers = json.load(file)
    # a)
    skill_freq = calculate_frequency(offers)
    first_10_elements = dict(islice(skill_freq.items(), 10))
    hist_plot(first_10_elements)

    # b)
    df = pd.read_json(offers_file_path)
    calculate_statistic_per_position(df)

    data = pd.read_csv('data/positions_stats.csv')
    position_plot(data)


if __name__ == '__main__':
    offers_file_path = os.path.join('data', 'job_offers.json')

    scrap_offer(offers_file_path)
    analyze_offers(offers_file_path)
