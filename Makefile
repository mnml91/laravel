info:
	docker images -a
	@echo "======================================="
	docker ps -a

clear:
	docker container rm $$(docker ps -aq) -f

up: memory
	docker-compose up -d

down:
	docker-compose down

up-b: memory perm
	docker-compose up --build -d

####################################################

bash:
	docker-compose exec php-fpm bash

migrate:
	docker-compose exec php-fpm php artisan migrate

key:
	docker-compose exec php-fpm php artisan key:generate

tinker:
	docker-compose exec php-fpm php artisan tinker

test:
	docker-compose exec php-fpm vendor/bin/phpunit

####################################################

a-install:
	docker-compose exec node yarn install

a-rebuild:
	docker-compose exec node npm rebuild node-sass --force

a-run-dev:
	docker-compose exec node yarn run dev

a-run-watch:
	docker-compose exec node yarn run watch-poll

####################################################

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	sudo chgrp -R www-data storage bootstrap/cache
	sudo chmod -R ug+rwx storage bootstrap/cache
