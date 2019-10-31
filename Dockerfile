FROM ubuntu:18.04
MAINTAINER wudimenghuan@gmail.com

RUN \
  apt update && apt -y upgrade && \
  apt -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint && \
  rm -rf /var/lib/apt/lists/* 

RUN \
  git clone https://github.com/coolsnowwolf/lede.git && cd lede && \
  ./scripts/feeds update -a && ./scripts/feeds install -a

ENV FORCE_UNSAFE_CONFIGURE 1

WORKDIR /lede
