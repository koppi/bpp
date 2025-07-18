/*
  Persistence of Vision Ray Tracer Scene Description File

  Studio Lighting Kit - Example product for the demos

  Jaime Vives Piqueres, Jan-2006.

*/

// POVODOR aerosol
#declare povodor=
union{
 union{
  cylinder{<0,.05,0>,<0,0.975,0>,.25}
  torus{.225,.025 translate .05*y}
  torus{.225,.025 translate .975*y}
  texture{
   pigment{
    image_map{jpeg "im_povodor.jpg" map_type 2}
    scale .975
    translate .025*y
   }
   #if (use_radiosity<2)
   finish{reflection{.1,.2}}   
   #end
  }
 }
 union{
  cylinder{<0,0,0>,<0,.025,0>,.25}
  torus{.2475,.0025 translate .025*y}
  texture{
   pigment{Gold}
   #if (use_radiosity<2)
   finish{reflection{.3,.6}}
   #end
  }
  scale .99
  translate .0025*y
 }
 union{
  cylinder{<0,1,0>,<0,1.25,0>,.25}
  torus{.225,.025 translate 1.25*y} 
  cylinder{<0,1,0>,<0,1.275,0>,.225}
  texture{
   pigment{
    OrangeRed*.75
   }
   #if (use_radiosity<2)
   finish{reflection{.1,.2}}   
   #end
  }
  scale .995
 }
 scale <19,29,19>
}

// two aerosols and a test sphere
#declare demo_products=
union{
object{povodor 
 rotate 90*y
 translate <-5,.17,10>
}
object{povodor
 rotate -140*y
 translate <4.5,.05,-10>
}
sphere{0,8
 texture{
  pigment{DarkGreen}
  #if (use_radiosity<2)
  normal{crackle poly_wave .05 turbulence .1 scale 4}
  finish{reflection{.1,.3}}
  #end
 }
 translate <-9,8,-12>
}
}


