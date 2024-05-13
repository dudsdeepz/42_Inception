all:
	@docker-compose -f ./src/docker-compose.yml up -d --build

down:
	@docker-compose -f ./src/docker-compose.yml down --volumes
	@docker rmi src_nginx
	@docker rmi src_mariadb
	@docker rmi src_wordpress

re: down
	@docker-compose -f ./src/docker-compose.yml up -d --build