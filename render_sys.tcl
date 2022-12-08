animate goto 0
scale by 1.200000

rotate x by -90

pbc wrap -center com -compound residue -all

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

#Executing post-render cmd '"/usr/local/lib/vmd/tachyon_LINUXAMD64" -res 1600 1600 -aasamples 32 complex.dat -format TARGA -o complex.dat.tga' ...

mol showrep 0 0 0

#phenol within dendriber

mol color ColorID 1
mol representation Lines 1.000000
mol selection same residue as (within 10 of (segname D1)) and not water and not segname D1
mol material Opaque
mol addrep 0

#mol modselect 1 0 same residue as (within 10 of (segname D1)) and not water and not segname D1

#mol modcolor 1 0 ColorID 1

#dendrimer

mol modmaterial 3 0 Edgy
mol color ColorID 0
mol representation Licorice 0.700000 50.000000 50.000000
mol selection segname D1
mol material Opaque
mol addrep 0
#mol modselect 2 0 segname D1
#mol modcolor 2 0 ColorID 0
#mol modstyle 2 0 Licorice 0.600000 50.000000 50.000000
#mol modmaterial 2 0 Edgy
#bottom phenol layer

mol color ColorID 4
mol representation Lines 1.000000
mol selection same residue as (not within 10 of (segname D1)) and not water and not segname D1
mol material Opaque
mol addrep 0

#mol modselect 3 0 same residue as (not within 10 of (segname D1)) and not water and not segname D1

#mol modcolor 3 0 ColorID 4

# to water
mol modmaterial 5 0 Edgy
mol color ColorID 2
mol representation Lines 1.000000
mol selection water
mol material Edgy
mol addrep 0
#mol modselect 4 0 water
#mol modcolor 4 0 ColorID 2

render snapshot frame0.tga "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 32 -res 1600 1600  %s -format TARGA -o %s.tga
