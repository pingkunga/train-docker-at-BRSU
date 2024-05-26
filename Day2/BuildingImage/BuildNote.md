# Set up Docker BuildX

```
#Create Builder (Container)
docker buildx create --name mybuilder
docker buildx use mybuilder
```

# Original Postgres

- pull Original Postgres
```
docker pull postgres:16.3-bookworm
```

- run Original Postgres
```
docker run --name invs_postgresdb_raw -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:16.3-bookworm
```

- excute to container invs_postgresdb_raw with psql utility 

```
docker exec -it invs_postgresdb_raw psql -U postgres
```

- Inside container invs_postgresdb_raw vertify vector / pg_cron not available
```
postgres=# CREATE EXTENSION vector;
ERROR:  extension "vector" is not available
DETAIL:  Could not open extension control file "/usr/share/postgresql/16/extension/vector.control": No such file or directory.
HINT:  The extension must first be installed on the system where PostgreSQL is running.

postgres=# CREATE EXTENSION pg_cron;
ERROR:  extension "pg_cron" is not available
DETAIL:  Could not open extension control file "/usr/share/postgresql/16/extension/pg_cron.control": No such file or directory.
HINT:  The extension must first be installed on the system where PostgreSQL is running.
```

- remove resource

```
docker rm -f invs_postgresdb_raw
```

# Buidling Custom Postgress Docker

- read [Dockerfile](./Dockerfile) which install lib for extension vector / pg_cron
- build image with docker buildx 
```
docker buildx build --platform linux/amd64 -t my_org_postgres:16.3 . --load
```
- verify images exist

```
docker images "my_org_postgres*"
```

- run
docker run --name invs_postgresdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d my_org_postgres:16.3


docker exec -it invs_postgresdb psql -U postgres

postgres=# CREATE EXTENSION vector;
postgres=# CREATE EXTENSION pg_cron;

docker exec -it invs_postgresdb /bin/sh 

```


# WithOut Reduce Layer 

```
docker buildx build --platform linux/amd64 -t my_org_postgres-l:16.3 . -f .\DockerfileNotOptimize --load 

docker images
```
-
