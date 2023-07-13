build:
	docker compose run stvl colcon build --event-handlers console_direct+

docker:
	docker compose build stvl

run:
	docker compose run stvl

clean:
	git clean -xff .
