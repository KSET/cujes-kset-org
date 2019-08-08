FLASK_OVERRIDE_FILE := .flaskenv.override

.PHONY: init down up build

init: down build $(FLASK_OVERRIDE_FILE) up
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
	printf "SECRET_KEY=" > $(FLASK_OVERRIDE_FILE)
	echo $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 256 | head -n 1) >> $(FLASK_OVERRIDE_FILE)
