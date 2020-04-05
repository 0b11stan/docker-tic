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

matrix_user:
	$(CMD) exec matrix \
		register_new_matrix_user \
		-c homeserver.yaml \
		http://localhost:8008

certbot:
	$(CMD) exec proxy certbot-auto --nginx
