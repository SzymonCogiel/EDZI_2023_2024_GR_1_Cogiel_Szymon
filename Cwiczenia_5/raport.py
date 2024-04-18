from typing import List, Dict


def create_raport(data: List[Dict]):
    temperatures = []
    precipitations = []
    pressures = []
    measurement_stations = []

    for record in data:

        if record['temperatura'] is not None:
            temperatures.append((float(record['temperatura']), record['stacja']))

        if record['suma_opadu'] is not None:
            precipitations.append((float(record['suma_opadu']), record['stacja']))

        if record['cisnienie'] is not None:
            pressures.append((float(record['cisnienie']), record['stacja']))

        measurement_stations.append({
            'stacja': record['stacja'],
            'data_pomiaru': record['data_pomiaru'],
            'godzina_pomiaru': record['godzina_pomiaru']
        })

    avg_temperature = sum(t[0] for t in temperatures) / len(temperatures)
    min_temperature = min(temperatures, key=lambda x: x[0])
    max_temperature = max(temperatures, key=lambda x: x[0])

    avg_precipitation = sum(p[0] for p in precipitations) / len(precipitations)
    min_precipitation = min(precipitations, key=lambda x: x[0])
    max_precipitation = max(precipitations, key=lambda x: x[0])

    avg_pressure = sum(p[0] for p in pressures) / len(pressures)
    min_pressure = min(pressures, key=lambda x: x[0])
    max_pressure = max(pressures, key=lambda x: x[0])

    measurement_time = f"{measurement_stations[0]['data_pomiaru']} {measurement_stations[0]['godzina_pomiaru']}:00"

    print(3 * '======' + f'Dane dla {measurement_time}' + 3 * '======')
    print('Średnia temperatura: ', avg_temperature)
    print(f'Minimalna temperatura {min_temperature[0]} °C w miescie {min_pressure[1]}')
    print(f'Maksymalna temperatura {max_temperature[0]} °C w miescie {max_temperature[1]}')
    print('Średnia wartość opadów:', avg_precipitation)
    print(f'Minimalna wartość opadów {min_precipitation[0]} mm w miescie {min_precipitation[1]}')
    print(f'Maksymalna wartość opadów {max_precipitation[0]} mm w miescie {max_precipitation[1]}')
    print('Średnia wartość ciśnienia:', avg_pressure)
    print(f'Minimalna wartość ciśnienia {min_pressure[0]} Pa w miescie {min_pressure[1]}')
    print(f'Maksymalna wartość ciśnienia {max_pressure[0]} Pa w miescie {max_pressure[1]}')
