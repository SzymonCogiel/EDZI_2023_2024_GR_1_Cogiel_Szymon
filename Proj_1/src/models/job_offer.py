from pydantic import BaseModel, NonNegativeFloat, HttpUrl, Field
from typing import List, Literal
from uuid import UUID, uuid4


class JobOffer(BaseModel):
    id: UUID = Field(default_factory=uuid4)
    source: str
    link: str
    position: str
    location: str
    company_name: str
    minimum_salary: NonNegativeFloat
    maximum_salary: NonNegativeFloat
    currency: Literal['EUR', 'PLN', "USD"]
    skills_technologies: List[str]
    category: Literal['Data', 'BigData/Data Science']
    seniority: Literal['Junior', 'Mid/Regular', 'Senior']
