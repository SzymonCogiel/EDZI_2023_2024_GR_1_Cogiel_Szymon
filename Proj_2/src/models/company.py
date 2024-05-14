from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from Proj_2.src.database import Base


class Company(Base):
    __tablename__ = 'company'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    location = Column(String)

    offers = relationship('Offer', back_populates='company')
