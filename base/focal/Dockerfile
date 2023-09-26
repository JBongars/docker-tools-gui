FROM ubuntu:focal AS builder

ARG TIGER_VNC_VERSION=1.13.1
ARG UBUTNU_VERSION=20.04LTS
ARG S6_OVERLAY_VERSION=3.1.5.0


# Install TigerVNC
# RUN apt-get -y install cmake zlib pixman
# ADD https://github.com/TigerVNC/tigervnc/archive/refs/tags/v${TIGER_VNC_VERSION}.tar.gz /home/user/tigervnc.tar.gz
# RUN tar -xvzf tigervnc.tar.gz && mv tigervnc-${TIGER_VNC_VERSION} tigervnc && rm tigervnc.tar.gz
ADD https://sourceforge.net/projects/tigervnc/files/stable/${TIGER_VNC_VERSION}/ubuntu-${UBUTNU_VERSION}/ /tigervnc


FROM ubuntu:focal AS runner

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx xz-utils

RUN useradd myuser
RUN usermod -aG sudo myuser
RUN mkdir /home/myuser && chown myuser:myuser /home/myuser

WORKDIR /home/myuser