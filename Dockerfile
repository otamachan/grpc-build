FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y \
       build-essential autoconf libtool pkg-config \
       checkinstall \
       gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
       git \
    && rm -rf /var/lib/apt/lists/*
ADD build.sh /root
ADD Makefile /root
WORKDIR /root
CMD ["/root/build.sh"]