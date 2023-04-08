up:
	docker-compose -f ./srcs/docker-compose.yml up --build

down :
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	rm -rf /home/mel-amma/data/db/* && rm -rf /home/mel-amma/data/wp/* \
	&& docker volume rm -f srcs_db && docker volume rm -f srcs_wp
fclean: clean
	docker system prune -a
