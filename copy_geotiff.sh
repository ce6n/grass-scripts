#!/bin/bash

##
## copy gzipped tsx geotiffs
##


SOURCEDIR=/scratch/clisap/landice/tsx/Brunt/data

TARGETDIR=/scratch/clisap/landice/rumples/grass/tsx/brunt/

NAME="brunt"


cd $SOURCEDIR
i=1

for f in dims*/T*/T*/I*/I*.tif.gz
do
	echo "copying file $f"
        echo "$i"
       	cp $f $TARGETDIR/$NAME.$i.gz

        i=$(( $i + 1 ))

done
