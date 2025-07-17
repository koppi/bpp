--
-- util/trans.lua library demo
--

local color = require "module/color"
local trans = require "module/scad/trans"

plane = Plane(0,1,0,0,1000)
plane.pos = btVector3(0,-100,0)
plane.col = color.gray
plane.sdl = [[
  texture {
    pigment { color rgb <0,0,0>*1.5 }
    finish {
      specular 0.0
      roughness 0.1
      //reflection 0.3
    }
  }
]]
v:add(plane)

v.gravity = btVector3(0,-9.81*20,0)

X = 40
Y = 40
r = 20

mt = {} -- create the matrix
for i=1,X do
  for j=1,Y do
  c = Sphere(0.25,0)
  --c = Cube(0.5,0.5,0.5,0)
  c.col= color.random_google()
  trans.rotate(c, btQuaternion(1,0,1,1), btVector3(i/X,0,0))
  trans.move  (c, btVector3(i-X/2,0,j-Y/2))

  if (math.sqrt((i-X/2)*(i-X/2)+(j-Y/2)*(j-Y/2)) < r) 
  then
    v:add(c)
  end
  mt[i*Y + j] = c
  end
end

function update(N)
  for i=1,X do
    for j=1,Y do
      tmp = mt[i*Y + j].pos
      p1 = math.sin(N/50)*20
      x = i-X/2
      y = j-Y/2
      p = math.sin(((x*x)+(y*y))/50+2+p1)*1.5
      p2 = math.log(math.sqrt((x*x)+(y*y))+2.5)*2
      tmp.y = p + 4 + p2
      mt[i*Y + j].pos = tmp
    end
  end
end

update(0)

v:preSim(function(N)

if (math.fmod(N, 5) == 0 and N < 1000) then
if (math.random() > 0.5) then
  s=Sphere(1,1)
else
  s=Cube(2,2,2,1)
end
  s.col = color.random_pastel()
  trans.move(s, btVector3(1,0,0))
  trans.move(s, btVector3(0,20,0))
  v:add(s)
end

update(N)

end)

function setcam()
v.cam:setUpVector(btVector3(-0.00402076, 0.964909, -0.262553), true)
v.cam.up   = btVector3(-0.00402076, 0.964909, -0.262553)
v.cam.pos  = btVector3(3.63213, 357.46, 1261.87)
v.cam.look = btVector3(-2807.88, -262207, -963648)

  v.cam.focal_blur     = 1
  v.cam.focal_aperture = 50
  v.cam.focal_point    = btVector3(1,10,0)
end

setcam()