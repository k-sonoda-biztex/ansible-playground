FROM ubuntu:16.04
ARG ANSIBLE_VERSION

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		curl \
		ca-certificates \
		git \
		# pyenv
		# build-essential \
		# libffi-dev \
		# libssl-dev \
		# zlib1g-dev \
		# liblzma-dev \
		# libbz2-dev \
		# libreadline-dev \
		# libsqlite3-dev \
		# libopencv-dev \
		# tk-dev \
		# end pyenv
		sshpass \
		sudo \
		less \
	; \
	rm -rf /var/lib/apt/lists/*;

ENV PATH $HOME/.pyenv/bin:$PATH
RUN set -eux; \
	curl https://pyenv.run > /tmp/install;\
	bash /tmp/install;

# RUN set -eux; \
#     python3 -m venv /opt/venv; \
# 	. /opt/venv/bin/activate; \
# 	python3 -m pip install ansible==${ANSIBLE_VERSION:-8.0.0}

# ENV PATH /opt/venv/bin:$PATH
# WORKDIR /var/opt/ansible
