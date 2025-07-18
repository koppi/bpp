/*
  Persistence of Vision Ray Tracer Scene Description File

  Studio Lighting Kit - predefined studio setups using the SLK macros

  Jaime Vives Piqueres, Jan-2006.

*/

// default studio setup if not set:
#ifndef(predefined_studio_setup) 
 #local predefined_studio_setup=1;
#end

// select apropiate setup
#switch (predefined_studio_setup)

// studio setup #1 : 
#case (1)
object{softbox(Cl_Xenon,1200,100,100,0)
 translate <0,150,-150>
 rotate 60*y
}
object{umbrella(Cl_Xenon,1000,60)
 translate <0,190,0>
}
#break

// studio setup #2 :
#case (2)
object{softbox(Cl_Daylight,500,150,150,0)
 rotate 45*x
 translate <0,110,-90>
 rotate -75*y
}
object{softbox(Cl_Xenon,800,50,50,<0,1,1>)
 rotate 15*x
 translate <0,110,-130>
 rotate 145*y
}
object{umbrella(Cl_Xenon,800,80)
 translate <0,180,-120>
 rotate 45*y
}
#break

// studio setup #3 :
#case (3)
object{softbox(Cl_Xenon,300,200,200,0)
 rotate 90*x
 translate <0,140,0>
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,100,-100>
 rotate 90*y
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,100,-100>
 rotate -90*y
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,100,-100>
 rotate 0*y
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,100,-100>
 rotate 180*y
}
#break

// studio setup #4 :
#case (4)
object{umbrella(Cl_Halogen,1000,60)
 rotate -40*x
 translate <0,170,-110>
 rotate 60*y
}
object{softbox(Cl_Daylight,800,100,100,0)
 translate <0,150,-100>
 rotate -70*y
}
object{softbox(Cl_Daylight,800,60,60,0)
 rotate 45*x
 translate <0,190,0>
}
#break

// studio setup #5 :
#case (5)
object{softbox(Cl_Xenon,0,200,200,0)
 rotate 90*x
 translate <0,250,0>
}
object{softbox(Cl_Xenon,400,200,200,0)
 translate <0,150,-100>
 rotate 90*y
}
object{softbox(Cl_Xenon,400,200,200,0)
 translate <0,150,-100>
 rotate -90*y
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,150,-100>
 rotate 0*y
}
object{softbox(Cl_Xenon,0,200,200,0)
 translate <0,150,-100>
 rotate 180*y
}
#break

// studio setup #6 :
#case (6)
object{umbrella(Cl_Xenon,1200,60)
 rotate -60*x
 translate <0,190,-100>
 rotate -30*y
}
object{softbox(Cl_Xenon,800,100,100,<0,.5,1>)
 translate <0,150,-100>
 rotate 80*y
}
object{softbox(Cl_Xenon,1600,60,60,<1,0,0>)
 translate <0,190,-100>
 rotate -100*y
}
#break

#end // switch
