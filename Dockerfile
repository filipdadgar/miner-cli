FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        curl \
        libxcb1 \
        libpcre16-3 \
    && rm -r /var/lib/apt/lists/*

RUN apt-get upgrade -qq -y

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb


ENTRYPOINT ["minergate-cli"]
CMD ["-user", "lashawn_sc@hotmail.com", "-bcn", "-fcn+xmr"]
