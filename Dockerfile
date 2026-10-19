FROM alpine:edge
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London

RUN <<EOF
  apk update
  apk upgrade --no-cache
  apk add --no-cache \
    tzdata \
    make \
    pandoc \
    "typst>=0.15.0" \
    font-noto \
    font-noto-symbols \
    font-noto-emoji
EOF

WORKDIR /app
COPY . /app
