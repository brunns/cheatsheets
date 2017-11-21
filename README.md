# Simon's Cheatsheets

Various cheetsheets in [Markdown](https://en.wikipedia.org/wiki/Markdown) format. PDFs and documents generated with [pandoc](https://pandoc.org/) and [LibreOffice](https://www.libreoffice.org/)'s `soffice` command line tool, both of which need to be installed. Run `make help` for options.

Edit `*.md` files to edit the cheatsheets, and add new ones to the [Makefile](Makefile). For formatting, edit the page settings and/or styles in [templates/reference.odt](templates/reference.odt).

## TODO

I'd like to generate the PDFs directly with pandoc, but this issue - [longtable not compatible with 2-column LaTeX documents](https://github.com/jgm/pandoc/issues/1023) - is preventing me from having tables in multi-line documents, so I'm resorting to `soffice`. Output's not so nice, but it's functional.
