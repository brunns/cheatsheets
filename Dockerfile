FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London
RUN apk add --no-cache \
    tzdata \
    build-base \
    pandoc \
    graphviz \
    openjdk21-jre \
    libreoffice \
    font-dejavu \
    font-noto-symbols \
    font-noto-extra

ADD . /app
WORKDIR /app
