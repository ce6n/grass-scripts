#!/bin/bash
## convert satellite images to import in grass


imgdir=/scratch/clisap/landice/rumples/grass/tsx/apollo
name=apollo


echo "Starting convert-process"
echo "`date`"
echo "in $imgdir and with name $name"



cd $imgdir


##
## unzip
##

#echo "Unzipping..."
#gunzip $name.*.gz


##
## convert from 16bit to 8bit
##

for f in $name.*
do
	echo "Converting file to 8bit - $f"
        gdalenhance -ot Byte -equalize $f $f.8bit.tif
        # convert and rename
        echo "Removing original file - $f"
        rm $f
done

echo "Removing aux files"
rm *.aux.xml    # remove aux files

##
## warp to epsg:3031
##

for f in $name.*.8bit.tif
do
	echo "Warping to epsg:3031 - $f"
	gdalwarp -t_srs 'epsg:3031' $f ${f%.tif}.epsg3031.tif
	echo "Removing original file - $f"
        rm $f
done


echo "ready!"
echo "`date`"
