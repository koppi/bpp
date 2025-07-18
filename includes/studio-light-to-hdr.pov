// ************************************************************
// Persistence Of Vision Ray Tracer Scene Description File
// File name  : studio-light-to-hdr.pov
// Version    : MegaPOV 1.x
// Description: Tool to generate HDRI probes from SLK setups.
// Date       : Jun-2006
// Author     : Jaime Vives Piqueres
// Note       : Use +fh for HDRI output!
// ************************************************************
#include "colors.inc"


// *** control center ***
#declare use_blur    =7*0;  // blur samples (0=off)
#declare use_radiosity =0;  // 0=off, 1=load pass , 2=save pass
#declare rad_brightness=1;  
global_settings{
 #if (use_radiosity)
 radiosity{
  #if (use_radiosity=2)
  // save settigns
  pretrace_start .1 pretrace_end .01
  count 1500 nearest_count 20 error_bound 1
  recursion_limit 1
  normal off
  brightness rad_brightness
  save_file "studio-light-to-hdr.rad"
  #else
  // load settings
  pretrace_start 1 pretrace_end 1
  always_sample off
  error_bound 1
  recursion_limit 1
  brightness rad_brightness
  load_file "studio-light-to-hdr.rad"
  #end
 }
 #end
}
#default{texture{finish{ambient 0}}}


// Include CIE color transformation macros by Ive
// needed by the Studio Lighting Kit
#include "CIE.inc"
CIE_ColorSystemWhitepoint(sRGB_ColSys, Illuminant_D65)
#include "lightsys.inc" 
#include "lightsys_constants.inc" 
#declare Lightsys_Brightness=.02; // adjust for a brighter/dimmer hdr


// *** STUDIO LIGHTING KIT ***
#include "i_studio_room.inc"     // generic room
#include "i_studio_lighting.inc" // studio lights and accesories
#declare predefined_studio_setup=1; 
#include "i_studio_sets.inc"     // studio set up example (1-5)


// **************
// *** camera ***
// **************
// spherical camera used to generate HDR maps
camera{
 spherical
 up y right 2*x
 location <0,0,-1>
 look_at <0,0,0>
 #if (use_blur)
 focal_point 0
 aperture .1
 blur_samples use_blur
 #end
 translate 80*y
}
