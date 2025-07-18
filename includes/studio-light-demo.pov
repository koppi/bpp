// ************************************************************
// Persistence Of Vision Ray Tracer Scene Description File
// File name  : studio-light-demo.pov
// Version    : POV-Ray 3.6 / MegaPOV 1.x
// Description: Demo showing usages of the Studio Lighting Kit.
// Date       : Jun-2006
// Author     : Jaime Vives Piqueres
// ************************************************************
// Rendering notes : aspect ratio 3/4 !!!

// *** standard includes ***
#include "colors.inc"

// *** control center ***
#declare demo_mode     =2;  // 1=direct, 2=HDRI
#declare use_blur    =7*0;  // blur samples (0=off)
#declare use_radiosity =2;  // 0=off, 1=load pass , 2=save pass
#declare rad_brightness=1;  // adjust to balance lighting/reflections

// *** global ***
global_settings{
 assumed_gamma 1.5 
 #if (use_radiosity)
 radiosity{
  // some layouts would benefit from 2 bounces, but most look OK with 1
  #if (use_radiosity=2)
  // save settigns
  pretrace_start .1 pretrace_end .01
//  count 500 nearest_count 20 error_bound .25 recursion_limit 1
  count 250 nearest_count 10 error_bound .5 recursion_limit 2
  normal off
  brightness rad_brightness
  save_file "studio-light-direct.rad"
  #else
  // load settings
  pretrace_start 1 pretrace_end 1
  always_sample off
//  error_bound .25 recursion_limit 1
  error_bound .5 recursion_limit 2
  brightness rad_brightness
  load_file "studio-light-direct.rad"
  #end
 }
 #end
}
#default{texture{finish{ambient 0}}}


// *************************
// *** direct usage demo ***
// *************************
// uses ligthsys and the studio lighting kit includes
#if (demo_mode=1) 

// Include CIE color transformation macros by Ive
// needed by the Studio Lighting Kit
#include "CIE.inc"
CIE_ColorSystemWhitepoint(sRGB_ColSys, Illuminant_D65)
#include "lightsys.inc" 
#include "lightsys_constants.inc" 
#declare Lightsys_Brightness=.015; // adjust for brighter/dimmer radiosity on the first pass, and for brighter/dimmer reflections on the second pass

// *** STUDIO LIGHTING KIT ***
#include "i_studio_room.inc"     // generic room
#include "i_studio_lighting.inc" // studio lights and accesories
// studio set up examples (1-6)
#declare predefined_studio_setup=1;  // select predefined setup
#include "i_studio_sets.inc"     

#end // direct demo usage


// ***********************
// *** HDRI usage demo ***
// ***********************
// uses .hdr generated with studio-light-to-hdr.pov
#if (demo_mode=2)

// needs megapov 1.x:
#version unofficial MegaPov 1.2;
sphere {
  0,1
  pigment { 
   image_map {
    hdr "studio-light-to-hdr" once interpolate 2 map_type 1
   } 
  }
  finish { ambient .5 diffuse 0} // adjust ambient for each .hdr
  scale <-1,1,1>*300 rotate -90*y
  hollow
}

#end // HDRI usage demo


// *******************************************
// *** common demo product on the backdrop ***
// *******************************************
#declare t_backdrop1=
texture{
 pigment{
  wrinkles
  color_map{
   [0 White]
   [1 SkyBlue]
  }
 }
 scale .25
}
#declare t_backdrop2=
texture{
 pigment{Gray10} 
 #if (use_radiosity<2)
 finish{reflection{.1,.33}}
 #end
}
//#declare t_backdrop=t_backdrop1
#include "i_studio_backdrop.inc" // curved studio backdrop
object{backdrop scale 60 translate 80*y}
#include "i_demo_subjects.inc"  // simple demo products
object{demo_products translate 80*y}


// **************
// *** camera ***
// **************
#declare cl=<1,45,-95>;
#declare cd=5*z; 
#declare la=<-4,17,0>;
camera{
 location cl
 up 3.2*y right 2.4*x
 direction cd
 look_at la
 #if (use_blur)
 focal_point la-12*z
 aperture pi*2
 blur_samples use_blur
 #end
 translate 80*y
}
