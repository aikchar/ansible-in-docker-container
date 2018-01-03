FROM alpine:3.7

LABEL maintainer "https://github.com/aikchar/ansible-in-docker-container"

# TODO: add comments within RUN step with echo command
RUN set -x &&\
    apk update &&\
    apk add --no-cache \
            ca-certificates \
            python3=3.6.3-r9 &&\
    cd /usr/bin &&\
    ln -s python3 python &&\
    ln -s pip3 pip &&\
    pip install --no-cache-dir -U setuptools &&\
    apk add --no-cache --virtual=build \
            gcc \
            libffi-dev \
            make \
            musl-dev \
            openssh-client \
            openssl-dev \
            python3-dev=3.6.3-r9 &&\
    pip install --no-cache-dir --disable-pip-version-check ansible==2.4.2.0 &&\
    apk del --purge build &&\
    find / -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete &&\
    mkdir -p /srv/ansible &&\
    mkdir -p /root/.ssh

WORKDIR /srv/ansible

VOLUME [ "/srv/ansible" ]
