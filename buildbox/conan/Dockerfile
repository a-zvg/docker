FROM python:3.9.12-slim-bullseye

ARG USER=user
ARG UID=1000
ARG GID=1000

RUN set -ex; \
    pip3 install --upgrade pip setuptools wheel; \
    pip3 install conan==1.47.0;

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends g++ cmake make patch; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
    useradd -m ${USER} --uid=${UID};

USER ${UID}:${GID}
WORKDIR /home/${USER}
