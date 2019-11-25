docker-i:
	docker images -a
	@echo "======================================="
	docker ps -a

docker-up: memory
	docker-compose up -d

docker-down:
	docker-compose down

docker-build: memory
	docker-compose up --build -d

test:
	docker exec laravel_php-cli_1 vendor/bin/phpunit --colors=always

assets-install:
	docker exec laravel_node_1 yarn install

assets-rebuild:
	docker exec laravel_node_1 npm rebuild node-sass --force

assets-dev:
	docker exec laravel_node_1 yarn run dev

assets-watch:
	docker exec laravel_node_1 yarn run watch

# queue:
# 	docker-compose exec php-cli php artisan queue:work
#
# horizon:
# 	docker-compose exec php-cli php artisan horizon
#
# horizon-pause:
# 	docker-compose exec php-cli php artisan horizon:pause
#
# horizon-continue:
# 	docker-compose exec php-cli php artisan horizon:continue
#
# horizon-terminate:
# 	docker-compose exec php-cli php artisan horizon:terminate

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	sudo chgrp -R www-data storage bootstrap/cache
	sudo chmod -R ug+rwx storage bootstrap/cache
