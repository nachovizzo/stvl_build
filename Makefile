build:
	docker compose run  stvl cmake -B/app/build -S /app/

docker:
	docker compose build stvl

run:
	docker compose run stvl
