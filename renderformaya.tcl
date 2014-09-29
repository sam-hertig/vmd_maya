# a simple VMD script to render .obj files of a trajectory that can be imported easily into maya

# usage:
# 1) load your trajectory in vmd, prepare the representations as desired
#    turn off axes, and use sscache.tcl to calculate 2ndary structure correctly in every frame
# 2) type in tk console:
#    source renderformaya.tcl
#    renderformaya top DIR
# where DIR is your desired output directory
# 3) import the generated *.obj files directly into maya

proc renderformaya { whichmol workdir } {
  set numframes [molinfo $whichmol get numframes]
  for {set i 0} {$i < $numframes} {incr i} {
    # set filenameA [format "%s/frame%04d.obj" $workdir $i]
    # set filenameB [format "%s/frame%04d.mtl" $workdir $i]
    set filenameA [format "%s/frame%d.obj" $workdir $i]
    set filenameB [format "%s/frame%d.mtl" $workdir $i]
    molinfo $whichmol set frame $i
    render Wavefront $filenameA
    #delete *.mtl files:
    file delete $filenameB 
  }
}


