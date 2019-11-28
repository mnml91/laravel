dinfo:
	docker images -a
	@echo "======================================="
	docker ps -a

dclearc:
	docker container rm $$(docker ps -a) -f

dcup: memory
	docker-compose up -d

dcdown:
	docker-compose down

dcbuild: memory perm
	docker-compose up --build -d

migrate:
	docker-compose exec php-fpm php artisan migrate
# 	docker exec laravel_php-fpm_1 php artisan migrate

test:
	docker-compose exec php-fpm vendor/bin/phpunit

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
