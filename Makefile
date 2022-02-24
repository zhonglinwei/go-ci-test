CONFIG_PROJECT_DIR = app/

.PHONY: lint ci-dependence pkg-install

lint: pkg-install ci-dependence
	cd $(CONFIG_PROJECT_DIR) && golangci-lint run

pkg-install: app/go.mod
	cd $(CONFIG_PROJECT_DIR) && go mod download
  
ci-dependence:
	cd $(CONFIG_PROJECT_DIR) && go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.43.0
