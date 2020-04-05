CMD=docker-compose -p tic

build:
	$(CMD) build

debug:
	$(CMD) up

up:
	$(CMD) up -d

down:
	$(CMD) down

matrix:
	$(CMD) run --rm \
		-e SYNAPSE_SERVER_NAME=mtx.tic.sh \
		-e SYNAPSE_REPORT_STATS=yes \
		matrix generate

certbot:
	$(CMD) exec proxy certbot-auto --nginx
