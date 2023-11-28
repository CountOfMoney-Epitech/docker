DOCKER_API=$(docker exec api)
DOCKER_DB=$(docker exec database)

# Global
config: config-api config-webapp

build: build-api build-webapp build-database

start: start-api start-webapp start-database

stop:
	docker compose -f docker-compose-dev.yml down

restart: 
	docker compose restart

purge: stop
	docker volume rm pgdata-dev

# api
config-api:
	cp api/dev/Dockerfile ../api
	cp api/dev/.dockerignore ../api
	cp api/dev/entrypoint.sh ../api

build-api:
	docker compose -f docker-compose-dev.yml build api

start-api:
	docker compose -f docker-compose-dev.yml up -d api

# webapp
config-webapp:
	cp webapp/dev/Dockerfile ../webapp
	cp webapp/dev/.dockerignore ../webapp
	cp webapp/dev/entrypoint.sh ../webapp

build-webapp:	
	docker compose -f docker-compose-dev.yml build webapp

start-webapp:
	docker compose -f docker-compose-dev.yml up -d webapp

# webapp
config-webapp:
	cp webapp/Webapp.Dockerfile ../webapp
	cp webapp/.dockerignore ../webapp
	cd ../webapp && npm install

build-webapp:
	docker compose build webapp --no-cache

start-webapp:
	docker compose up -d webapp

# database
build-database: 
	docker compose -f docker-compose-dev.yml build database

start-database:
	docker compose -f docker-compose-dev.yml up -d database

# Utils
setup-envs:
	



