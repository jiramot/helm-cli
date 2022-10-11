build:
	docker buildx create --use
	docker buildx build --push --build-arg VERSION=v3.10.0 --platform linux/arm64/v8,linux/amd64 -t jiramot/helm-cli:v3.10.0 .