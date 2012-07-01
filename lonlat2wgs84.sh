#!/bin/bash


cd /scratch/clisap/landice/rumples/grass/polygon_data/


projargs_S71="+proj=stere +units=m +ellps=WGS84 +lat_0=-90 +lon_0=0 
+lat_ts=-71"



cat koord_apollo_strip.lonlat |   proj -f "%.8f" $projargs_S71 > koord_apollo_strip.wgs84

exit 0
