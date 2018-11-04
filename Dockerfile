FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*
    
RUN apt-get -y install --no-install-recommends \
    "^libxcb.*"                                \
    libx11-xcb-dev                             \
    libglu1-mesa-dev                           \
    libxrender-dev                             \
    libxi-dev

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "lashawn_sc@hotmail.com", "-bcn", "-fcn+xmr"]
