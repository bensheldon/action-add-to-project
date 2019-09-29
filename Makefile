GIT_SHA = $(shell git log -1 --pretty=%h)
GITHUB_REGISTRY=docker.pkg.github.com/bensheldon/action-add-to-project/action-add-to-project:$(GIT_SHA)

docker-publish:
	docker build -t action-add-to-project .
	docker tag action-add-to-project:latest action-add-to-project:$(GIT_SHA)
	docker tag action-add-to-project:latest $(GITHUB_REGISTRY)
	docker push $(GITHUB_REGISTRY)
