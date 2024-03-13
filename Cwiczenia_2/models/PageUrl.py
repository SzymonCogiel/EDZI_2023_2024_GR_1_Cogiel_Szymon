import re
from urllib.parse import urlparse
from typing import List, Literal


class PageUrl:

    ABSOLUTE_LINK_PATTERN = r'^[a-zA-Z][a-zA-Z0-9+.-]*://'

    status: Literal['ConnectionError', 'Valid', 'SSLError'] = None

    def __init__(self, url: str, parent=None, status=None):
        self._parent: PageUrl = parent
        self._url: str = url
        self.children: List[PageUrl] = []
        if status:
            self.status = status

    @property
    def url(self) -> str:
        if re.match(self.ABSOLUTE_LINK_PATTERN, self._url):
            return self._url
        elif self._url.startswith('#'):
            temp_url = self._parent.url + self._url
            if temp_url.count('#') > 1:
                splitted_url = temp_url.split('#')
                temp_url = splitted_url[0] + '#' + splitted_url[-1]
            return temp_url
        return self.get_domain_with_protocol() + self._url

    @property
    def parent(self):
        return self._parent

    def print_children(self) -> List[str]:
        return [child.url for child in self.children]

    def get_domain_with_protocol(self) -> str:
        parsed_url = urlparse(self._parent.url if self._parent else self._url)
        return f'{parsed_url.scheme}://{parsed_url.netloc}'

    def add_child(self, url: str, status=None):
        self.children.append(PageUrl(url, self, status))
