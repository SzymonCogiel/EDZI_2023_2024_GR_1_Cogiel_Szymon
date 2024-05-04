import requests
from summarizer import Summarizer


def get_wikipedia_article_text(article_title: str):
    # Endpoint URL for the MediaWiki API
    endpoint = "https://en.wikipedia.org/w/api.php"

    article_params = {
        "action": "query",
        "format": "json",
        "prop": "extracts",
        "titles": article_title,  # Here come the title you want to get
        "explaintext": True  # Return plain text instead of HTML
    }
    article_response = requests.get(endpoint, params=article_params)
    if article_response.status_code == 200:
        article_data = article_response.json()
        # Extract the text of the article
        article_text = next(iter(article_data["query"]["pages"].values()))["extract"]
        return article_text
    else:
        print("Failed to fetch article text")


def save_text(article_text: str, file_path):
    with open(file_path, 'w') as file:
        file.write(article_text)


def summarize_text(input_text):
    s = Summarizer()
    summary = s(input_text, min_length=50, max_length=150)
    return summary


def main():
    article_text = get_wikipedia_article_text("BERT_(language_model)")
    save_text(article_text, "org.txt")
    summary = summarize_text(article_text)
    save_text(summary, "outcome.txt")


if __name__ == "__main__":
    main()
