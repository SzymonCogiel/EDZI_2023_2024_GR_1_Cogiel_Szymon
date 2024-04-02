import re
from abc import ABC, abstractmethod
from typing import List

import requests
from bs4 import BeautifulSoup
from requests.exceptions import SSLError, ConnectionError, Timeout, TooManyRedirects

from Proj_1.src.models.job_offer import JobOffer
from Proj_1.src.utils.helpers import validate_robots_permission


class BaseScraper(ABC):

    def __init__(self, headers: dict = None):
        self.headers = headers

    @abstractmethod
    def scrap(self, url):
        pass

    @abstractmethod
    def find_all_offers(self, **kwargs) -> List[JobOffer]:
        pass

    @validate_robots_permission(is_pre_valid=True)
    def fetch_soup(self, url) -> BeautifulSoup:
        try:
            response = requests.get(url, headers=self.headers)
        except (SSLError, Timeout, TooManyRedirects, ConnectionError) as e:
            raise e

        if response.status_code == 200:
            return BeautifulSoup(response.text, 'html.parser')
        else:
            raise Exception(f"Fetch page failed. Status code: {response.status_code}")

    def _clean_and_convert_to_int(self, string: str) -> int: # noqa
        clean_str = re.sub(r'[^0-9]', '', string)
        return int(clean_str.strip())
