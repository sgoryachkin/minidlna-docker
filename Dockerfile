# Base image architecture
ARG architecture=amd64

FROM multiarch/alpine:${architecture}-v3.9

MAINTAINER sgoryachkin <artful.tiger@gmail.com>

# s6-overlay architecture
ARG architecture=amd64

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna ffmpegthumbnailer inotify-tools sqlite

# Install s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-${architecture}.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-${architecture}.tar.gz | tar -xf - -C /

# Copy local files
COPY root/ /

RUN chmod +x /thumbnails.sh && \
    chmod +x /thumbnails-monitor.sh

VOLUME [ "/db", "/media" ]

EXPOSE 8200 1900/udp

ENTRYPOINT ["/init"]
