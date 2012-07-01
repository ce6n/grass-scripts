#!/bin/bash
##
## patch all fimbulisen tsx
##


g.region rast=`g.mlist type=rast mapset=9_bis_0_uhr pattern="fimbulisen*" separator=comma`

r.patch input=`g.mlist type=rast mapset=9_bis_0_uhr pattern="fimbulisen*" separator=comma` output=fimbulisen_all.tif -z --verbose --overwrite

