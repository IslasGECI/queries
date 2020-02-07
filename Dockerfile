FROM islasgeci/base:0718
COPY . /workdir
RUN apt-get install gettext-base
CMD make
