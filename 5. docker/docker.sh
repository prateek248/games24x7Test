#!/bin/bash

for i in 1 2; do echo "Running container ubuntu$i"; docker run -d --name ubuntu$i ubuntu:18.04 sleep infinity; done

for i in 1 2; do echo "Run process stat for ubuntu$i"; docker exec -i ubuntu$i ps aux; done

for i in 1 2; do echo "Stop ubuntu$i container"; docker kill ubuntu$i; done

echo "Perform cleanup"
docker system prune -f
docker volume prune -f
