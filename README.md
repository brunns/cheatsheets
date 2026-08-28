# Simon's Cheatsheets

Various cheetsheets in [Markdown](https://www.markdownguide.org) format. 3 column documents and PDFs generated with [pandoc](https://pandoc.org), [typst](https://typst.app), [merman](https://typst.app/universe/package/merman/), [fletcher](https://typst.app/universe/package/fletcher), [cetz](https://typst.app/universe/package/cetz) and the [Noto fonts](https://fonts.google.com/noto):

```sh
brew install pandoc typst font-noto-sans font-noto-sans-symbols
```

## Usage

Create and/or edit the `*.md` files, and run `make all` to generate PDFs. For formatting, edit the page settings and/or styles in [template/template.typ](template/template.typ).

Run `make help` for more options.

### Docker usage

If you'd rather not install the dependencies, you can build the sheets in [Docker](https://www.docker.com/). See "Tasks" below. 

## Tasks

### pdf

Make all PDFs.

```sh
make all
```

### docker-image

Build docker image.

```sh
docker build -t $(basename $(pwd)) .
```

### docker-pdf

Make all PDFs in docker.

Requires: docker-image

```sh
docker run -v `pwd`:/app $(basename $(pwd)) make all
```
