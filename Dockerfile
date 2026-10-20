FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR  /usr/app/dbt

RUN pip install --upgrade pip 
#RUN pip install dbt-postgres==1.3.1
RUN pip install --no-cache-dir dbt-postgres

CMD dbt deps && dbt build --profiles-dir profiles && sleep infinity


