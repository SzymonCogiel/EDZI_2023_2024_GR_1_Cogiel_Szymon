import requests
from requests.exceptions import SSLError, Timeout, TooManyRedirects, ConnectionError


class NBPScraper:
    BASE_NBP_API_URL = 'http://api.nbp.pl/api'
    TABLE = 'a'

    def __init__(self, headers: str = None):
        self.headers = headers

    def fetch(self, code, number_of_last_prices):
        url = f'{self.BASE_NBP_API_URL}/exchangerates/rates/{self.TABLE}/{code}/last/{number_of_last_prices}/?format=json'
        try:
            response = requests.get(url, headers=self.headers)
        except (SSLError, Timeout, TooManyRedirects, ConnectionError) as e:
            raise e
        return response.json()