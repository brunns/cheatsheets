FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London

RUN apk add --no-cache \
    tzdata \
    make \
    pandoc \
    typst \
    font-dejavu \
    font-noto-symbols \
    nodejs \
    npm \
    chromium-headless-shell
RUN npm install -g @mermaid-js/mermaid-cli

RUN cat <<'EOF' > /etc/puppeteer-config.json
{
  "executablePath": "/usr/bin/chromium-headless-shell",
  "args": [
    "--no-sandbox",
    "--disable-setuid-sandbox",
    "--disable-dev-shm-usage"
  ]
}
EOF

WORKDIR /app
COPY . /app
