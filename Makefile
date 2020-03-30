CMD=docker-compose -p tic

build:
	$(CMD) build

debug:
	$(CMD) up

up:
	$(CMD) up -d

down:
	$(CMD) down
