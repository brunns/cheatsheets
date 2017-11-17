default: help
.PHONY: help

all: emacs.pdf less.pdf  ## Generate all cheatsheets

%.pdf: %.md  ## Make PDF
	pandoc $< -o $@ -V papersize=a4paper #-V geometry=landscape -V classoption=twocolumn

clean: ## Clean generated files
	rm -f *.pdf

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
