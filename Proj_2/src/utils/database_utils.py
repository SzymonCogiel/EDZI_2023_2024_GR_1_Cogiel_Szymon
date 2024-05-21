from Proj_2.src.database import Base

from Proj_2.src.database import session
from Proj_2.src.models import Offer, Company, Position, Currency, Source, Category, Skill
from Proj_2.src.schemas.job_offer import JobOffer
from Proj_2.src.utils.helpers import get_location


def get_or_create(model: Base, unique_criteria: dict, defaults: dict = None):
    instance = session.query(model).filter_by(**unique_criteria).one_or_none()
    if instance:
        return instance
    else:
        if defaults:
            unique_criteria.update(defaults)
        instance = model(**unique_criteria)
        session.add(instance)
        return instance


def create_offer(job_offer: JobOffer):
    company_name = job_offer.company_name
    location = job_offer.location

    if location[0] == '-' and (open_street_map_location := get_location(company_name)):
        location = open_street_map_location

    company = get_or_create(Company, unique_criteria={'name': company_name}, defaults={'location': location})
    position = get_or_create(Position, unique_criteria={'title': job_offer.position})
    currency = get_or_create(Currency, unique_criteria={'code': job_offer.currency})
    category = get_or_create(Category, unique_criteria={'category_name': job_offer.category})
    source = get_or_create(Source, unique_criteria={'source_name': job_offer.source})

    skills = [get_or_create(Skill, {'skill_name': skill_name}) for skill_name in job_offer.skills_technologies]

    offer = Offer(
        position=position,
        company=company,
        category=category,
        currency=currency,
        source=source,
        link=job_offer.link,
        seniority=job_offer.seniority,
        minimum_salary=job_offer.minimum_salary,
        maximum_salary=job_offer.maximum_salary,
        skills=skills,
        summary=job_offer.summary
    )

    session.add(company)
    session.add(position)
    session.add(currency)
    session.add(source)
    session.add(category)
    session.add(offer)
    session.commit()

    print("Offer and associated records added successfully.")
