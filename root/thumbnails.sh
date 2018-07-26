#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

media_dir="/media";
thumbnails_dir="/db/minidlna/thumbnails";
echo "Media dir: $media_dir"
echo "Thumbnails dir: $thumbnails_dir"

sleep 3

# Create thumbnails
echo "Create thumbnails";
for video_file in $(find "${media_dir}" -type f -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.mp4" -o -iname "*.m4v");
do
    #echo "${video_file}";
    thumbnail_file=${thumbnails_dir}${video_file};
    thumbnail_file="${thumbnail_file}.cover.jpg"
    mkdir -p $(dirname ${thumbnail_file})
    #install -D "${thumbnail_file}" /
    if ! [ -f "${thumbnail_file}" ]
    then
        echo "- create ${thumbnail_file}";
        ffmpegthumbnailer -s 160 -i "${video_file}" -o "${thumbnail_file}";
        sqlite3 /db/minidlna/files.db "INSERT INTO album_art (path) SELECT '${thumbnail_file}' WHERE NOT EXISTS(SELECT 1 FROM album_art WHERE path = '${thumbnail_file}');
                                       UPDATE details SET album_art=(SELECT id FROM album_art WHERE path='${thumbnail_file}'), thumbnail=1 WHERE path='${video_file}';"
    fi
done;

# Cleanup
echo "Clenup thumbnails";
for thumbnail_file in $(find "${thumbnails_dir}" -type f -iname "*.mov.cover.jpg" -o -iname "*.avi.cover.jpg" -o -iname "*.mkv.cover.jpg" -o -iname "*.mp4.cover.jpg" -o -iname "*.m4v.cover.jpg");
do
    #echo "${thumbnail_file}";
    video_file=${thumbnail_file%.cover.jpg};
    video_file=${video_file#"$thumbnails_dir"};

    #echo "${video_file}";
    if ! [ -f "${video_file}" ]
    then
        echo "- remove ${thumbnail_file}";
        rm "${thumbnail_file}";
        sqlite3 /db/minidlna/files.db "DELETE FROM album_art WHERE path = '${thumbnail_file}';"
    fi
done;

# Clean Up Empty dirs
#find "${media_dir}" -type d -empty -delete'[[';;?/
