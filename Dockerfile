FROM ubuntu:18.04
WORKDIR /workdir
COPY . .
ENV PYTHONIOENCODING=utf-8
RUN apt-get update && apt-get install --yes --no-install-recommends \
    csvkit \
    gettext-base \
    make \
    python-pip
RUN pip install setuptools
RUN pip install shelldoctest
RUN apt-get install jq --yes
CMD make
