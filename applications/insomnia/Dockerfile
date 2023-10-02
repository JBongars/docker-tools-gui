# Start with an Ubuntu base image
FROM ubuntu:latest

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    apt-transport-https \
    x11vnc \
    tigervnc-standalone-server \
    tigervnc-common \
    git \
    python3-numpy \
    python3 \
    python3-websockify \
    xinit \
    xvfb

# Install Insomnia
RUN echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | tee -a /etc/apt/sources.list.d/insomnia.list
RUN apt-get update && apt-get install -y insomnia

# Clone noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc \
    && git clone https://github.com/novnc/websockify.git /opt/novnc/utils/websockify

# Install s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Copy service scripts
COPY --chmod=755 root /

# Expose the VNC port and noVNC port
EXPOSE 5900
EXPOSE 6080

# reset environment variables to default
ENV DEBIAN_FRONTEND=dialog

# Start s6 init system
CMD ["/init"]
