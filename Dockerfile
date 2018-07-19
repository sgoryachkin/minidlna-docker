FROM multiarch/alpine:${ARCH}-v3.8

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna ffmpegthumbnailer

# Install s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-${ARCH}.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-${ARCH}.tar.gz | tar -xf - -C /

# Copy local files
COPY root/ /

RUN chmod +x /thumbnails.sh

VOLUME [ "/data", "/media" ]

EXPOSE 8200 1900/udp

ENTRYPOINT ["/init"]
