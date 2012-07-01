#! /bin/bash
##
## print the map for west ice-shelf
##

# for A0
# g.region rast=radarsat_amm125m_v2_1km.tif rows=43200 cols=21600

# for A3
g.region rast=west.3.tif.8bit.epsg3031.tif_tsx,west.2.tif.8bit.epsg3031.tif_tsx,west.1.tif.8bit.epsg3031.tif_tsx rows=5400 cols=2700
g.region s=+3000

ps.map output=west_mosaic_rises.ps << EOF
paper a3
  end


# background rasterimage
raster west.1-3



border n



text 50% -7% Rises | West TSX
  fontsize 14
  end



# mapinfo
#  where 13.5 3.25
#  fontsize 15
#  end

#grid 100000   
#  color white
#  numbers 10 red
#end

vlegend
        where 12.5 8
        font Courier
        fontsize 12
        border black
        end


##
##  Vectordata
##

vpoints rises_west
  symbol basic/triangle
  color black
  fcolor 47:174:255
  label rises
  end




end
EOF
