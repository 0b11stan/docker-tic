CMD=docker-compose -p tic

build:
	$(CMD) build

debug:
	$(CMD) up

up:
	$(CMD) up -d
	$(CMD) exec proxy certbot-auto --nginx

down:
	$(CMD) down
