FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London
RUN apk add --no-cache \
    tzdata \
    build-base \
    pandoc \
    graphviz \
    openjdk21-jre \
    libreoffice

ADD . /app
WORKDIR /app
