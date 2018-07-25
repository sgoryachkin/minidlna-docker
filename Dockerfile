# Base image architecture
ARG architecture=amd64

FROM multiarch/alpine:${architecture}-v3.8

# s6-overlay architecture
ARG architecture=amd64

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna ffmpegthumbnailer inotify-tools unionfs-fuse

# Install s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-${architecture}.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-${architecture}.tar.gz | tar -xf - -C /

# Copy local files
COPY root/ /

RUN chmod +x /thumbnails.sh && \
    chmod +x /thumbnails-monitor.sh && \
    adduser -DH thumbnailer && \
    mkdir -p /data
#   chown -R thumbnailer /data && \
#    chmod -R 447 /data && \
    #mkdir -p /var/run/minidlna && \
    #chown -R minidlna /var/run/minidlna



VOLUME [ "/db", "/media" ]

EXPOSE 8200 1900/udp

ENTRYPOINT ["/init"]
