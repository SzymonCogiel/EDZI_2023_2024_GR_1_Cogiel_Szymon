import urllib.robotparser


def check_robots_permission(func):
    def wrapper(*args, **kwargs):
        page_url = kwargs.get('url', None)
        if page_url is None and args:
            page_url = args[0]
        rp = urllib.robotparser.RobotFileParser()
        robots_txt_url = '/'.join(page_url.split('/')[:3]) + '/robots.txt'
        rp.set_url(robots_txt_url)
        rp.read()

        if rp.can_fetch('My bot', page_url):
            print(f'Scraping is allowed for {page_url}.')
            return func(*args, **kwargs)
        else:
            print(f'Scraping is not allowed for {page_url} according to robots.txt.')
            raise Exception(f'Scraping is not allowed for this {page_url} according to robots.txt.')
    return wrapper
