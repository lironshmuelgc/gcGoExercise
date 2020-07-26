#!make

build:
	docker-compose build

all-up:
	docker-compose up -d

all-down:
	docker-compose down

## RabbitMQ

rabbitmq-up:
	docker-compose up -d rabbitmq

rabbitmq-down:
	docker-compose stop rabbitmq

rabbitmq-producer:
	go run main.go producer

rabbitmq-consumer:
	go run main.go consumer