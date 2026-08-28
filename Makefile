default: help
.PHONY: help

pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))

all: $(pdfs)  ## Generate all PDF cheatsheets

%.pdf: %.md   ## Make PDF via Typst
	pandoc $< -o $@ --pdf-engine=typst --template=template/template.typ

clean: ## Clean generated files
	rm -f *.pdf

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
