FROM postgres:12.5

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends locales libatomic1 procps net-tools; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN sed -i '/ru_RU.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG C.UTF-8
