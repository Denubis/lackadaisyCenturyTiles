# Lackadaisy Century Art Tiled in Openseadragon

View the tiled art at: https://denubis.github.io/lackadaisyCenturyTiles/lackadaisyCentury.html

Art wholly owned by Tracy J. Butler from the comic [Lackadaisy Cats](http://lackadaisy.foxprints.com/gallery/century_wide_3000.jpg)

OpenSeadragon from [https://openseadragon.github.io/#download](https://openseadragon.github.io/#download)

MagickSlicer from [https://github.com/VoidVolker/MagickSlicer](https://github.com/VoidVolker/MagickSlicer)

After cloning:

~~~
$ cd MagickSlicer
$ git submodule init
$ git submodule update
$ cd ..
$ ./runMagick.sh lackadaisyCentury.jpg 
$ ./makeHtml.sh
~~~