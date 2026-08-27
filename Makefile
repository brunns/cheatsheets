default: help
.PHONY: help

pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))
mermaidpngs := $(patsubst %.mermaid,%.png,$(wildcard *.mermaid))

all: $(pdfs)  ## Generate all PDF cheatsheets
images: mermaidimages  ## Generate all images
mermaidimages: $(mermaidpngs)  ## Generate all graphviz images

%.pdf: %.md images  ## Make PDF via Typst
	pandoc $< -o $@ --pdf-engine=typst --template=template/template.typ

%.png: %.mermaid ## Make mermaid image
	mmdc -p /etc/puppeteer-config.json -i $< -o $@

clean: ## Clean generated files
	rm -f *.pdf
	rm -f *.png

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1,$$2}'
