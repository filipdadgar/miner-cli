FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        apt-utils \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*
    
RUN apt-get -y install --no-install-recommends \
        libxcb-randr0 \
        libxcb-randr0-dev \
        libxcb-xtest0-dev \
        libxcb-xinerama0-dev \
        libxcb-shape0-dev \
        libxcb-xkb-dev \
        
      && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "lashawn_sc@hotmail.com", "-bcn", "-fcn+xmr"]
