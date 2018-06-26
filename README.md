# minidlna-armhf
[![Docker Automated Build](https://img.shields.io/docker/automated/sego/minidlna-armhf.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-armhf)
[![Docker Build Status](https://img.shields.io/docker/build/sego/minidlna-armhf.svg?style=plastic)](https://hub.docker.com/r/sego/minidlna-armhf/)

This is MiniDLNA on top of minimal Alpine armhf.
It can be configured with environment variables.

## Usage

Prefix any configuration directive of MiniDLNA with `MINIDLNA_`
and run your container:

```
docker run -d --net=host \
  -p 8200:8200 \
  --mount type=bind,source=/mnt/storage1/Media,destination=/media,readonly \
  -e MINIDLNA_media_dir=V,/media/Movies \
  -e MINIDLNA_media_dir=PV,/media/Photos \
  -e MINIDLNA_friendly_name=MyMini2 \
  sego/minidlna-armhf
```
