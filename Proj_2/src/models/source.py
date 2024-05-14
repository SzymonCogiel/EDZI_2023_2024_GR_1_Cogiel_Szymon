from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from Proj_2.src.database import Base


class Source(Base):
    __tablename__ = 'source'

    id = Column(Integer, primary_key=True)
    source_name = Column(String)
    offers = relationship('Offer', back_populates='source')
