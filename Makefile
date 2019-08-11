FLASK_OVERRIDE_FILE := .flaskenv.override
FLASK_MAIN_FILE := .flaskenv.main
FLASK_ENV_FILE := .flaskenv

.PHONY: init down up build $(FLASK_OVERRIDE_FILE) $(FLASK_ENV_FILE)

init: restart
	docker/flask flask db upgrade

down: $(FLASK_ENV_FILE)
	docker/compose down

up: $(FLASK_ENV_FILE)
	docker/compose up -d

dev: down
	docker/compose up -d db
	docker/compose up flask

restart: down up

build: $(FLASK_ENV_FILE) down
	docker-compose build

$(FLASK_OVERRIDE_FILE):
	.scripts/generate_secret_key.sh "$(FLASK_OVERRIDE_FILE)"

$(FLASK_ENV_FILE): $(FLASK_OVERRIDE_FILE)
	cat "$(FLASK_MAIN_FILE)" "$(FLASK_OVERRIDE_FILE)" > "$(FLASK_ENV_FILE)"
