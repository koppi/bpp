Studio Lighting Kit
===================

  Jaime Vives Piqueres, Jun-2006.

  This is a tool to get quick studio-like lighting as seen on commercial 
product photography. At the moment it only has softboxes and umbrellas, but
it also includes a studio room, a backdrop, and a demo product for convenience. 

  The kit can be used to setup typical studio layouts around your object(s),
by including the supplied accesories on your own scenes. It can also be used
to generate HDRI maps from these layouts to be later used on your scene. 

  The direct use gives more precise control over lighting situations, but the 
HDR way is better when you try to simulate soft, wrap-around lighting. All the 
lighting is done without light sources, only with radiosity. 

  The kit is composed of several include files, tools and demo scenes:

  + i_studio_lighting.inc

    Lighting accesories. This is the main include file, with the macros used
    to create the predefined layouts.

  + i_studio_softbox.inc & i_studio_umbrella.inc

    Lighting equipment shapes. Internal includes used by the main macros. The
    softbox and umbrella shapes were modelled with Wings3D.

  + i_studio_backdrop.inc

    Curved studio backdrop, modelled with Wings3D.

  + i_studio_room.inc 

    Simple studio room for the demo scenes.

  + i_studio_sets.inc

    Examples of different lighting setups (layouts) using the main macros. 

  + i_demo_subjects.inc

    Some simple test subjects for the demo scenes.

  + studio-light-demo.pov

    Example of diferent usages of the lighting accesories.

    As provided, it renders a demo shot at the example products sitting on the
    backdrop inside the example room. It uses by default the direct method,
    with the first example layout. It uses a two-pass radiosity, so you need 
    to turn "use_radiosity" to 1 and render again for the final pass. 

  + studio-light-to-hdr.pov

    Tool to generate an HDR map from a given setup. You need to render it with 
    a 2:1 aspect ratio, and MegaPOV HDR output (i.e. +fh). Then render the demo
    scene studio-light-demo.pov with demo_mode=2 to see the lighting generated 
    by this probe. 

  As usual, please look at the code, play with it and report any problems, 
comments or sugestions! 

--
jaime@ignorancia.org

http://www.ignorancia.org


------------------------------------------------------------------------------
Note: this tool uses LightSys, so you may need to download it too: 
http://www.ignorancia.org/zips/lightsys4.zip
------------------------------------------------------------------------------

