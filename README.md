# minidlna
[![Docker Automated](https://img.shields.io/docker/automated/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna)
[![Docker Build](https://img.shields.io/docker/build/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna


## Supported architecture

[![amd64](https://img.shields.io/docker/pulls/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna)
[![aarch64](https://img.shields.io/docker/pulls/sego/minidlna-aarch64.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-aarch64)
[![armhf](https://img.shields.io/docker/pulls/sego/minidlna-armhf.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-armhf)

This is MiniDLNA with thumbnails on top of minimal Alpine Linux.
It can be configured with environment variables.

## Usage

Prefix any configuration directive of MiniDLNA with `MINIDLNA_`
and run your container:

```
docker run -d --net=host \
  -p 8200:8200 \
  --mount type=bind,source=/mnt/storage1/Media,destination=/media,readonly \
  -e MINIDLNA_media_dir=V,/media/Movies \
  -e MINIDLNA_friendly_name=Movies \
  sego/minidlna-armhf
```
