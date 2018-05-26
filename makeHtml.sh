#!/bin/bash

for file in *.dzi;
        do
        filename=$(basename $file ".dzi")
        echo ${filename}.html
        sed "s/{1}/$file/g" template.html > ${filename}.html
        done
