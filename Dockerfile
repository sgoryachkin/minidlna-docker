FROM multiarch/alpine:armhf-v3.8

RUN \
   apk update && \
   apk upgrade && \
   apk add bash minidlna tini

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

EXPOSE 8200 1900/udp

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
