/*
  Persistence of Vision Ray Tracer Scene Description File

  Studio Lighting Kit - common studio room for the demos

  Jaime Vives Piqueres, Jun-2006.

*/

// textures
#declare t_walls=
texture{
 pigment{White} 
 finish{diffuse 1}
}
#declare t_floor=
texture{
 pigment{
  checker 
  color Gray10 
  color White
 }
 finish{diffuse 1}
 scale 50 
}

// white room
box{-.5,.5
 scale <1000,300,1000>
 texture{t_walls}
 translate 150*y
 hollow
}
// checkered floor
box{-.5,.5
 scale <1000,.1,1000>
 texture{t_floor}
}


