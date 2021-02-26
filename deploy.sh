#!/usr/bin/env bash

# Parse docker-compose.yml for using with docker swarm. 
# Docker swarm doest support .env variables
docker-compose -f docker-compose-prod.yml config > docker-compose-swarm.yml

# Deploy stack
sudo docker stack deploy -c ./docker-compose-swarm.yml pg-adapter-tileserv --with-registry-auth