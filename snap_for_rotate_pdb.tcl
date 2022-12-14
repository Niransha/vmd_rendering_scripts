#!/bin/tclsh
#script for totate pdb render 
#11/30/2021 NRK
#will output all snapshot, 
#############################################

display projection Orthographic

display depthcue off
color Type C lime
color Display Background white
display depthcue off
display resize 800 800
axes location Off

display shadows on
display ambientocclusion on
display aodirect 0.400000
display aodirect 0.500000
display aoambient 0.700000
scale by 1.200000
scale by 1.200000

mol modstyle 0 0 CPK 0.800000 0.300000 12.000000 12.000000


set selection [atomselect top all ]
set n [molinfo top get numframes]


for {set i 0} {$i < $n} {incr i} {

#	$selection frame $i		
#	$selection update			

animate goto $i
render snapshot $i\_gammaRotate2D.tga "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 32 -res 1600 1600  %s -format TARGA -o %s.tga

}
