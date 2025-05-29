GIT_TAG = $(shell git describe --tags --always --abbrev=0)

ifeq "$(shell git rev-list HEAD ^${GIT_TAG} | wc -l)" "0"
VERSION ?= ${GIT_TAG}
else
GIT_PSEUDO_TAG= $(shell echo ${GIT_TAG} | awk -F. '{printf("%s.%s.%s",$$1,$$2,$$3+1)}')
GIT_COMMIT = $(shell git show -s --pretty="format:%cd-%<(14,trunc)%H" --date=format:%Y%m%d%H%M%S --abbrev=0 | sed 's/\.\.//g')
VERSION ?= ${GIT_PSEUDO_TAG}-${GIT_COMMIT}
endif

DOCKER ?= docker
BUILDER := registry.smtx.io/iomesh-backup/arc-image
IMAGE_TAG ?= ${shell echo $(VERSION) | awk -F '/' '{print $$NF}'}

docker-build:
	$(DOCKER) build -t $(BUILDER):$(IMAGE_TAG) .

docker-push: docker-build
	$(DOCKER) push $(BUILDER):$(IMAGE_TAG)
