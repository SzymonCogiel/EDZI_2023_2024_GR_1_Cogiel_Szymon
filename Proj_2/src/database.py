from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker
import os

engine = create_engine(f'postgresql://{os.environ.get('DB_USER', 'postgres')}:password@localhost:1920/web_scraping_db')
# session = scoped_session(sessionmaker(bind=engine))
session = scoped_session(sessionmaker(bind=engine, autocommit=False, autoflush=False))

Base = declarative_base()
Base.query = session.query_property()


def init_db():
    # Import all modules here that might define models so that
    # they will be registered properly on the metadata. Otherwise
    # you will have to import them first before calling init_db()
    from Proj_2.src.models import Offer, Company, Position, Currency, Source, Category, Skill # noqa
    from Proj_2.src.models.associations import offer_skill_table # noqa
    Base.metadata.create_all(bind=engine)
