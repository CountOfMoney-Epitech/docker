DOCKER_API=$(docker exec api)
DOCKER_DB=$(docker exec database)

# API
config-api:
	cp api/Api.Dockerfile ../api
	cp api/.dockerignore ../api
	cp api/entrypoint.sh ../api

build-api:
	docker compose build api

start-api:
	docker compose up -d api

# DATABASE
start-database: 
	docker compose up -d database

