build:
	docker run --rm stvl_build:latest cmake -B/app/build -S /app/

docker:
	docker build -t stvl_build:latest .

run:
	docker run --rm -it \
		--user 1000:1000 \
		-v $(shell pwd)/spatio_temporal_voxel_layer:/app:rw \
		stvl_build:latest
