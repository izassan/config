import requests
from posixpath import join as urljoin


class HttpClient:
    endpoint: str

    def __init__(self, endpoint):
        self.endpoint = endpoint

    def get(self, paths, query, headers):
        url = urljoin(self.endpoint, paths)
        resp = requests.get(url, params=query, header=headers)
        return resp
