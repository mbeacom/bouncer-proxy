.DEFAULT_GOAL := help

.PHONY: help

clean: ## Remove NPM modules.
	@rm -rf node_modules

test: install ## Install npm dependencies and run tests.
	@npm run test
	@clevis test full

install: ## Install npm dependencies.
	@npm install

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
