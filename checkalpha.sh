#!/bin/bash

# You need imagemagik installed
# sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev libmagic-dev


FILES=iap_screens/*.png
SR='srgb'
for i in $FILES
do
   # images having alpha will return a value of srgba instead of srgb
   rep=`identify -format '%[channels]' $i`
   if [ "$SR" != "$rep" ]; then
     echo "$i -> $rep"
   fi
done
