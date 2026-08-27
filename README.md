# Simon's Cheatsheets

Various cheetsheets in [Markdown](https://www.markdownguide.org) format. 3 column documents and PDFs generated with [pandoc](https://pandoc.org), [typst](https://typst.app), and [Mermaid](https://mermaid.ai). 

## Usage

Create and/or edit the `*.md` and `*.mermaid` files, and run `make all` to generate PDFs. For formatting, edit the page settings and/or styles in [template/template.typ](template/template.typ).

Run `make help` for more options.

### Docker usage

If you'd rather not install the dependencies, you can build the sheets in [Docker](https://www.docker.com/). I do. See "Tasks" below. 

## Tasks

### build-image

Build docker image.

```sh
docker build -t $(basename $(pwd)) .
```

### pdf

Make all PDFs.

```sh
docker run -v `pwd`:/app $(basename $(pwd)) make all
```
