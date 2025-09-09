FROM public.ecr.aws/b4k7y1u8/ubi-minimal:9.4-n20
ARG BUILDPLATFORM
RUN uname -a && cat /etc/issue

RUN microdnf install -y --nodocs \
    gcc \
    gcc-c++ \
    make \
    autoconf \
    automake \
    libtool \
    tar \
    xz \
    git \
    wget \
    cmake3 \
    jq \
    procps \
    bzip2 \
    patch \
    wget \
    python3-pip \
    pkgconfig \
    diffutils \
    unzip \
    gettext \
    git-clang-format \
    openssl-devel

RUN rpm -i https://rpmfind.net/linux/centos-stream/9-stream/AppStream/x86_64/os/Packages/gperf-3.1-13.el9.x86_64.rpm 
RUN npm install -g npm@10.8.3

# Compiler settings
ENV \
  PKG_CONFIG="pkg-config --static" \
  PLATFORM="linux-x64" \
  FLAGS="-march=nehalem"

WORKDIR /usr/src/app