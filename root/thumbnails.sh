#!/bin/bash
media_dir="/data";
echo "Media dir: $media_dir"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Create thumbnails
echo "Create thumbnails";
for video_file in $(find "${media_dir}" -type f -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.m4v");
do
    #echo "${video_file}";
    thumbnail_file=/db/minidlna/art_cache${video_file};
    thumbnail_file="${thumbnail_file%.*}.jpg"

    install -Dv / "${thumbnail_file}"
    if ! [ -f "${thumbnail_file}" ]
    then
        echo "- create ${thumbnail_file}";
        ffmpegthumbnailer -s 160 -i "${video_file}" -o "${thumbnail_file}";
        touch -f ${video_file}
    fi
done;

# Cleanup
echo "Clenup thumbnails";
for thumbnail_file in $(find "${media_dir}" -type f -iname "*.mov.cover.jpg" -o -iname "*.avi.cover.jpg" -o -iname "*.mkv.cover.jpg" -o -iname "*.mp4.cover.jpg" -o -iname "*.m4v.cover.jpg");
do
    #echo "${thumbnail_file}";
    video_file=${thumbnail_file%.cover.jpg};
    #echo "${video_file}";
    if ! [ -f "${video_file}" ]
    then
        echo "- remove ${thumbnail_file}";
        rm "${thumbnail_file}";
    fi
done;

# Clean Up Empty dirs
#find "${media_dir}" -type d -empty -delete'[[';;?/