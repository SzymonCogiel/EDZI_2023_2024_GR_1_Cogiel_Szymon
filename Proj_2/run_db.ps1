docker run --name bazka_web_scraping_EDZI --detach -e POSTGRES_PASSWORD=password -e POSTGRES_DB=web_scraping_db --volume dane_bazy_web_scaping:/var/lib/postgresql/data -p 1920:5432 postgres
