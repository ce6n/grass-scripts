#!/bin/bash
##
## import multiple images into grass
## apollos
## remove black

imagedir=/scratch/clisap/landice/rumples/grass/tsx/apollo
name=apollo



cd $imagedir

for TIF in *
do 
	r.in.gdal -o in="${TIF}" out="${TIF}"
done

echo "Starting removeblack-process"
echo "`date`"





for f in `g.mlist type=rast sep=" " pattern="apollo*"`
do
	echo "processing - $f"
	r.null map="$f" setnull=0
done

echo "finishd at"
echo "`date`"

