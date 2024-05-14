from sqlalchemy import Table, Column, Integer, ForeignKey

from Proj_2.src.database import Base

offer_skill_table = Table('offer_skill', Base.metadata,
    Column('offer_id', Integer, ForeignKey('offer.id'), primary_key=True),
    Column('skill_id', Integer, ForeignKey('skill.id'), primary_key=True)
)
