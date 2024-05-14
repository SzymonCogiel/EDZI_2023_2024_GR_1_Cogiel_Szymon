from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship

from Proj_2.src.database import Base
from Proj_2.src.models.associations import offer_skill_table  # noqa


class Offer(Base):
    __tablename__ = 'offer'

    id = Column(Integer, primary_key=True)
    position_id = Column(Integer, ForeignKey('position.id'))
    company_id = Column(Integer, ForeignKey('company.id'))
    category_id = Column(Integer, ForeignKey('category.id'))
    currency_id = Column(Integer, ForeignKey('currency.id'))
    source_id = Column(Integer, ForeignKey('source.id'))
    link = Column(String)
    seniority = Column(String)
    minimum_salary = Column(Float)
    maximum_salary = Column(Float)
    skills = relationship('Skill', secondary=offer_skill_table, back_populates='offers')

    # Make sure this relationship is defined
    company = relationship('Company', back_populates='offers')
    category = relationship('Category', back_populates='offers')
    source = relationship('Source', back_populates='offers')
    position = relationship('Position', back_populates='offers')
    currency = relationship('Currency', back_populates='offers')