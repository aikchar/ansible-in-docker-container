DOCKER_COMPOSE_PROJECT := ansible

.PHONY: which-docker-compose
which-docker-compose:
	@which docker-compose 1>/dev/null

.PHONY: build
build: which-docker-compose
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) build

.PHONY: up
up: which-docker-compose
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) up -d

.PHONY: down
down: which-docker-compose
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) down

.PHONY: destroy
destroy: down

.PHONY: start
start: which-docker-compose up
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) start

.PHONY: stop
stop: which-docker-compose
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) stop

.PHONY: exec
exec: which-docker-compose start
	docker-compose --project-name $(DOCKER_COMPOSE_PROJECT) exec ansible /bin/sh

.PHONY: shell
shell: exec

.PHONY: clean
clean: down

# https://stackoverflow.com/a/26339924
.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs
