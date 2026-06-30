#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo certs
	@echo start / stop / restart
	@echo ----------------------
	@echo workspace
	@echo clean
	@echo ----------------------

_urls: _header
	${info }
	@echo -------------------------------------
	@echo [Ejbca] https://ejbca.test
	@echo [Traefik] https://traefik.ejbca.test
	@echo -------------------------------------

_header:
	@echo -----
	@echo EJBCA
	@echo -----

certs:
	@traefik/crear_certs.sh ejbca.test

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose down

restart: stop start

workspace:
	@docker-compose exec ejbca /bin/bash

clean:
	@docker-compose down -v --remove-orphans
