FROM ghcr.io/linuxserver/prowlarr:latest

# Build args to bust cache when dependencies change
ARG GIST_HASH=unknown

# Copy init script and make it executable
COPY init-indexers.sh /init-indexers

# Download YGG-API indexer
RUN mkdir -p /app/indexers && \
    cd /app/indexers && \
    curl -LO https://gist.github.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60/archive/master.tar.gz && \
    tar -xzf master.tar.gz --strip-components=1 && \
    rm -rf master.tar.gz && \
    curl -LO https://raw.githubusercontent.com/UwUDev/ygege/refs/heads/master/ygege.yml && \
    mv /init /init-linuxserver && \
    mv /init-indexers /init && \
    chmod +x /init
