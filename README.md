# Simon's Cheatsheets

Various cheetsheets in [Markdown](https://en.wikipedia.org/wiki/Markdown) format. 3 column documents and PDFs generated with [pandoc](https://pandoc.org/) and [LibreOffice](https://www.libreoffice.org/)'s `soffice` command line tool, both of which need to be installed. 

## Usage

Create and/or edit the `*.md` files, and run `make all` to generate PDFs. For formatting, edit the page settings and/or styles in [template/reference.odt](template/reference.odt).

Run `make help` for more options.

## TODO

I'd like to generate the PDFs directly with pandoc, but this issue - [longtable not compatible with 2-column LaTeX documents](https://github.com/jgm/pandoc/issues/1023) - is preventing me from having tables in multi-column documents, so I'm resorting to `soffice`. Output's not so nice, but it's functional.
