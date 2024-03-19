from Cwiczenia_3 import imdb
from Cwiczenia_3.rottentomatoes import find_tomatometer_score_by_title_and_fetch

import json
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

if __name__ == '__main__':
    movies, imdb_ratings = imdb.main()
    links = [f"https://www.rottentomatoes.com/search?search={movie.replace(' ', '%20')}" for movie in movies]

    with ThreadPoolExecutor(max_workers=10) as executor:
        tomato_ratings = list(tqdm(executor.map(find_tomatometer_score_by_title_and_fetch, links, movies)))

    results = [{"tytul_filmu": title, "ranking_imdb": index + 1,"ocena_imdb": imdb_rating, "ocena_rotten_tomatoes": int(tomato_rating[1])} # noqa
               for index, (title, imdb_rating, tomato_rating) in enumerate(zip(movies, imdb_ratings, tomato_ratings))]
    filename = 'submission.json'

    with open(filename, 'w') as f:
        json.dump(results, f, indent=4)
