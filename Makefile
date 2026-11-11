default: help
.PHONY: default help all clean

# Recursively locate all markdown files (ignoring hidden folders like .git)
srcs := $(shell find . -type f -name '*.md' ! -path '*/.*/*')
pdfs := $(srcs:%.md=%.pdf)

all: $(pdfs)  ## Generate all PDF cheatsheets

%.pdf: %.md template/template.typ  ## Make PDF via Typst
	pandoc -f markdown+emoji $< -o $@ --pdf-engine=typst --template=template/template.typ --resource-path=$(dir $<):.

clean: ## Clean generated files
	rm -f $(pdfs)

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
