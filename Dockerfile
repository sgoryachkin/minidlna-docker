FROM multiarch/alpine:armhf-v3.8

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna

COPY entrypoint.sh /

COPY prepare.sh /

RUN /prepare.sh

EXPOSE 8200 1900/udp

#USER minidlna

ENTRYPOINT ["/entrypoint.sh"]
