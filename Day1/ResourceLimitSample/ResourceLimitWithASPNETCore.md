# With Out Limit

1. Start Sample ASP.NET Core Container 

```
docker run -it --rm -p 8000:8080 --name aspnetcore_sample mcr.microsoft.com/dotnet/samples:aspnetapp
```

2. Create Second terminal to check current stat

```
docker stats aspnetcore_sample
```

result

```
CONTAINER ID   NAME                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O   PIDS
5993b2a0d118   aspnetcore_sample   0.01%     26.17MiB / 15.22GiB   0.17%     1.53kB / 656B   0B / 0B     28
```

3. Create third terminal Create Make huge request
```
#Windows-PowerShell
while(1)
{
  curl http://localhost:8000/ 
}

```
#Linux 
while true
do
  curl http://localhost:8000/
done
```

4. wait for 3-5 minute and check stats

```
docker stats aspnetcore_sample
```

result

```
CONTAINER ID   NAME                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O   PIDS
5993b2a0d118   aspnetcore_sample   0.01%     251MiB / 15.22GiB   0.17%     1.53kB / 656B   0B / 0B     28
```

# With Limit

5. ctrl+c to stop aspnetcore_sample

and create container with resource limit

```
docker run -it --rm -p 8000:8080 --memory=48m --memory-reservation=32m --memory-swap=64m --cpus=0.8 --name aspnetcore_sample mcr.microsoft.com/dotnet/samples:aspnetapp
```

6. repeat step 2-4 again


result the resource should limit like below

```
CONTAINER ID   NAME                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O   PIDS
5993b2a0d118   aspnetcore_sample   25.75%     40.81MiB / 48MiB     85.02%    57.5MB / 486MB   0B / 0B     28
```



