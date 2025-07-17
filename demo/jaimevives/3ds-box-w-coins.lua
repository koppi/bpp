--
-- Stack of Coins demo
--
-- preSim used to insert coins on-the-fly
--

local color = require "module/color"

v.timeStep      = 1/5
v.maxSubSteps   = 100
v.fixedTimeStep = 1/50

v.cam:setUpVector(btVector3(-0.0059111, 0.733655, -0.679497), true)
v.cam.up   = btVector3(-0.0059111, 0.733655, -0.679497)
v.cam.pos  = btVector3(223.256, 3697.59, 3962.94)
v.cam.look = btVector3(-41161.4, -675408, -728910)

local plane = Plane(0,1,0,0,100)
plane.col = color.gray
v:add(plane)

local b = Mesh("demo/mesh/box.3ds",0)
b.pos = btVector3(0,20.15,0)
b.col = color.darkblue
v:add(b)

v:preSim(function(N)
  if (N%5==0 and N < 500) then
    local c = Cylinder(7,1.1,1)
    q = btQuaternion(1,0,0,1)
    o = btVector3(math.random(-2,2),150,math.random(-2,2))
    c.trans=btTransform(q,o)  
    c.col = color.goldenrod
    c.friction=.5
    c.resitution=.1
    v:add(c)
  end
end)
