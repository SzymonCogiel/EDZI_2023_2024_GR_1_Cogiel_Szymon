# Ćwiczenie 1: Wprowadzenie do ekstrakcji danych

## Cel:
Celem ćwiczenia jest napisanie kodu w Pythonie, który zapisze do pliku listę stu najczęściej występujących słów na zadaniej stronie Wikipedii. Lista powinna być uszeregowana od największej ilości wystąpień do najmniejszej.

## Kroki do wykonania:
1. **Pobranie zawartości strony internetowej:**
    - Użyj pakietu `requests` w celu pobrania zawartości strony z Wikipedii.
    - Użyj `BeautifulSoup` aby sparsować zawartość kodu HTML.

2. **Procesowanie tekstu:**
    - Przekształć tekst do małych liter (lowercase).
    - Usuń znaki specjalne oraz interpunkcję.

3. **Znajdź 100 najczęściej występujących w tekście słów:**
    - Podziel tekst na słowa.
    - Zlicz ilość wystąpień dla każdego słowa.
    - Znajdź 100 najpopularniejszych w tekście słów.

4. **Zapisz wyniki do pliku tekstowego:**
    - Zapisz rezultaty do pliku tekstowego o nazwie `output.txt` w formacie `ranking;słowo;ilość wystąpień`

## Użyj następującego kodu, aby zacząć pracę nad rozwiązaniem:

```python
import requests
from bs4 import BeautifulSoup

def get_text(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    # mw-parser-output to klasa HTML uzywana na platformie MediaWiki - jest glownym kontenerem dla tresci
    content = soup.find('div', class_='mw-parser-output').text
    return content

def process_text(text):
    #Dopisz kod spelniajacy Punkt 2
    return text

def get_ranked_words(text):
    ranked_words = None
    #Dopisz kod spelniajacy Punkt 3
    return ranked_words

def write_results(results, filename):
    with open(filename, 'w') as file:
    #Dopisz kod spelniajacy Punkt 4
        pass

def main():
    url = 'https://en.wikipedia.org/wiki/Web_scraping'
    text = get_text(url)
    cleaned_text = process_text(text)
    final_words = get_ranked_words(cleaned_text)
    write_results(final_words, 'output.txt')

if __name__ == "__main__":
    main()
