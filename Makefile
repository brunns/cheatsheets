default: help
.PHONY: help

pdfs: emacs.pdf less.pdf  ## Generate all PDF cheatsheets
odts: emacs.odt less.odt  ## Generate all Open Dcumment format cheatsheets

%.pdf: %.odt  ## Make PDF
	soffice --convert-to pdf $< --headless

%.odt: %.md  ## Make ODT
	pandoc $< -o $@ --normalize --reference-odt=template/reference.odt

clean: ## Clean generated files
	rm -f *.pdf
	rm -f *.odt

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
