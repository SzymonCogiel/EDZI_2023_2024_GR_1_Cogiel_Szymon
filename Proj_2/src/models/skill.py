from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from Proj_2.src.database import Base
from Proj_2.src.models.associations import offer_skill_table


class Skill(Base):
    __tablename__ = 'skill'

    id = Column(Integer, primary_key=True)
    skill_name = Column(String)
    offers = relationship('Offer', secondary=offer_skill_table, back_populates='skills')
