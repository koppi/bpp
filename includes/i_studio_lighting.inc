/*
  Persistence of Vision Ray Tracer Scene Description File

  Studio Lighting Kit - Main include: macros for studio lighting equipment

  Jaime Vives Piqueres, Jun-2006.

*/

// create typical light colors from emissive spectrums with Lightsys
#declare Cl_Incandescent=EmissiveSpectrum(ES_Incandescent_60w);
#declare Cl_Fluorescent =EmissiveSpectrum(ES_Warm_White_Fluor);
#declare Cl_Halogen     =EmissiveSpectrum(ES_Halogen);
#declare Cl_Xenon       =EmissiveSpectrum(ES_Xenon_Flash);
#declare Cl_Daylight    =Daylight(6500);
#declare Cl_Sunlight    =Blackbody(5700);
#declare Cl_White       =ReferenceRGB(White);


//*** Softbox macro *** 
#macro softbox(sp_color,sp_lumens,sp_side1,sp_side2,sp_filter)

#local sp_f=sp_filter+<0,0,0>;
#if (sp_f.gray>0)
 #local p_color=pigment{rgb Light_Color_Filtered(sp_color,sp_lumens,sp_f)}
#else
 #local p_color=pigment{rgb Light_Color(sp_color,sp_lumens)} 
#end
#if (sp_lumens>0)
 #local t_sb_screen=
 texture{
  pigment{p_color}
  finish{
   diffuse 0
   ambient 1
  }
 }
#else
#local t_sb_screen=texture{pigment{White}}
#end
#local t_sb_white=texture{pigment{White}}
#local t_sb_gray=texture{pigment{Gray}}
#include "i_studio_softbox.inc"  // mesh modelled with Wings3d
object{softbox_shape 
 scale <sp_side1,sp_side2,(sp_side1+sp_side2)/2>
}

#end


// *** Umbrella macro ***
#macro umbrella(sp_color,sp_lumens,sp_side)

#if (sp_lumens>0)
#local t_umbrella_i=
texture{
 pigment{rgb Light_Color(sp_color,sp_lumens)} 
 finish{
   diffuse 0
   ambient 1
 }
}
#else
#local t_umbrella_i=texture{pigment{White}}
#end
#local t_umbrella_o=texture{pigment{Gray}}
#include "i_studio_umbrella.inc" // mesh modelled with Wings3d
object{umbrella_shape scale sp_side}

#end


