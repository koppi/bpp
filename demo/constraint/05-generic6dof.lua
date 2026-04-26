--
-- btGeneric6DofConstraint demo
-- Based on bullet3 ConstraintDemo.cpp Generic6Dof constraint example
--

plane = Plane(0,1,0,0,10)
plane.col = "#222222"
v:add(plane)

cube = Cube(1,1,1,0)
cube.pos = btVector3(0, 6, 0)
cube.col = "#444444"
v:add(cube)

link = Cube(1,1,1,1)
link.pos = btVector3(0, 0, 0)
link.col = "#ff6600"
v:add(link)

frameInA = btTransform()
frameInA:setIdentity()
frameInA:setOrigin(btVector3(0, 0, 0))

frameInB = btTransform()
frameInB:setIdentity()
frameInB:setOrigin(btVector3(0, -1, 0))

con = btGeneric6DofConstraint(
  cube.body, link.body,
  frameInA, frameInB,
  true)

con:setLinearLowerLimit(btVector3(-1, -2, -1))
con:setLinearUpperLimit(btVector3(1, 2, 1))

con:setAngularLowerLimit(btVector3(-math.pi * 0.5, -0.75, -math.pi * 0.8))
con:setAngularUpperLimit(btVector3(math.pi * 0.5, 0.75, math.pi * 0.8))

v:addConstraint(con)

v.cam:setUpVector(btVector3(0.00872655, 0.92641, -0.376416), true)
v.cam.up   = btVector3(0.00872655, 0.92641, -0.376416)
v.cam.pos  = btVector3(0.0257065, 8.99374, 11.1444)
v.cam.look = btVector3(22.0324, -376421, -926434)

-- EOF