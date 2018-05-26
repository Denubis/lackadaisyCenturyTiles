#!/bin/bash

set -euo pipefail

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

echo $1

if [ $(mimetype -b "$1") == "image/svg+xml" ]
then
  echo "this is a svg"
  #rsvg-convert -d 6000 -p 6000 -a -f png -o ${filename}.png $1
  java -Xmx15g  -jar ~/batik-1.8/batik-rasterizer-1.8.jar -w 8000 -bg "255.255.255.255" -m image/tiff $1 -d "${filename}.tif" 

  tgtExtension="jpg"
  gm convert ${filename}.tif -profile sRGB_v4_ICC_preference.icc ${filename}.jpg    
  #rm ${filename.png}
elif [[ $(mimetype -b "$1") == "image/tiff" ]]; then
	gm convert $1 -profile sRGB_v4_ICC_preference.icc ${filename}.jpg  
	tgtExtension="jpg"
elif [[ $(mimetype -b "$1") == "image/jpeg" ]]; then
	tgtExtension="jpg"
else
	echo "Can't figure out filetype."
	exit 1
fi




rm -f ${filename}.dzi
rm -rf ${filename}_files
./magick-slicer.sh ${filename}.$tgtExtension ${filename}
