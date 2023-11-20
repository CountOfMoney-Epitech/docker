DOCKER_API=$(docker exec api)
DOCKER_DB=$(docker exec database)

# Global
config: config-api config-webapp

build: build-api build-webapp

start: start-database start-api start-webapp

stop:
	docker compose down

restart: 
	docker compose restart

reset: purge config build start

purge: stop
	docker volume rm pgdata

# api
config-api:
	cp api/Api.Dockerfile ../api
	cp api/.dockerignore ../api
	cp api/entrypoint.sh ../api

build-api:
	docker compose build api --no-cache

start-api:
	docker compose up -d api

# webapp
config-webapp:
	cp webapp/Webapp.Dockerfile ../webapp
	cp webapp/.dockerignore ../webapp
	cp webapp/nginx.conf ../webapp/nginx
	cd ../webapp && npm install

build-webapp:
	docker compose build webapp --no-cache

start-webapp:
	docker compose up -d webapp

# database
start-database: 
	docker compose up -d database

# Utils
setup-envs:
	



