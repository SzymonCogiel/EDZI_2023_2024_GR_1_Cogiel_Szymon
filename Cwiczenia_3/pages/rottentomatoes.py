import requests
from bs4 import BeautifulSoup
from fuzzywuzzy import fuzz
from requests.exceptions import SSLError, ConnectionError, Timeout, TooManyRedirects

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', # noqa
    'Accept-Language': 'en-US,en;q=0.9'}


def fetch_tomatometer_score(url, title, year):
    try:
        try:
            response = requests.get(url, headers=headers)
        except (SSLError, Timeout, TooManyRedirects, ConnectionError) as e:
            print(str(e))
            return ''

        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            movies_div = soup.find_all('search-page-media-row', releaseyear=str(year))
            movies_div.extend(soup.find_all('search-page-media-row', releaseyear=str(year + 1)))
            movies_div.extend(soup.find_all('search-page-media-row', releaseyear=str(year - 1)))
            movie_candidates = {}

            # Cases ('The Godfather Part II', '96'), ('Se7en', '83'), ('Léon: The Professional', '74'), ('Harakiri', '100')
            if len(movies_div) == 1:
                return movies_div[0].attrs.get('tomatometerscore', '')

            for movie_div in movies_div:
                tomatoe_div = movie_div.find('a', slot="title",
                                             string=lambda text: text and text.strip().lower() == title.lower())
                if not tomatoe_div:
                    continue
                tomatoe_title = tomatoe_div.text
                tomatoe_title = tomatoe_title.strip().lower()
                if tomatoe_title:
                    # Case ('Coco', '97')
                    if movie_div.get('tomatometerscore', '') == '':
                        continue
                    movie_candidates[title] = movie_div.get('tomatometerscore', '')
            best_ratio = 0
            tomatoe_score = None
            for candidate_title in movie_candidates.keys():
                candidate_ratio = fuzz.ratio(title, candidate_title)
                if best_ratio < candidate_ratio:
                    tomatoe_score = movie_candidates[candidate_title]
                    best_ratio = candidate_ratio
            if tomatoe_score == '':
                media_row = soup.find(lambda tag: tag.name == 'search-page-media-row' and
                                                  tag.find('a', slot="title", text=lambda
                                                      text: text and text.strip().lower() == title.lower()))  # noqa
                if media_row:
                    # If any matching rating is found, extract the 'tomatometerscore' attribute
                    tomatoe_score = media_row.get('tomatometerscore', '')
            return tomatoe_score if tomatoe_score else ''
    except Exception as e:
        print(f"Error fetching or parsing {url}: {e}")
    return ''
