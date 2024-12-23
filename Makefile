SRCS = ./srcs

all:
	@make up
up:
	@docker-compose -f $(SRCS)/docker-compose.yml up --build

down:
	@docker-compose -f $(SRCS)/docker-compose.yml down

clean:
	@if [ -n "$$(docker ps -qa)" ]; then \
		docker stop $$(docker ps -qa); \
		docker rm $$(docker ps -qa); \
	fi
	@if [ -n "$$(docker images -qa)" ]; then \
		docker rmi $$(docker images -qa); \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
	 	docker volume rm $$(docker volume ls -q); \
	fi