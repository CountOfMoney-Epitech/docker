DOCKER_API=$(docker exec api)
DOCKER_DB=$(docker exec database)

# Global
config: config-api

install: build-api

start: start-api start-database

stop:
	docker compose down

restart: 
	docker compose restart

#Careful, this removes all database data
purge: stop
	docker volume rm pgdata

# api
config-api:
	cp api/Api.Dockerfile ../api
	cp api/.dockerignore ../api
	cp api/entrypoint.sh ../api

build-api:
	docker compose build api

start-api:
	docker compose up -d api

# database
start-database: 
	docker compose up -d database



