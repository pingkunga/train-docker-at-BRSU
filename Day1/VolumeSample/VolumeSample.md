
# Use volume - docker manage

- Create a named volume 

```
docker volume create mysql-files 
```

- List all volumes 

```
docker volume ls 
```

- Connect a volume to a container 

```
docker run --name mysql-db -d -e MYSQL_ROOT_PASSWORD=secret -v  mysql-files:/var/lib/mysql --label dev.app=persistent-db mysql
```

- check

```
docker ps --filter "label=training.app"
```

- Remove a volume (only works if it’s not in use) 

```
docker volume rm mysql-files
```

# Use mount (host path / network path)

- mount

```
#Windows
docker run --name mysql-db-mount -d -e MYSQL_ROOT_PASSWORD=secret -v ${pwd}/DBDEV:/var/lib/mysql --label training.app=persistent-db mysql

#Linux
docker run --name mysql-db-mount -d -e MYSQL_ROOT_PASSWORD=secret -v $(pwd)/DBDEV:/var/lib/mysql --label training.app=persistent-db mysql
```

- check

```
docker ps --filter "label=training.app"
```

# Clear All Unused Volume

```
docker volume prune
```