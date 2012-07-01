#! /bin/bash
## grass script
## print the map for apollos
##

# for A0
# g.region rast=radarsat_amm125m_v2_1km.tif rows=43200 cols=21600

# for A3
g.region rast=apollo.1.tif.8bit.epsg3031.tif rows=5400 cols=2700
#g.region s=+3000

ps.map output=apollo_profile.ps << EOF
paper a3
  end


# background rasterimage
raster apollo.1.tif.8bit.epsg3031.tif



border n



text 50% -7% Apollo
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


### Scalebar

scalebar f
	where 3 11
	length 5000
	height 0.15
	segment 5
	numbers 2
	background Y
	end



##
##  Vectordata
##

vpoints apollo_profile
  symbol basic/circle
  color 47:174:255
  fcolor 47:174:255
  label Profile
  size 3
  end




end
EOF
