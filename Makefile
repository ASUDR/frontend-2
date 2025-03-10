help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) }' $(MAKEFILE_LIST)
.PHONY: help

lint: ## Run linters
	@npm run lint
.PHONY: lint

run: ## Run application
	@npm run serve
.PHONY: run

i: ## Install packages
	@npm install
.PHONY: i

build: ## Build application
	@npm run build
.PHONY: build

ci: ## Build application for CI
	@npm ci && npm run build
.PHONY: ci
