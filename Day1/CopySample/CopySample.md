
# docker cp

## copy file

- pull and run nginx image 

```
docker run --rm -d -p 18080:80 --name webapp nginx
```

- copy index.html

```
docker cp webapp:/usr/share/nginx/html/index.html .
```

- copy folder 

```
docker cp webapp:/usr/share/nginx/html .
```

- modify index.html

```
change some content
```

- copy index html back to webapp container 

```
docker cp index.html webapp:/usr/share/nginx/html

docker cp index.html webapp:/usr/share/nginx/html/index.html
```

- see the result

```
http://localhost:18080/
```

# copy folder

- copy folder html

```
docker cp webapp:/usr/share/nginx/html/ .
```

- inside folder html 

```
change content such as edit file 

of add file simple.html
```

- update back to contaienr 


```
docker cp html webapp:/usr/share/nginx/ 
```

- see result 

```
http://localhost:18080/

http://localhost:18080/simple.html
```

# Clean Up Resource 

```
docker stop webapp
docker rm webapp
```

or
```
docker rm webapp -force
```

