import json
import pandas as pd


def calculate_frequency(offers):
    skill_freq = {}

    for offer in offers:
        for skill in offer['skills_technologies']:
            skill_freq[skill.lower()] = skill_freq.get(skill.lower(), 0) + 1

    skill_freq = dict(sorted(skill_freq.items(), key=lambda item: item[1], reverse=True))

    with open('data/skill_freq.json', 'w') as outfile:
        json.dump(skill_freq, outfile)

    return skill_freq


def filter_df(df, positions):
    filtered_dfs = []
    for title, criteria in positions.items():

        temp_df = df[df['seniority'] == criteria['seniority']]

        def check_keywords(row, keywords):
            return sum(keyword in row['position'] for keyword in keywords) >= 2

        temp_df = temp_df[temp_df.apply(check_keywords, keywords=criteria['keywords'], axis=1)]

        if not temp_df.empty:
            filtered_dfs.append((title, temp_df))

    return filtered_dfs


positions = {
    "Junior Data Engineer": {"seniority": "Junior", "keywords": ["Data", "Engineer", "Ops", "DataOps"]},
    "Data Engineer": {"seniority": "Mid/Regular", "keywords": ["Data", "Engineer", "Ops", "DataOps"]},
    "Senior Data Engineer": {"seniority": "Senior", "keywords": ["Data", "Engineer", "Ops", "DataOps"]},
    "Junior Data Analyst": {"seniority": "Junior", "keywords": ["Data", "Analyst"]},
    "Data Analyst": {"seniority": "Mid/Regular", "keywords": ["Data", "Analyst"]},
    "Senior Data Analyst": {"seniority": "Senior", "keywords": ["Data", "Analyst"]},
    "Junior Data Scientist": {"seniority": "Junior", "keywords": ["Data", "Scientist", "Science"]},
    "Data Scientist": {"seniority": "Mid/Regular", "keywords": ["Data", "Scientist", "Science"]},
    "Senior Data Scientist": {"seniority": "Senior", "keywords": ["Data", "Scientist", "Science"]},
    "Junior Data Architect": {"seniority": "Junior", "keywords": ["Data", "Architect"]},
    "Data Architect": {"seniority": "Mid/Regular", "keywords": ["Data", "Architect"]},
    "Senior Data Architect": {"seniority": "Senior", "keywords": ["Data", "Architect"]}
}


def add_statistics(df, data, title):
    data['average_salary'] = (data['minimum_salary'] + data['maximum_salary']) / 2
    new_row = pd.DataFrame({
        'mean_salary': data['average_salary'].mean(),
        'median_salary': data['average_salary'].median(),
        'min_salary': data['minimum_salary'].min(),
        'max_salary': data['maximum_salary'].max(),
        'offers_counts': len(data)
    }, index=[title])
    return pd.concat([df, new_row])


def calculate_statistic_per_position(df):
    filtered_dfs_list = filter_df(df, positions)
    df_statistics = pd.DataFrame({})
    for title, df in filtered_dfs_list:
        df_statistics = add_statistics(df_statistics, df, title)

    df_statistics.to_csv('data/positions_stats.csv')
    df_statistics.to_json('data/positions_stats.json')
