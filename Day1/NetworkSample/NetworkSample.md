
# Test Docker Bridge Network

```
docker network create b-net

or

docker network create b-net -d bridge
```

- Start Container1

```
docker run -it --rm --name container1 --network b-net busybox:latest
```

- Start Container2 in another terminal

```
docker run -it --rm --name container2 busybox:latest
```

- Try Connector Container2 from Container1
```
ping google.com

ping container2

#result bad address 'container2'
```

- Open another terminal connect network

```
docker network connect b-net container2
```

- ping again

```
# ping container2
ping: bad address 'container2'
/ # ping container2
PING container2 (172.29.0.3): 56 data bytes
64 bytes from 172.29.0.3: seq=0 ttl=64 time=0.107 ms
64 bytes from 172.29.0.3: seq=1 ttl=64 time=0.078 ms
64 bytes from 172.29.0.3: seq=2 ttl=64 time=0.074 ms

--- container2 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet 
```

- Clean up

```
docker network rm b-net
```

# Test Host Network (For Linux Only)

```
docker run -d --name nginx --network host nginx:latest
```

- Clean up

```
docker rm nginx --force
```

# Test Disabling Networking (None)

```
docker run -it --rm --network none busybox:latest

```

- Test Ping
```
/ # ping google.com
ping: bad address 'google.com'

```