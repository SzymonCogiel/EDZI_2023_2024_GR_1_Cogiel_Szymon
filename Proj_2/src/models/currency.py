from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from Proj_2.src.database import Base


class Currency(Base):
    __tablename__ = 'currency'

    id = Column(Integer, primary_key=True)
    code = Column(String)
    offers = relationship('Offer', back_populates='currency')
