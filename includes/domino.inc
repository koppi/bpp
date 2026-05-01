#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

/* The domino square (2 per domino) */
#declare domsquare = box { <-5, 1.25, -5>, <5, 2.25, 5> }


/* The single dit object (domino spot) */
#declare dit = difference {
   sphere { <0, 0, 0>, 2 inverse }
   object { Cylinder_Y inverse }
   plane { -y, 0 }
   plane { y, -2 }
   translate <0, 3.982051, 0>
   texture {
      pigment { color rgb<0.95, 0.95, 1.0> }
      finish { Phong_Glossy }
   }
}

/* The 9 different subsquares */
#declare sq1 = union {
   difference {
      object { domsquare }
      object { Cylinder_Y }
   }
   object { dit }
}

#declare sq2 = union {
   difference {
      object { domsquare }
      object { Cylinder_Y translate <3, 0, 3> }
      object { Cylinder_Y translate <-3, 0, -3> }
   }
   object { dit translate <3, 0, 3> }
   object { dit translate <-3, 0, -3> }
}

#declare sq3 = union {
   difference {
      object { sq1 }
      object { Cylinder_Y translate <3, 0, 3> }
      object { Cylinder_Y translate <-3, 0, -3> }
   }
   object { dit translate <3, 0, 3> }
   object { dit translate <-3, 0, -3> }
}

#declare sq4 = union {
   difference {
      object { sq2 }
      object { Cylinder_Y translate <3, 0, -3> }
      object { Cylinder_Y translate <-3, 0, 3> }
   }
   object { dit translate <3, 0, -3> }
   object { dit translate <-3, 0, 3> }
}

#declare sq5 = union {
   difference {
      object { sq4 }
      object { Cylinder_Y }
   }
   object { dit }
}

#declare sq6 = union {
   difference {
      object { sq4 }
      object { Cylinder_Y translate <3, 0, 0> }
      object { Cylinder_Y translate <-3, 0, 0> }
   }
   object { dit translate <3, 0, 0> }
   object { dit translate <-3, 0, 0> }
}

#declare sq7 = union {
   difference {
      object { sq6 }
      object { Cylinder_Y }
   }
   object { dit }
}

#declare sq8 = union {
   difference {
      object { sq6 }
      object { Cylinder_Y translate <0, 0, 3> }
      object { Cylinder_Y translate <0, 0, -3> }
   }
   object { dit translate <0, 0, 3> }
   object { dit translate <0, 0, -3> }
}

#declare sq9 = union {
   difference {
      object { sq8 }
      object { Cylinder_Y }
   }
   object { dit }
}

/* the designs which are cut out of the domino */
#declare design1 = union {
   intersection {
      plane { -z, 0 rotate <-45, 2, 0> translate <-5.4, 2.5, 0> }
      plane { z, 0 rotate <45, 2, 0> translate <5.4, 2.5, 0> }
      plane { -z, 0 rotate <-45, -2, 0> translate <5.4, 2.5, 0> }
      plane { z, 0 rotate <45, -2, 0> translate <-5.4, 2.5, 0> }
   }
   intersection {
      plane { -x, 0 rotate <0, 0, 45> rotate <0, 30, 0> translate <0, 2.5, 0.9> }
      plane { x, 0 rotate <0, 0, -45> rotate <0, 30, 0> translate <0, 2.5, -0.9> }
      plane { -x, 0 rotate <0, 0, 45> rotate <0, -30, 0> translate <0, 2.5, -0.9> }
      plane { x, 0 rotate <0, 0, -45> rotate <0, -30, 0> translate <0, 2.5, 0.9> }
   }
   sphere { <0, 0, 0>, 0.4 translate <5, 2.5, 0> }
   sphere { <0, 0, 0>, 0.4 translate <-5, 2.5, 0> }
}

#declare subdesign1 = intersection {
   intersection {
      plane { x, 0 rotate <0, 0, 45> }
      plane { -x, 0 rotate <0, 0, -45> }
      translate <1.5, 0.5, 0>
   }
   plane { z, 0 rotate <0, -45, 0> }
   plane { -z, 0 rotate <0, 45, 0> }
   rotate <0, 45, 0>
}

#declare subdesign2 = merge {
   object { subdesign1 }
   object { subdesign1 rotate <0, 90, 0> }
   object { subdesign1 rotate <0, 180, 0> }
   object { subdesign1 rotate <0, 270, 0> }
}

#declare subdesign3 = union {
   object { subdesign2 translate <0, 0, 6> }
   object { subdesign2 translate <0, 0, -6> }
   intersection {
      plane { x, 0 rotate <0, 0, 45> translate <0, 0.5, 0> }
      plane { -x, 0 rotate <0, 0, -45> translate <0, 0.5, 0> }
      plane { z, 3.87867966 }
      plane { -z, 3.87867966 }
   }
}

#declare subdesign4 = object { subdesign3 rotate <0, 90, 0> scale <0.5, 0.5, 0.5> }

#declare design2 = union { object { subdesign3 }
                           object { subdesign4 }
}

/* domino basic shape */
#declare domframe = difference {
   union {
      box { <-6, 0, -11>, <6, 2.5, 11> }
      box { <-5, 0, -12>, <5, 2.5, 12> }
      cylinder { <5, 0, 11>, <5, 2.5, 11>, 1}
      cylinder { <-5, 0, 11>, <-5, 2.5, 11>, 1}
      cylinder { <5, 0, -11>, <5, 2.5, -11>, 1}
      cylinder { <-5, 0, -11>, <-5, 2.5, -11>, 1}
   }
   box { <-5, 1.5, 1>, <5, 3, 11> }
   box { <-5, 1.5, -11>, <5, 3, -1> }
   object { design1 }
   object { design2 }
}


/* now make each of the 45 dominos. */
#declare domino1 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq1 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7, 0> scale <15, 15, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino2 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq2 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.2, 0> scale <17, 17, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino3 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq3 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 0> scale <13, 13, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino4 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq4 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.1, 0> scale <17, 17, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino5 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq5 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.4, 0> scale <15, 15, 7> rotate <0, 0, 180>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino6 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.1, 0> scale <17, 17, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino7 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.6, 0> scale <15, 15, 7> rotate <0, 0, 270>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino8 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7, 0> scale <13, 13, 7> rotate <0, 0, 315>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino9 = union {
   object { domframe }
   object { sq1 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 24> scale <17, 17, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino10 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq2 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -8, 24> scale <17, 17, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino11 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq3 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6, 24> scale <13, 13, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino12 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq4 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.3, 24> scale <15, 15, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino13 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq5 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.6, 24> scale <13, 13, 7> rotate <0, 0, 180>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino14 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 24> scale <17, 17, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino15 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.9, 24> scale <15, 15, 7> rotate <0, 0, 270>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino16 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.1, 24> scale <13, 13, 7> rotate <0, 0, 315>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino17 = union {
   object { domframe }
   object { sq2 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.3, 48> scale <15, 15, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino18 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq3 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.9, 48> scale <13, 13, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino19 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq4 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.9, 48> scale <17, 17, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino20 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq5 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.1, 48> scale <17, 17, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino21 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.1, 48> scale <13, 13, 7> rotate <0, 0, 180>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino22 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7, 48> scale <17, 17, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino23 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.8, 48> scale <15, 15, 7> rotate <0, 0, 270>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino24 = union {
   object { domframe }
   object { sq3 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.2, 48> scale <17, 17, 7> rotate <0, 0, 315>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino25 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq4 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6, 72> scale <13, 13, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino26 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq5 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.7, 72> scale <13, 13, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino27 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 72> scale <17, 17, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino28 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.9, 72> scale <15, 15, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino29 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6, 72> scale <15, 15, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino30 = union {
   object { domframe }
   object { sq4 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.3, 72> scale <17, 17, 7> rotate <0, 0, 270>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino31 = union {
   object { domframe }
   object { sq5 translate <0, 0, 6> }
   object { sq5 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 72> scale <13, 13, 7> rotate <0, 0, 315>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino32 = union {
   object { domframe }
   object { sq5 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.2, 96> scale <13, 13, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino33 = union {
   object { domframe }
   object { sq5 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.9, 96> scale <17, 17, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino34 = union {
   object { domframe }
   object { sq5 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.5, 96> scale <17, 17, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino35 = union {
   object { domframe }
   object { sq5 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.9, 96> scale <13, 13, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino36 = union {
   object { domframe }
   object { sq6 translate <0, 0, 6> }
   object { sq6 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.6, 96> scale <15, 15, 7> rotate <0, 0, 180>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino37 = union {
   object { domframe }
   object { sq6 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.06, 96> scale <15, 15, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino38 = union {
   object { domframe }
   object { sq6 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.1, 96> scale <13, 13, 7> rotate <0, 0, 270>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino39 = union {
   object { domframe }
   object { sq6 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.7, 96> scale <17, 17, 7> rotate <0, 0, 315>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino40 = union {
   object { domframe }
   object { sq7 translate <0, 0, 6> }
   object { sq7 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.5, 120> scale <15, 15, 7> rotate <0, 0, 0>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino41 = union {
   object { domframe }
   object { sq7 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.4, 120> scale <13, 13, 7> rotate <0, 0, 45>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino42 = union {
   object { domframe }
   object { sq7 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.3, 120> scale <15, 15, 7> rotate <0, 0, 90>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino43 = union {
   object { domframe }
   object { sq8 translate <0, 0, 6> }
   object { sq8 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.2, 120> scale <17, 17, 7> rotate <0, 0, 135>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino44 = union {
   object { domframe }
   object { sq8 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -6.9, 120> scale <13, 13, 7> rotate <0, 0, 180>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}

#declare domino45 = union {
   object { domframe }
   object { sq9 translate <0, 0, 6> }
   object { sq9 translate <0, 0, -6> }
   pigment { DMFWood3 translate <0, -7.1, 120> scale <15, 15, 7> rotate <0, 0, 225>
      turbulence 0.1 }
   finish { Dull }
   bounded_by { box{ <-6, 0, -12>, <6, 2.5, 12> } }
}
