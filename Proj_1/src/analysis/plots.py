import matplotlib.pyplot as plt


def hist_plot(
        data: dict,
        title: str = 'Popularne języki i technologie w ofertach pracy "Data"',
        xlabel: str = 'Języki/Technologie',
        ylabel: str = 'Liczba',
        plot_path: str = '../data/common_tools_and_tech_for_data_position_chart.png'
):
    plt.figure(figsize=(10, 8))
    bars = plt.bar(data.keys(), data.values(), color='blue')

    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width() / 2, yval + 1, yval, ha='center', va='bottom')

    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.xticks(rotation=45, ha='right')
    plt.tight_layout()
    plt.savefig(plot_path)
    plt.close()


def position_plot(data):
    fig, ax = plt.subplots(figsize=(10, 6))


    ax.errorbar(data['Unnamed: 0'], data['mean_salary'],

                yerr=[data['mean_salary'] - data['min_salary'],

                      data['max_salary'] - data['mean_salary']],

                fmt='o', color='blue', ecolor='blue', elinewidth=3, capsize=0)


    for i, mean in enumerate(data['mean_salary']):
        ax.hlines(mean, i - 0.2, i + 0.2, colors='red', zorder=5)

    ax.scatter(data['Unnamed: 0'], data['median_salary'], color='green', zorder=5)

    ax.set_ylabel('Wynagrodzenie (w PLN)', fontsize=12)

    ax.set_xlabel('Stanowiska pracy', fontsize=12)

    ax.set_title('Przedziały wartości wynagrodzenia dla różnych stanowisk pracy', fontsize=14)

    plt.setp(ax.get_xticklabels(), rotation=45, ha='right')

    plt.errorbar([], [], yerr=0.1, fmt='o', color='blue', ecolor='blue', elinewidth=3, capsize=0, label='Przedział min-max')

    plt.hlines([], [], [], colors='red', label='Średnia')

    plt.hlines([], [], [], colors='green', linewidth=5, label='Mediana')

    plt.legend()

    ax.spines['right'].set_visible(False)

    ax.spines['top'].set_visible(False)

    plt.tight_layout()

    plt.savefig('../data/jobs_position_plot.png')
    plt.close()
