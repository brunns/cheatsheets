FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London

RUN <<EOF
  apk add --no-cache \
    tzdata \
    make \
    pandoc \
    typst \
    font-noto \
    font-noto-symbols
EOF

WORKDIR /app
COPY . /app
