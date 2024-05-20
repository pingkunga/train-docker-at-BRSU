Buidling Docker


```
docker pull postgres:16.3-bookworm
docker run --name invs_postgresdb_raw -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:16.3-bookworm

docker exec -it invs_postgresdb_raw psql -U postgres

postgres=# CREATE EXTENSION vector;
ERROR:  extension "vector" is not available
DETAIL:  Could not open extension control file "/usr/share/postgresql/16/extension/vector.control": No such file or directory.
HINT:  The extension must first be installed on the system where PostgreSQL is running.

postgres=# CREATE EXTENSION pg_cron;
ERROR:  extension "pg_cron" is not available
DETAIL:  Could not open extension control file "/usr/share/postgresql/16/extension/pg_cron.control": No such file or directory.
HINT:  The extension must first be installed on the system where PostgreSQL is running.
```

```
docker buildx build --platform linux/amd64 -t my_org_postgres:16.3 . --load

docker images

docker run --name invs_postgresdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d my_org_postgres:16.3
docker exec -it invs_postgresdb psql -U postgres

postgres=# CREATE EXTENSION vector;
postgres=# CREATE EXTENSION pg_cron;

docker exec -it invs_postgresdb /bin/sh 

```


Reduce Layer 

```
docker buildx build --platform linux/amd64 -t my_org_postgres-l:16.3 . -f .\DockkerfileNotOptimize --load 

docker images
```

