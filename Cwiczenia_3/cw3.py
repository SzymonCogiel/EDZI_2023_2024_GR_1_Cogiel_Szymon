from Cwiczenia_3.pages import fetch_tomatometer_score, fetch_imdb_top

import json
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

if __name__ == '__main__':
    movies, imdb_ratings, years = fetch_imdb_top('https://www.imdb.com/chart/top/?ref_=nv_mv_250', 100)
    links = [f"https://www.rottentomatoes.com/search?search={movie.replace(' ', '%20')}" for movie in movies]

    with ThreadPoolExecutor(max_workers=10) as executor:
        tomato_ratings = list(tqdm(executor.map(fetch_tomatometer_score, links, movies, years)))

    results = []
    for index, (title, imdb_rating, tomato_rating) in enumerate(zip(movies, imdb_ratings, tomato_ratings)):
        try:
            results.append({"tytul_filmu": title,
                            "ranking_imdb": index + 1,
                            "ocena_imdb": imdb_rating,
                            "ocena_rotten_tomatoes": int(tomato_rating)})
        except Exception as e:
            print(e)
            results.append({"tytul_filmu": title,
                            "ranking_imdb": index + 1,
                            "ocena_imdb": imdb_rating,
                            "ocena_rotten_tomatoes": None})

    filename = 'submission.json'
    with open(filename, 'w') as f:
        json.dump(results, f, indent=4)
