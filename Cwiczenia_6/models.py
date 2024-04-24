from sqlalchemy import Column, String, Float, Date, ForeignKey
from sqlalchemy.orm import relationship
from Cwiczenia_6.database import Base


class CurrencyInfo(Base):
    __tablename__ = 'currency_info'

    currency_code = Column(String(3), primary_key=True)
    currency_name = Column(String(50), nullable=False)

    rates = relationship("CurrencyData", back_populates="currency")


class CurrencyData(Base):
    __tablename__ = 'currency_data'

    id = Column(String(15), primary_key=True)
    effective_date = Column(Date, nullable=False)
    mid = Column(Float, nullable=False)

    currency_code = Column(String(3), ForeignKey('currency_info.currency_code'))

    currency = relationship("CurrencyInfo", back_populates="rates")
