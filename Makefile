TAG:=${IMAGE_TAG}
IMAGE:=andreburgaud/locust

default: help

help:
	@echo 'Locust.io ${TAG} Docker image build file'
	@echo
	@echo 'Usage:'
	@echo '    make clean           Delete dangling and Locust images'
	@echo '    make build           Build the Locust image using local Dockerfile'
	@echo '    make push            Push an existing image to Docker Hub'
	@echo

build:
	docker build --build-arg locust_version=${TAG} -t ${IMAGE}:${TAG} .

clean:
	# Remove containers with exited status:
	docker rm `docker ps -a -f status=exited -q` || true
	docker rmi ${IMAGE}:latest || true
	docker rmi ${IMAGE}:${TAG} || true
	# Delete dangling images
	docker rmi `docker images -f dangling=true -q` || true

github:
	git push --set-upstream origin master
	git tag -a ${TAG} -m 'Version ${TAG}'
	git push origin --tags

.PHONY: help build clean github
