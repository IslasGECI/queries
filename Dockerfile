FROM islasgeci/base:0718
COPY . /workdir
CMD make
RUN apt-get install gettext-base
