
# With Out Resource Limit

- Check Current Resource 

```
#Windows 
docker info | select-string "CPUs|Memory"

#Linux 
docker info | grep -iE "CPUs|Memory"
```

- View Current Resouce 
* Windows - It Hard Winsows > VM
* Linux 

```
lscpu
```

Note: Just vCPU เราอาจจะไม่ต้องไปรู้ว่าแต่ละ Core ความสามารถเท่าไหร่

result like these 

```
 CPUs: 16
 Total Memory: 15.22GiB
```

- start some container

```
docker run -d --name web nginx:alpine

docker stats web --no-stream --format "{{ json . }}" | jq

#For Windows Install jq for
choco install jq
```

- result 

```
PS C:\Users\Chatr> docker stats web --no-stream --format "{{ json . }}" | jq
{
  "BlockIO": "0B / 0B",
  "CPUPerc": "0.00%",
  "Container": "web",
  "ID": "3f5c0a49d95b",
  "MemPerc": "0.08%",
  "MemUsage": "12.23MiB / 15.22GiB",
  "Name": "web",
  "NetIO": "1.73kB / 866B",
  "PIDs": "17"
}
```
# Memory (Hard / Soft / Swap)

- Hard Limit (--memory = Maximum Memory (Hard Limit))

```
docker run -d --name mem-limit --memory=256m nginx:alpine
```

- Soft Limit (--memory-reservavation = Minimum Memory (Soft Limit))

```
docker run -d --name mem-limit --memory=256m --memory-reservation=128m nginx:alpine
```

- Swap Limit (--memory-swap = Excess Memory (Critical Case) )

```
docker run -d --name mem-limit --memory=256m --memory-reservation=128m --memory-swap=384m nginx:alpine
```

Note: Each Command See the result with 

```
docker stats web --no-stream --format "{{ json . }}" | jq
```

# CPU Limit 

Note: Just vCPU เราอาจจะไม่ต้องไปรู้ว่าแต่ละ Core ความสามารถเท่าไหร่
แต่ถ้าตั้ง Host เอง อาจจะต้องสนใจ

- Fixed CPU Core  (--cpuset-cpus)

```
docker run -d --name cpu-limit --cpuset-cpus 0,3 nginx:alpine

docker run -d --name cpu-limit --cpuset-cpus 0-3 nginx:alpine
```

- Fixed by Resource Size / Percent (--cpus)

```
docker run -d --name cpu-limit --cpus=0.8 nginx:alpine

docker run -d --name cpu-limit --cpus=1.5 nginx:alpine  
```

- Mix

```
docker run -d --name cpu-limit --cpus=2.0 --cpuset-cpus=0,1 nginx:alpine

docker run -d --name cpu-limit --cpus=1.5 --cpuset-cpus=0,1 nginx:alpine
```

Note: Each Command See the result with 

```
docker stats web --no-stream --format "{{ json . }}" | jq
```

```
docker run -d --name cpu-limit --cpuset-cpus 2-3 --cpus=1.5 nginx:alpine

docker exec -it cpu-limit cat /sys/fs/cgroup/cpuset/cpuset.cpus
2-3

docker inspect cpu-limit | select-string Cpus  

    "CpuShares": 0,
    "NanoCpus": 1500000000,
    "CpusetCpus": "2-3",
    "CpusetMems": "",
```
