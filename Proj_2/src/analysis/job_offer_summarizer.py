import warnings
from typing import Callable

from summarizer import Summarizer


class JobOfferSummarizer:
    def __init__(self, summarizer: Callable = Summarizer()):
        self.summarizer = summarizer

    def __call__(self, text, min_length: int = 50, max_length: int = 255):
        with warnings.catch_warnings(action="ignore"):
            summary = self.summarizer(text, min_length=min_length, max_length=max_length)
        return summary
