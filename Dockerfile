FROM ubuntu:18.04 # no podemos actualizar a 20.04 (¿tal vez por shelldoctest?)
WORKDIR /workdir
COPY . .
ENV PYTHONIOENCODING=utf-8
RUN apt-get update && apt-get install --yes --no-install-recommends \
    csvkit \
    gettext-base \
    jq \
    make \
    python-pip
RUN pip install setuptools   # este paso debe suceder primero y sólo, no fusinado con el siguiente
RUN pip install shelldoctest
CMD make
