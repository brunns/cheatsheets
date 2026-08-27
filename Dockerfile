FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London

RUN apk add --no-cache \
    tzdata \
    make \
    pandoc \
    graphviz \
    typst \
    font-dejavu \
    font-noto-symbols

WORKDIR /app
COPY . /app
