FLASK_OVERRIDE_FILE := .flaskenv.override

.PHONY: init down up build $(FLASK_OVERRIDE_FILE)

init: down $(FLASK_OVERRIDE_FILE) up
	docker/flask flask db upgrade

down:
	docker/compose down
	sudo chown -R $(USER) .data/db

up:
	docker/compose up -d

restart: down up

build:
	docker-compose build

$(FLASK_OVERRIDE_FILE):
	.scripts/generate_secret_key.sh "$(FLASK_OVERRIDE_FILE)"
