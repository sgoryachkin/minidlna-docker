FROM multiarch/alpine:armhf-v3.8

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna

EXPOSE 8200 1900/udp

USER minidlna

COPY entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
