FROM debian:bullseye-slim

ARG USER=user
ARG UID=1000
ARG GID=1000

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends perl git unzip wget bzip2 libxml2-utils patch cpio python python3 gettext; \
    apt-get install -y --no-install-recommends g++ cmake make libpcre3-dev zlib1g-dev libreadline-dev pkg-config; \
    apt-get install -y --no-install-recommends libnet-ssleay-perl libio-socket-ssl-perl ca-certificates; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
    useradd -m ${USER} --uid=${UID};

USER ${UID}:${GID}
WORKDIR /home/${USER}
