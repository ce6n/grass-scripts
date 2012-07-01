#! /bin/bash
##
## print the map with all
##

# for A0
# g.region rast=radarsat_amm125m_v2_1km.tif rows=43200 cols=21600

# for A1
g.region rast=clipped_radarsat rows=21600 cols=10800


ps.map -r output=aushaengemap.ps << EOF
paper a1
  end


# background rasterimage
raster clipped_radarsat



border n



#text 50% -7% clipped Radarsat
#  fontsize 14
#  end



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

#scalebar f
#	where 3 11
#	length 5000
#	height 0.15
#	segment 5
#	numbers 2
#	background Y
#	end



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
