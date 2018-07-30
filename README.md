# RedyMedia (MiniDLNA) docker image with thumbnails

[![Docker Automated](https://img.shields.io/docker/automated/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna)
[![Docker Build](https://img.shields.io/docker/build/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna)


## Overview

This is MiniDLNA with thumbnails on top of minimal Alpine Linux.
It can be configured with environment variables.


## Supported architecture

Next repositories are availible:

Arch | Repository | Pulls
------------|------------ | -------------
AMD64|sego/minidlna | [![amd64](https://img.shields.io/docker/pulls/sego/minidlna.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna)
AArch64|sego/minidlna-aarch64 | [![aarch64](https://img.shields.io/docker/pulls/sego/minidlna-aarch64.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-aarch64) 
ARMHF|sego/minidlna-armhf | [![armhf](https://img.shields.io/docker/pulls/sego/minidlna-armhf.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-armhf)

## System requirements

Support [inotify](https://en.wikipedia.org/wiki/Inotify) in kernel and in /media volume file system


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
