FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y awscli docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
