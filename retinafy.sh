### Retinafiy.sh ~ v0.12 ###
### (c) 2014 ColibriApps UG (haftungsbeschränkt) ###
### http://www.colibriapps.com ###

#!/bin/bash

for fullfile in $(find original/* -name "*.png"); do

	file=$(basename "$fullfile")
	extension="${file##*.}"
	filename="${file%.*}"

	width=$(sips -g pixelWidth "$fullfile" | tail -n1 | cut -d" " -f4)
	width=$(echo $width/4 | bc);

    height=$(sips -g pixelHeight "$fullfile" | tail -n1 | cut -d" " -f4)
    height=$(echo $height/4 | bc);

    if [ "$height" -gt "$width" ]
    then width=$height;
    fi;

	mkdir "converted"
	mkdir "converted/$filename"

	cp $fullfile "converted/$filename/$filename@4x.$extension"

	cp $fullfile "converted/$filename/$filename@3x.$extension"
	sips -Z $(echo $width*3 | bc) "converted/$filename/$filename@3x.$extension"

	cp $fullfile "converted/$filename/$filename@2x.$extension"
	sips -Z $(echo $width*2 | bc) "converted/$filename/$filename@2x.$extension"

	cp $fullfile "converted/$filename/$filename@1.5x.$extension"
	sips -Z $(echo $width*3/2 | bc) "converted/$filename/$filename@1.5x.$extension"

	cp $fullfile "converted/$filename/$filename@1.3x.$extension"
	sips -Z $(echo $width*4/3 | bc) "converted/$filename/$filename@1.3x.$extension"

	cp $fullfile "converted/$filename/$filename.$extension"
	sips -Z $(echo $width | bc) "converted/$filename/$filename.$extension"

	cp $fullfile "converted/$filename/$filename@0.75x.$extension"
	sips -Z $(echo $width*3/4 | bc) "converted/$filename/$filename@0.75x.$extension"

done
