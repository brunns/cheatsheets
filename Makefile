default: help
.PHONY: help

pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))
dotpngs := $(patsubst %.dot,%.png,$(wildcard *.dot))

all: $(pdfs)  ## Generate all PDF cheatsheets
images: dotimages  ## Generate all images
dotimages: $(dotpngs)  ## Generate all graphviz images

%.pdf: %.md images  ## Make PDF via Typst
	pandoc $< -o $@ --pdf-engine=typst --template=template/template.typ

%.png: %.dot ## Make graphviz image
	dot -Tpng -o $@ $<

clean: ## Clean generated files
	rm -f *.pdf
	rm -f *.png

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
