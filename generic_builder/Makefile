VERSION = 0.1
USER = cvalenzu
IM_NAME = generic_builder
all:
	docker build --no-cache -t "$(USER)/$(IM_NAME):$(VERSION)" -t "$(USER)/$(IM_NAME):latest" .
	docker push $(USER)/$(IM_NAME)
