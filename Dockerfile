FROM multiarch/alpine:armhf-v3.8

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna

COPY entrypoint.sh /

EXPOSE 8200 1900/udp

ENTRYPOINT ["/entrypoint.sh"]
