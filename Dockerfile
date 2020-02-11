FROM ubuntu:18.04
ENV PYTHONIOENCODING=utf-8
RUN apt-get update && apt-get install --yes --no-install-recommends \
    csvkit \
    gettext-base \
    make
COPY . /workdir
WORKDIR /workdir
CMD make
