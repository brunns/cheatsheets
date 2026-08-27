FROM debian:trixie-slim
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    build-essential \
    pandoc \
    graphviz \
    libreoffice-writer-nogui \
    fonts-open-sans \
    fonts-dejavu \
    fonts-noto-core \
    fonts-noto-extra \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app
