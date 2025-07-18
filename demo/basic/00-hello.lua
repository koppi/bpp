--
-- Demo of basic BPP objects and functions
--

local color = require "module/color"
local gs    = require "module/scad/geodesic_sphere"

v.timeStep      = 1/25 -- 25 frames per second
v.maxSubSteps   = 120
v.fixedTimeStep = 1/60

--
-- SCENE SETUP
--

p = Plane(0,1,0,0,5)
p.pos = btVector3(0,0,0)
p.col = color.gray
v:add(p)

cu = Cube(1,1,1,1)
cu.col = color.red
cu.pos = btVector3(-2, 0.5, 0);
v:add(cu)

cy = Cylinder(0.5,1,1)
cy.col = color.green
cy.pos = btVector3(-1, 0.5, 0)
v:add(cy)

sp = Sphere(.5,1)
sp.col = color.purple
sp.pos = btVector3(1, 0.5, 0)
v:add(sp)

s1 = gs.new({ fun  = "geodesic_sphere(r = 0.5, $fn=6);", mass = 1})
s1.col = color.blue
s1.pos = btVector3(2,0.5,0)
v:add(s1)

v:preStart(function(N)
  print("preStart("..tostring(N)..")")
  
  -- pseudo orthogonal view
  v.cam:setFieldOfView(.02)

  v.cam:setUpVector(btVector3(-0.0076577, 0.99053, -0.137086), true)
  v.cam.up   = btVector3(-0.0076577, 0.99053, -0.137086)
  v.cam.pos  = btVector3(-0.0991845, 25.7874, 174.496)
  v.cam.look = btVector3(162.003, -137063, -990384)
end)

v:preStop(function(N)
  print("preStop("..tostring(N)..")")
end)

v:preSim(function(N)
  print("preSim("..tostring(N)..")")
end)

v:postSim(function(N)
  print("postSim("..tostring(N)..")")
  v.cam.focal_blur      = 0
  v.cam.focal_aperture  = 5
  -- set blur point to sphere shape position
  v.cam.focal_point = sp.pos
end)

v:preDraw(function(N)
--  print("preDraw("..tostring(N)..")")
end)

v:postDraw(function(N)
--  print("postDraw("..tostring(N)..")")
end)

v:onCommand(function(N, cmd)
  print("onCommand("..tostring(N).."): '"..cmd)
  local f = assert(loadstring(cmd))
  f(v)
end)

-- EOF
