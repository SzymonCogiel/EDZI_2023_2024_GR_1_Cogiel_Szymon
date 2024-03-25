from pydantic import BaseModel, field_validator
from typing import Optional


class Film(BaseModel):
    tytul_filmu: str
    ranking_imdb: int
    ocena_imdb: float
    ocena_rotten_tomatoes: Optional[int] = None

    @field_validator('ocena_rotten_tomatoes')
    def parse_ocena_rotten_tomatoes(cls, v): # noqa
        if v is None or v == '':
            return None
        try:
            return int(v)
        except ValueError:
            return None
