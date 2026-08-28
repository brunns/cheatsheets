FROM alpine:latest
LABEL maintainer="Simon Brunning <simon@brunn.ing>"

ENV TZ=Europe/London
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-headless-shell

RUN <<EOF
  apk add --no-cache \
    tzdata \
    make \
    pandoc \
    typst \
    font-opensans \
    font-noto-symbols \
    nodejs \
    npm \
    chromium-headless-shell

  npm install -g @mermaid-js/mermaid-cli
  npm cache clean --force
  rm -rf /root/.npm /tmp/*
  apk del npm
EOF

COPY <<'EOF' /etc/puppeteer-config.json
{
  "args": [
    "--no-sandbox",
    "--disable-setuid-sandbox",
    "--disable-dev-shm-usage"
  ]
}
EOF

WORKDIR /app
COPY . /app
