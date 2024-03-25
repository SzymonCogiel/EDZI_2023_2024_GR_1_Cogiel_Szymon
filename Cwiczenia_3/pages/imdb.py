import re

import requests
from bs4 import BeautifulSoup
from requests.exceptions import SSLError, ConnectionError, Timeout, TooManyRedirects
from utils.decorators import check_robots_permission


def fetch_soup(url, headers):
    try:
        response = requests.get(url, headers=headers)
    except (SSLError, Timeout, TooManyRedirects, ConnectionError) as e:
        print(str(e))
        return None

    if response.status_code == 200:
        return BeautifulSoup(response.text, 'html.parser')
    else:
        print(f"Nie udało się pobrać strony. Kod statusu: {response.status_code}")
        return None


def extract_ratings(soup, rating_class):
    rating_spans = soup.find_all('span', class_=rating_class)
    return [span.get('aria-label') for span in rating_spans]


def extract_titles(soup, title_class):
    titles = soup.find_all(class_=title_class)
    return [title.text for title in titles]


def extract_years(soup, year_div_class):
    div_years = soup.find_all(class_=year_div_class)
    years = []
    for div_year in div_years:
        spans = div_year.find_all('span')
        years.append(int(spans[0].text))
    return years


def filter_records(records, pattern):
    return [record for record in records if re.match(pattern, record)]


def clean_titles(titles, pattern):
    return [re.sub(pattern, "", title) for title in titles]


@check_robots_permission
def fetch_imdb_top(url: str = 'https://www.imdb.com/chart/top/?ref_=nv_mv_250', top: int = 100):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', # noqa
        'Accept-Language': 'en-US,en;q=0.9'}
    title_class = 'ipc-title__text'
    rating_class = 'ipc-rating-star ipc-rating-star--base ipc-rating-star--imdb ratingGroup--imdb-rating'
    year_div_class = 'sc-b0691f29-7 hrgukm cli-title-metadata'

    soup = fetch_soup(url, headers)
    if soup:
        ratings_aria_label = extract_ratings(soup, rating_class)
        titles = extract_titles(soup, title_class)[:top + 2]

        pattern_ratings = r'IMDb rating: (\d+\.\d+)'
        extracted_ratings = [float(match.group(1)) for rating_text in ratings_aria_label if
                             (match := re.search(pattern_ratings, rating_text))]

        pattern_records = r'^\d+\.'
        filtered_records = filter_records(titles, pattern_records)

        pattern_clean = r'^\d+\.\s*'
        cleaned_movies = clean_titles(filtered_records, pattern_clean)
        years = extract_years(soup, year_div_class)

        return cleaned_movies, extracted_ratings, years
