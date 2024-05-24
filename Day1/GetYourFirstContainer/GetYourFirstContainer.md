
Run PostgreSQL Container with requirement
- version:	   	15.6 + small image
- username:   	docker101
- password:   	dockerPwd
- expose:       	5432
- container name: pg_dev_test
- run background mode

```
docker run -d -e POSTGRES_USER=docker101 -e POSTGRES_PASSWORD=dockerPwd -p 5432:5432 --name pg_dev_test postgres:15.6-alpine3.19
```

Create NGINX container with requirement
- expose: 18080
- container name: webapp
- auto remove when container stop

```
docker create --rm -d -p 18080:80 --name webapp nginx
```

Check Container Status & Inspect

```
docker ps -a

#inspect 
docker inspect webapp  
docker inspect pg_dev_test  
```
