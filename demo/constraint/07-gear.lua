--
-- btGearConstraint demo
-- Two gears coupled by btGearConstraint, gearA driven by motor
--

plane = Plane(0,1,0,0,10)
plane.col = "#222222"
v:add(plane)

theta = math.pi / 8

l1 = 2 - math.tan(theta)
l2 = 1 / math.cos(theta)
ratio = l2 / l1

gearA = Cylinder(1, 0.25, 1)
gearA.pos = btVector3(-1, 1, 0)
gearA.col = "#ff0000"
v:add(gearA)

gearB = Cylinder(0.5, 0.26, 1)
gearB.pos = btVector3(0.5, 1, 0)
q = btQuaternion()
q:setEulerZYX(0, 0, -theta)
gearB.rot = q
gearB.col = "#006600"
v:add(gearB)

gearA.body:setLinearFactor(btVector3(0, 0, 0))
gearA.body:setAngularFactor(btVector3(0, 0, 1))

hinge = btHingeConstraint(
  gearA.body,
  btVector3(0, 0, 0),
  btVector3(0, 0, 1))
hinge:enableAngularMotor(true, 2, 10)
v:addConstraint(hinge)

con = btGearConstraint(
  gearA.body, gearB.body,
  btVector3(0, 0, 1), btVector3(0, 0, 1),
  ratio)

v:addConstraint(con)

hingeB = btHingeConstraint(
  gearB.body,
  btVector3(0, 0, 0),
  btVector3(0, 0, 1))
v:addConstraint(hingeB)

v.cam:setUpVector(btVector3(0,1,0), true)
v.cam.pos = btVector3(0, 2, 3)
v.cam.look = btVector3(0, 1, 0)

-- EOF