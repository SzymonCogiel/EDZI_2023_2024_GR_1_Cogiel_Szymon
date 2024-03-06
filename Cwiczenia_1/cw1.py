"""
Author: Szymon Cogiel
Date: 06.03.2024

Description:
This script was created for web scraping classes. Its main purpose is to demonstrate
data extraction techniques using Python, specifically fetching and processing the content
of web pages. This code is intended solely for educational purposes and has been made as
part of the teaching materials for the course.

The use of this code outside the educational context requires the author's consent.
"""

import requests
from bs4 import BeautifulSoup
from re import sub
from collections import Counter


def get_text(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    content = soup.find('div', class_='mw-parser-output').text
    return content


def process_text(text):
    text = text.lower()
    text = sub(r'[^0-9a-ząćęłńóśźż_\s]', '', text)
    return text


def get_ranked_words(text):
    words = text.split()
    word_counts = Counter(words)
    ranked_words = word_counts.most_common(100)
    return ranked_words


def write_results(results, filename):
    with open(filename, 'w', encoding='utf-8') as file:
        for rank, (word, count) in enumerate(results, start=1):
            file.write(f'{rank};{word};{count}\n')


def main():
    url = 'https://en.wikipedia.org/wiki/Web_scraping'
    text = get_text(url)
    cleaned_text = process_text(text)
    final_words = get_ranked_words(cleaned_text)
    write_results(final_words, 'output.txt')


if __name__ == "__main__":
    main()
