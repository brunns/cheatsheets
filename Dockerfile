FROM alpine:3.24.1
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London

RUN <<EOF
  apk update
  apk upgrade --no-cache
  apk add --no-cache \
    tzdata \
    make \
    pandoc \
    typst \
    font-noto \
    font-noto-symbols \
    font-noto-emoji
EOF

WORKDIR /app
COPY . /app
