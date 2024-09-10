.PHONY: build run build-podman run-podman build-nocache build-nocache-podman

IMAGE_NAME ?= bu-spark

build:
	docker build -t $(IMAGE_NAME) -f Containerfile .

run:
	docker rm $(IMAGE_NAME) || true
	docker run -d --name $(IMAGE_NAME) -p 4000:4000 -v $(PWD):/srv/jekyll -v $(PWD)/vendor/bundle:/usr/local/bundle $(IMAGE_NAME)

build-podman:
	podman build -t $(IMAGE_NAME) .

run-podman:
	podman rm $(IMAGE_NAME) || true
	podman run -d --name $(IMAGE_NAME) -p 4000:4000 -v $(PWD):/srv/jekyll:z -v $(PWD)/vendor/bundle:/usr/local/bundle:z $(IMAGE_NAME)

build-nocache:
	docker build --no-cache -t $(IMAGE_NAME) .

build-nocache-podman:
	podman build --no-cache -t $(IMAGE_NAME) .
