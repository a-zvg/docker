FROM debian:stretch-slim

ARG USER=user
ARG UID=1000
ARG GID=1000

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends perl git unzip wget bzip2 libxml2-utils patch cpio python gettext; \
    apt-get install -y --no-install-recommends g++ cmake make libpcre3-dev zlib1g-dev libreadline-dev pkg-config; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
    useradd -m ${USER} --uid=${UID};

USER ${UID}:${GID}
WORKDIR /home/${USER}
