humble:
	docker compose run $@ colcon build --event-handlers console_direct+

iron:
	docker compose run $@ colcon build --event-handlers console_direct+

dockers:
	docker build --build-arg ROS_DISTRO=humble -t stvl_build:humble .
	docker build --build-arg ROS_DISTRO=iron   -t stvl_build:iron   .

humble-run:
	docker compose run humble

iron-run:
	docker compose iron humble

clean:
	git clean -xff .
