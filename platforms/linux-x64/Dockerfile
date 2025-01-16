FROM amazonlinux:2023

# Path settings
ENV \
  RUSTUP_HOME="/usr/local/rustup" \
  CARGO_HOME="/usr/local/cargo" \
  PATH="/usr/local/cargo/bin:$PATH"

# Build dependencies
RUN \
  yum update -y && \
  yum groupinstall "Development Tools" -y && \
  yum install -y --setopt=tsflags=nodocs \
    wget \
    vim \
    nano \
    unzip \
    sudo \
    autoconf \
    automake \
    bzip2 \
    cmake3 \
    gettext \
    git \
    gperf \
    jq \
    make \
    nasm \
    openssl-devel \
    patch \
    pkgconfig \
    python3 \
    python3-pip \
    tar \
    xz \
    && \
  curl https://sh.rustup.rs -sSf | sh -s -- -y \
    --no-modify-path \
    --profile minimal \
    && \
  cargo install cargo-c && \
  pip3 install meson ninja packaging tomli

ENV NODE_VERSION=22.13.0
ENV NVM_DIR=/usr/local/nvm
RUN mkdir -p $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} && nvm use v${NODE_VERSION}
ENV PATH=${NVM_DIR}/versions/node/v${NODE_VERSION}/bin/:${PATH}
RUN node -v
RUN npm -v

# Compiler settings
ENV \
  PKG_CONFIG="pkg-config --static" \
  PLATFORM="linux-x64" \
  FLAGS="-march=nehalem" \
  MESON="--cross-file=/root/meson.ini"

COPY Toolchain.cmake /root/
COPY meson.ini /root/


ENV PKG_CONFIG_LIBDIR=/target/lib/pkgconfig
ENV PATH="$PATH:/target/bin"
ENV LD_LIBRARY_PATH=/target/lib
ENV CPPFLAGS="-I/target/include"
ENV LDFLAGS="-L/target/lib"

# RUN sh -c /packaging/build/lin.sh

ENV PKG_CONFIG_PATH=/target/lib/pkgconfig
ENV LIBRARY_PATH=/target/lib:/target/lib64:/usr/local/lib64:/usr/local/lib:/usr/lib64:/usr/lib:/target/lib/glib-2.0/include
ENV LD_LIBRARY_PATH=/target/lib:/usr/local/lib64:/usr/local/lib:/usr/lib64:/usr/lib
ENV VERSION_VIPS=8.15.3
ENV VERSION_LATEST_REQUIRED=false
ENV SHARP_FORCE_GLOBAL_LIBVIPS=true

CMD ["tail", "-f", "/dev/null"]