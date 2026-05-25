FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

# Aktualizacja systemu i instalacja zależności
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Zmienna wersji OpenTofu
ARG OPENTOFU_VERSION="1.10.7"
ARG TARGETOS="linux"
ARG TARGETARCH="amd64"

# Pobranie i instalacja OpenTofu
RUN curl -L "https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_${TARGETOS}_${TARGETARCH}.zip" -o /tmp/tofu.zip && \
    unzip /tmp/tofu.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/tofu && \
    rm /tmp/tofu.zip

# Katalog roboczy
WORKDIR /workdir

CMD ["tofu", "version"]
