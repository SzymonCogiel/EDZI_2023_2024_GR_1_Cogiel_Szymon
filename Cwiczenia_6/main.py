from datetime import datetime
from sqlalchemy.orm import sessionmaker
from Cwiczenia_6.scraper import NBPScraper
from Cwiczenia_6.database import engine, Base
from Cwiczenia_6.models import CurrencyInfo, CurrencyData


def fetch_all_currency_info(session):
    currencies = session.query(CurrencyInfo).all()
    for currency in currencies:
        print(f'Code: {currency.currency_code}, Name: {currency.currency_name}')


def fetch_currency_data(session, currency_code):
    rates = session.query(CurrencyData).filter_by(currency_code=currency_code).all()
    for rate in rates:
        print(f'ID: {rate.id}, Date: {rate.effective_date}, Rate: {rate.mid}, {rate.currency.currency_name}, {rate.currency_code}')


def main():
    Base.metadata.create_all(engine)

    Session = sessionmaker(bind=engine)
    session = Session()

    scraper = NBPScraper()
    r = scraper.fetch('USD', 25)
    currency_code = r['code']
    currency_name = r['currency']

    currency_info = session.query(CurrencyInfo).filter_by(currency_code=currency_code).first()
    if not currency_info:
        currency_info = CurrencyInfo(currency_code=currency_code, currency_name=currency_name)
        session.add(currency_info)

    for rate in r['rates']:
        existing_rate = session.query(CurrencyData).filter_by(id=rate['no']).first()
        if not existing_rate:
            currency_data = CurrencyData(
                id=rate['no'],
                effective_date=datetime.strptime(rate['effectiveDate'], '%Y-%m-%d').date(),
                mid=rate['mid'],
                currency_code=currency_code
            )
            session.add(currency_data)

    session.commit()
    session.close()
    fetch_all_currency_info(session)
    fetch_currency_data(session, 'USD')


if __name__ == '__main__':
    main()
