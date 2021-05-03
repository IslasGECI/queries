FROM islasgeci/base:d24c
COPY . .
RUN pip install \
    black \
    flake8
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes
ENV PATH="/root/.local/lib/shellspec:$PATH"
RUN shellspec --init
