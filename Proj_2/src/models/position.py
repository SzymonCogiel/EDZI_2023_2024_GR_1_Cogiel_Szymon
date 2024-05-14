from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from Proj_2.src.database import Base


class Position(Base):
    __tablename__ = 'position'

    id = Column(Integer, primary_key=True)
    title = Column(String)
    offers = relationship('Offer', back_populates='position')
