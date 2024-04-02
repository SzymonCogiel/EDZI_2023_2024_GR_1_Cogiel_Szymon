import re
from functools import wraps
from urllib.robotparser import RobotFileParser


def remove_non_ascii(text):
    return re.sub(r'[^\x00-\x7F]', '', text)


def validate_robots_permission(is_pre_valid: bool = True):
    def decorator(method):
        @wraps(method)
        def wrapper(self, url, *args, **kwargs):
            if is_pre_valid:
                print(f'Force scraping {url}. Robots was checked before.')
                return method(self, url, *args, **kwargs)

            rp = RobotFileParser()
            robots_txt_url = '/'.join(url.split('/')[:3]) + '/robots.txt'
            rp.set_url(robots_txt_url)
            rp.read()

            if rp.can_fetch('My bot', url):
                print(f'Scraping is allowed for {url}.')
                return method(self, url, *args, **kwargs)
            else:
                print(f'Scraping is not allowed for {url} according to robots.txt.')
                raise Exception(f'Scraping is not allowed for this {url} according to robots.txt.')

        return wrapper

    return decorator
