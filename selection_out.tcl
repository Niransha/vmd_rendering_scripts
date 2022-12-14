########## get pdb name ########
set name1 [ molinfo top get name]
set name2 [split $name1 . ]
set pdbname [lindex $name2 0]
puts $pdbname
#############################


set sel [atomselect top all]

set n [molinfo top get numframes]

for { set i 0 } { $i < $n } { incr i } {
  $sel frame $i
  $sel update
  $sel writepdb $pdbname\_f$i.pdb
}

