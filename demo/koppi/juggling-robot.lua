--
-- Claude Shannon's juggling robot
--

local color = require "module/color"

v.timeStep      = 1/25
v.maxSubSteps   = 10
v.fixedTimeStep = 1/200

y = 2.5 di = 5 d = 0.35 l = 2.35 p = 120

plane = Plane(0,1,0,0,10)
plane.col = color.darkgreen
plane.pos = btVector3(0,-2.5,0)
v:add(plane)

c = Cylinder(1.5,1,0)
c.col = color.darkgray
c.trans = btTransform(btQuaternion(1,0,0,1), btVector3(0,-2,0))
c.friction = 0.1
c.restitution = 0.85
v:add(c)

s = Sphere(d,4)
s.col = "red"
s.pos = btVector3(0,y+2.1+d,di-0.4)
s.vel = btVector3(0,0,0)
s.friction    = 0
s.restitution = 1
s.damp_lin = 0
s.damp_ang = 0
v:add(s)

h = 7.5

cy = Cylinder(0.15,2,0)
cy.col = color.darkgoldenrod
cy.trans = btTransform(btQuaternion(0,1,0,1), btVector3(-1.5,h/2+0.85,0))
v:add(cy)

cu = Cube(0.75,h,0.75,0)
cu.col = "gray"
cu.pos = btVector3(-2,h/2-2.5,0)
v:add(cu)

t = OpenSCAD([[
l = 1.6; d = 2.15;

module box () {
  dy = 0.15;
  rotate([45,45,0])
  difference() {
    cube([l, 1, 1], center = true);
    translate([dy,dy,-dy]) cube([1+dy*4, 1, 1], center = true);
  }
}

union() {
  translate([-0.7,0.1,0]) cube([l/8,0.5,d*4.75], center=true);
  translate([0,0,d*2]) rotate ([ 0,45,0])  box();
  translate([0,0,-d*2]) rotate ([ 0,-90-45,0]) box();
}

]],0)
t.col = "gray"
t.friction    = 1
t.restitution = 0
t.pos = btVector3(0,y+2,0)
v:add(t)

function tri(A,P,x)
  return (A/P) * (P - math.abs(x % (2*P) - P) )
end

function rot(N)
  tr = t.trans
  q = btQuaternion()
  q:setEuler(0,(tri(l,p,N+p/2)-l/2)*0.6,0)
  tr:setRotation(q)
  t.trans = tr
end

rot(0)

v:preSim(function(N)
  rot(N)
end)

v.cam:setUpVector(btVector3(-0.366909, 0.930252, -0.00286776), true)
v.cam.up   = btVector3(-0.366909, 0.930252, -0.00286776)
v.cam.pos  = btVector3(51481.7, 20304.7, -1010.78)
v.cam.look = btVector3(-878639, -346496, 17249.6)

v.cam.focal_blur      = 0
v.cam.focal_aperture  = 5
v.cam.focal_point = btVector3(0,0,0)