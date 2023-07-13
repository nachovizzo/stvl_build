humble:
	docker compose run $@ colcon build --event-handlers console_direct+

iron:
	docker compose run $@ colcon build --event-handlers console_direct+

dockers:
	docker compose build humble

humble-run:
	docker compose run humble

iron-run:
	docker compose iron humble

clean:
	git clean -xff .
