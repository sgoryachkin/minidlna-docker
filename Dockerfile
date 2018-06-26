FROM multiarch/alpine:armhf-v3.7

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna

#ADD ./config/ /config/

EXPOSE 8200 1900/udp

ENTRYPOINT /usr/sbin/minidlnad -R -S -f /config/minidlna.conf 
