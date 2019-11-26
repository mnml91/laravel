doc-i:
	docker images -a
	@echo "======================================="
	docker ps -a

doc-up: memory
	docker-compose up -d

doc-down:
	docker-compose down

doc-build: memory
	docker-compose up --build -d

migrate:
	docker exec laravel_php-fpm_1 php artisan migrate

test:
	docker exec laravel_php-cli_1 vendor/bin/phpunit --colors=always

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	sudo chgrp -R www-data storage bootstrap/cache
	sudo chmod -R ug+rwx storage bootstrap/cache

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
