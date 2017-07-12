VERSION = 0.2
USER = csrg
IM_NAME = generic_builder
all:
	docker build --no-cache -t "$(USER)/$(IM_NAME):$(VERSION)" -t "$(USER)/$(IM_NAME):latest" .
