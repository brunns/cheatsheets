default: help
.PHONY: help

all: emacs.pdf less.pdf textmate.pdf  ## Generate all PDF cheatsheets

%.pdf: %.odt  ## Make PDF
	soffice --convert-to pdf $< --headless

%.odt: %.md  ## Make ODT
	pandoc $< -o $@ --normalize --reference-odt=template/reference.odt

clean: ## Clean generated files
	rm -f *.pdf
	rm -f *.odt

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
