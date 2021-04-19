FROM ubuntu:18.04
WORKDIR /workdir
COPY . .
ENV PYTHONIOENCODING=utf-8
RUN apt-get update && apt-get install --yes --no-install-recommends \
    csvkit \
    gettext-base \
    jq \
    make \
    python3 \
    python3-dev \
    python3-pip \
    python-pip
RUN apt-get install --yes git
RUN pip install setuptools
RUN pip install shelldoctest
RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local
CMD make
