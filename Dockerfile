FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

ARG VERSION=3.0.x
ARG EXTRA_PACKAGES="pcmanfm gnome-themes-standard"

# title
ENV TITLE="Video Duplicate Finder"

RUN curl -L https://github.com/0x90d/videoduplicatefinder/releases/download/$VERSION/App-linux-x64.tar.gz | \
  tar -C/opt --transform='s,outputFolder,vdf,' -zxvf -

# Needs to be 7.x for vdf 3.0.x
RUN add-apt-repository ppa:ubuntuhandbook1/ffmpeg7 && \
  apt-get install -y ffmpeg $EXTRA_PACKAGES && \
  apt-get autoclean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

RUN rm -f /opt/vdf/Settings.json && \
  ln -s /config/.config/vdf.json /opt/vdf/Settings.json && \
  ln -s /config/log.txt /opt/vdf/log.txt && \
  ln -s /opt/vdf/VDF.GUI /usr/local/bin/vdf

# add local files
COPY /root /

VOLUME /config

# ports and volumes
EXPOSE 3000
