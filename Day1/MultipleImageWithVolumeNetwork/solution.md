# Create network
```
docker network create app1dev

docker network ls
```
# Run postgres_db container

```
docker run --name postgres_app1 --network=app1dev -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=taxdb -v ${pwd}/dbdata:/var/lib/postgresql/data -v ${pwd}/init.sql:/docker-entrypoint-initdb.d/init.sql -d postgres

docker ps 

//Not Expose
docker run --name postgres_app1 --network=app1dev -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=taxdb -v ${pwd}/dbdata:/var/lib/postgresql/data -v ${pwd}/init.sql:/docker-entrypoint-initdb.d/init.sql -d postgres
```

# Run pgadmin container

```
docker run --name pgadmin4_app1 --network=app1dev -p 5050:80 -e PGADMIN_DEFAULT_EMAIL=pingkunga@example.com -e PGADMIN_DEFAULT_PASSWORD=VeryStrongP@ssw0rd -v pgadmin-app1-data:/var/lib/pgadmin -d dpage/pgadmin4

docker ps 
```

# List Container Image

```
docker ps
```

# Clean up Resource 

```
docker stop postgres_app1, pgadmin4_app1
docker rm postgres_app1, pgadmin4_app1

docker network rm app1dev

```