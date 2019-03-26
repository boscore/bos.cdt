FROM boscore/builder as builder
ARG branch=master

ENV OPENSSL_ROOT_DIR /usr/include/openssl

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssl ca-certificates curl wget git cmake python3 g++ vim net-tools lsof wget curl supervisor


RUN cd / && git clone --depth 1 -b master https://github.com/boscore/bos.git --recursive \
    && cd /bos \
    && ./eosio_build.sh -s BOS \
    && ./eosio_install.sh \
    && cd .. \
    && rm -rf ./bos

RUN cd / && git clone -b $branch https://github.com/boscore/bos.cdt.git --recursive \
    && cd /bos.cdt/ \
    && ./build.sh \
    && ./install.sh \
    && cd .. \
    && rm -rf ./bos.cdt

RUN rm -rf /var/lib/apt/lists/*

USER root