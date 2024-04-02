import os.path

from Proj_1.src.scrapers.justjoin_it_scraper import JustJoinItScraper
from Proj_1.src.scrapers.pracuj_pl_scraper import PracujPlScraper
from Proj_1.src.serializers.job_offer import JobOfferSerializer

if __name__ == '__main__':
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', # noqa
        'Accept-Language': 'en-US,en;q=0.9'}
    print('=======PRACUJ_PL=====' * 4)
    offer_list = []
    scraper = PracujPlScraper(headers=None)
    jobs = scraper.scrap('https://it.pracuj.pl/praca/krakow;wp?rd=0&et=17%2C4%2C18&sal=1&its=big-data-science&iwhpl=false')
    print(len(jobs))
    offer_list.extend(jobs)
    for job in jobs:
        print(job)
    print('=======JUST_JOIN_IT=====' * 4)
    for seniority in ['junior', 'mid', 'senior']:
        print(f'======={seniority}=====' * 4)
        scraper = JustJoinItScraper()
        jobs = scraper.scrap(f'https://justjoin.it/krakow/data/experience-level_{seniority}/with-salary_yes')
        offer_list.extend(jobs)
        print(len(jobs))
        for job in jobs:
            print(job)
    print(len(offer_list))
    file_path = os.path.join('data', 'job_offers.json')
    jos = JobOfferSerializer()
    jos.list_to_json(offer_list, file_path)
