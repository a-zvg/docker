FROM debian:stretch-slim

ARG USER=user
ARG UID=1000
ARG GID=1000

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends locales libatomic1 procps net-tools python3 gdb; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
    useradd -m ${USER} --uid=${UID};

RUN sed -i '/ru_RU.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG C.UTF-8

USER ${UID}:${GID}
WORKDIR /home/${USER}
