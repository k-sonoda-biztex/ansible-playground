FROM python:3.9
ARG ANSIBLE_VERSION

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		sshpass \
		sudo \
		less \
	; \
	rm -rf /var/lib/apt/lists/*;


RUN set -eux; \
    python3 -m venv /opt/venv; \
	. /opt/venv/bin/activate; \
	python3 -m pip install ansible==${ANSIBLE_VERSION:-8.0.0}

ENV PATH /opt/venv/bin:$PATH
WORKDIR /var/opt/ansible
