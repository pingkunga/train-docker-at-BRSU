# PostgresSQL 

- Pull PostgresSQL
```
docker pull postgres:16.3-alpine3.18
```

- Check Image 
```
docker images
```
- Run PostgresSQL Container 
```
docker run --name invs_postgresdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:16.3-alpine3.18
```

- List Container Image
```
docker ps -a
```

- Access VIA CLI
```
docker exec -it invs_postgresdb psql -U postgres
```

- Create Sample DB 
```
CREATE DATABASE invs_db;
```

- Inspect Container info
```
docker inspect invs_postgresdb
```

- Delete PostgresSQL Container / Delete PostgresSQL Image
```
docker stop invs_postgresdb
docker rm invs_postgresdb
docker rmi postgres:16.3-alpine3.18
```

