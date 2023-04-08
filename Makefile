up:
	docker-compose -f ./ressources/docker-compose.yml up --build

down :
	docker-compose -f ./ressources/docker-compose.yml down
clean:
	rm -rf /home/mel-amma/data/db/* && rm -rf /home/mel-amma/data/wp/* \
	&& docker volume rm -f ressources_db && docker volume rm -f ressources_wp
fclean: clean
	docker system prune -a
