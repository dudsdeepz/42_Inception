all: gen_volumes
	@docker-compose -f ./src/docker-compose.yml up --build
down:
	@docker-compose -f ./src/docker-compose.yml down --volumes
	@echo y | docker image prune -a
	@echo y | docker system prune -a

re: down rm_volumes gen_volumes
	@docker-compose -f ./src/docker-compose.yml up --build

rm_volumes:
	@echo a12345 | sudo rm -rf /home/eduarodr/data

gen_volumes:
	@mkdir -p /home/eduarodr/data
	@mkdir -p /home/eduarodr/data/wp_data
	@mkdir -p /home/eduarodr/data/db_data