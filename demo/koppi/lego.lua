--
-- Lego Brick Parametric OpenScad
-- by stalkerface, published Nov 26, 2013
--
-- based on Lego_Tech.scad in the downloaded zip file
--
-- http://www.thingiverse.com/thing:191146
--

local lego  = require "module/scad/lego"
local trans = require "module/scad/trans"

local l00 = lego.new({ fun  = "KLOTZ(3, 4, 1, Tile=false, Technic=false);", mass = 0 })

trans.move(l00, btVector3(0,0,0))
trans.rotate(l00, btQuaternion(1,0,1,1), btVector3(3.1416,0,0))

v:add(l00)

v.cam:setFieldOfView(0.25)
v.cam:setUpVector(btVector3(0,1,0), true)
v.cam:setHorizontalFieldOfView(0.003)
v.cam.pos  = btVector3(20000,10000,35000)
v.cam.look = btVector3(0,0,0) 

v.cam.focal_blur      = 0
v.cam.focal_aperture  = 5
v.cam.focal_point = btVector3(0,0,0)
