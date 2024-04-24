from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker
import os

engine = create_engine(f'postgresql://{os.environ.get('DB_USER', 'postgres')}:{os.environ.get('DB_PASSWORD', 'postgres')}@localhost:5432/web_scraping_db')
session = scoped_session(sessionmaker(bind=engine))

Base = declarative_base()
