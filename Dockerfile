FROM python:3.6.3-alpine3.6

LABEL maintainer "https://github.com/aikchar/ansible-in-docker-container"

RUN apk update && \
    apk add \
            gcc \
            libffi-dev \
            make \
            musl-dev \
            openssh-client \
            openssl-dev \
            python3-dev && \
    python3 -m venv /usr/local/share/ansible-virtualenv && \
    /usr/local/share/ansible-virtualenv/bin/pip install ansible==2.4.1.0 && \
    apk del \
            gcc \
            libffi-dev \
            musl-dev \
            openssl-dev \
            python3-dev && \
    mkdir -p /srv/ansible && \
    mkdir -p /root/.ssh

WORKDIR /srv/ansible

ENV PATH=/usr/local/share/ansible-virtualenv/bin:$PATH

VOLUME [ "/srv/ansible" ]
