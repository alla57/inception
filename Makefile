all:
	@sudo mkdir -p /home/allab/data/mariadb_volume /home/allab/data/wp_volume
	@docker-compose -f ./srcs/docker-compose.yml up --build -d
	
restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)
	@sudo rm -rf /home/allab/data

.PHONY: all clean fclean re