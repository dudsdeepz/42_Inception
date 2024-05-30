all: gen_volumes
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: down rm_volumes gen_volumes
	@docker-compose -f ./srcs/docker-compose.yml up --build

rm_volumes:
	@echo a12345 | sudo rm -rf /home/eduarodr/data

clean: rm_volumes
	@echo y | docker volume prune
	@docker volume rm srcs_wordpress_data srcs_mariadb_data
	@echo y | docker network prune
	@echo y | docker container prune
	@echo y | docker image prune -a
	@echo y | docker system prune -a

status:
	@docker volume ls
	@echo "====================="
	@docker network ls
	@echo "====================="
	@docker container ls
	@echo "====================="
	@docker image ls

gen_volumes:
	@mkdir -p /home/eduarodr/data
	@mkdir -p /home/eduarodr/data/wp_data
	@mkdir -p /home/eduarodr/data/db_data

.PHONY: all down re rm_volumes clean ls_status gen_volumes
