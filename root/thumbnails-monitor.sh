#!/bin/bash

echo "Run first thumbnails creation"

/thumbnails.sh

echo "Running change media monitor"

exec inotifywait --format "%e %w%f" -e delete -e move -e close_write -m -r /media |
while read event fullpath; do
    /thumbnails.sh
done
