#!/bin/bash
reponame=$(basename `git rev-parse --show-toplevel`)
for file in *.dzi;
        do
        filename=$(basename $file ".dzi")
        echo ${filename}.html
        sed "s/{1}/$file/g" template.html | sed "s/{2}/$reponame/g" > ${filename}.html
        done
