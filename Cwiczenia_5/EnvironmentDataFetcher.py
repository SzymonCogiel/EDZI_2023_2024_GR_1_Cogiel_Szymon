from functools import partial
from typing import Literal

import requests


class EnvironmentDataFetcher:
    BASE_URL = 'https://danepubliczne.imgw.pl/api/data/'

    def __init__(self):
        self.fetch_data_opady = partial(self.fetch, data_type='opad')
        self.fetch_data_klimat = partial(self.fetch, data_type='klimat')
        self.fetch_data_synop = partial(self.fetch, data_type='synop')

    def fetch(self, data_type: Literal['opad', 'klimat', 'synop'] = 'synop'):
        url = self.BASE_URL + data_type
        response = requests.get(url)
        return response.json()
