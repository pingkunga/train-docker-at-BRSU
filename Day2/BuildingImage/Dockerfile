FROM postgres:16.3-bookworm

#https://packages.debian.org/trixie/amd64/database/postgresql-16-pgvector
#https://packages.debian.org/trixie/amd64/database/postgresql-16-cron
RUN apt-get update \
      && apt-get install -y curl \
      && apt-get -y install postgresql-16-pgvector \
      && apt-get -y install postgresql-16-cron

RUN echo "shared_preload_libraries='pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "cron.database_name='postgres'" >> /usr/share/postgresql/postgresql.conf.sample

#For your own database name
#RUN echo "shared_preload_libraries='pg_cron'" >> /usr/share/postgresql/postgresql.conf
#RUN echo "cron.database_name='your_db_name'" >> /usr/share/postgresql/postgresql.conf