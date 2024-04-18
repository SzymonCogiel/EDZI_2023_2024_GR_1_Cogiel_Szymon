import json

from Cwiczenia_5.EnvironmentDataFetcher import EnvironmentDataFetcher
from raport import create_raport

if __name__ == '__main__':
    e = EnvironmentDataFetcher()
    data = e.fetch_data_synop()

    miasta_wojewodzkie = [
        "Białystok", "Bydgoszcz", "Gdańsk", "Gorzów Wielkopolski", "Katowice",
        "Kielce", "Kraków", "Lublin", "Łódź", "Olsztyn", "Opole",
        "Poznań", "Rzeszów", "Szczecin", "Toruń", "Warszawa",
        "Wrocław", "Zielona Góra"
    ]

    data = [miasto for miasto in data if miasto["stacja"] in miasta_wojewodzkie]

    with open("data.json", "w") as final:
        json.dump(data, final)

    create_raport(data)
