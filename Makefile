build:
	docker buildx create --use
	docker buildx build --build-arg VERSION=v3.8.2 --platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 -t helm .