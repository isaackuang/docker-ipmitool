FROM ubuntu

RUN apt-get update && \
    apt install -y automake gcc git libreadline-dev libssl-dev \
        libtool make wget musl-dev && \
    cd /tmp && \
    wget https://github.com/ipmitool/ipmitool/archive/refs/tags/IPMITOOL_1_8_19.tar.gz && \
    tar zxvf IPMITOOL_1_8_19.tar.gz && \
    cd ipmitool-IPMITOOL_1_8_19
    ./bootstrap && ./configure && make && make install

ENTRYPOINT "/usr/local/bin/ipmitoolipmitool"
