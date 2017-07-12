VERSION = 0.2
USER = cvalenzu
IM_NAME = jenkins_builder
all:
	docker build -t "$(USER)/$(IM_NAME):$(VERSION)" -t "$(USER)/$(IM_NAME):latest" .

no_cache:
	docker build --no-cache -t "$(USER)/$(IM_NAME):$(VERSION)" -t "$(USER)/$(IM_NAME):latest" .
