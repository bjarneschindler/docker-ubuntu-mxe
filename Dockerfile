FROM ubuntu:22.04

# Install dependencies. See https://mxe.cc/#requirements-debian
RUN apt-get update && apt-get -y -qq install \
     autoconf \
     automake \
     autopoint \
     bash \
     bison \
     bzip2 \
     flex \
     g++ \
     g++-multilib \
     gettext \
     git \
     gperf \
     intltool \
     libc6-dev-i386 \
     libgdk-pixbuf2.0-dev \
     libltdl-dev \
     libgl-dev \
     libpcre3-dev \
     libssl-dev \
     libtool-bin \
     libxml-parser-perl \
     lzip \
     make \
     openssl \
     p7zip-full \
     patch \
     perl \
     python3 \
     python3-distutils \
     python3-mako \
     python3-pkg-resources \
     python-is-python3 \
     ruby \
     sed \
     unzip \
     wget \
     xz-utils

# Install MXE system wide. See https://mxe.cc/#installation
# Build MXE with toolchains for dynamic and shared linking for i686 and x86_64 targets.
RUN git clone https://github.com/mxe/mxe.git /opt/mxe && \
  cd /opt/mxe && \
  make cc cmake autotools MXE_TARGETS='i686-w64-mingw32.static i686-w64-mingw32.shared x86_64-w64-mingw32.static x86_64-w64-mingw32.shared' && \
  make clean-junk && \
  rm -rf "/opt/mxe/pkg/*"

ENV PATH="/opt/mxe/usr/bin:${PATH}"
