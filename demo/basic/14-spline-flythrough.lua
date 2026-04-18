local spline = require "spline"

local floor = Plane(0, 1, 0, 0, 50)
floor.col = "#222222"
floor.friction = 0.8
floor.sdl = [[
  pigment {
    checker
    color rgb <0.2, 0.2, 0.2>
    color rgb <0.35, 0.35, 0.35>
    scale 2
  }
  finish {
    specular 0.1
    roughness 0.05
    reflection 0.1
  }
]]
v:add(floor)

local objects = {}
local colors = {
  "#e74c3c", "#3498db", "#2ecc71", "#f39c12",
  "#9b59b6", "#1abc9c", "#e67e22", "#ecf0f1",
  "#e91e63", "#00bcd4", "#8bc34a", "#ff5722",
}

local function random_color()
  return colors[math.random(#colors)]
end

for i = 1, 8 do
  local s = Sphere(1 + math.random() * 2, 1)
  local range = 20
  s.pos = btVector3(
    (math.random() - 0.5) * range * 2,
    3 + math.random() * 10,
    (math.random() - 0.5) * range * 2
  )
  s.col = random_color()
  s.friction = 0.6
  s.restitution = 0.5
  s.sdl = [[
  material {
    texture {
      pigment { color rgbf <1, 1, 1, 0.9> }
      finish {
        specular 1
        roughness 0.001
        reflection 0.3
        ambient 0
        diffuse 0.1
      }
    }
    interior {
      ior 1.5
      caustics 1
    }
  }
]]
  v:add(s)
  table.insert(objects, s)
end

for i = 1, 6 do
  local size = 1 + math.random() * 2.5
  local c = Cube(size, size, size, 1)
  local range = 18
  c.pos = btVector3(
    (math.random() - 0.5) * range * 2,
    3 + math.random() * 12,
    (math.random() - 0.5) * range * 2
  )
  c.col = random_color()
  c.friction = 0.5
  c.restitution = 0.3
  v:add(c)
  table.insert(objects, c)
end

for i = 1, 4 do
  local r = 0.5 + math.random() * 1.5
  local h = 2 + math.random() * 4
  local c = Cylinder(r, h, 1)
  local range = 16
  c.pos = btVector3(
    (math.random() - 0.5) * range * 2,
    3 + math.random() * 8,
    (math.random() - 0.5) * range * 2
  )
  c.col = random_color()
  c.friction = 0.5
  v:add(c)
  table.insert(objects, c)
end

v.cam.pos = btVector3(40, 25, 40)
v.cam.look = btVector3(0, 5, 0)
v.cam:setUpVector(btVector3(0, 1, 0), false)
v.cam:setHorizontalFieldOfView(0.4)

local cam_path_points = {
  btVector3(40, 25, 40),
  btVector3(25, 15, 35),
  btVector3(10, 12, 20),
  btVector3(0, 10, 5),
  btVector3(-15, 18, -10),
  btVector3(-25, 22, -25),
  btVector3(-10, 30, -35),
  btVector3(10, 35, -25),
  btVector3(25, 28, -10),
  btVector3(30, 20, 15),
  btVector3(15, 12, 25),
  btVector3(5, 8, 15),
  btVector3(-5, 14, 0),
  btVector3(10, 20, -15),
  btVector3(30, 25, -5),
  btVector3(40, 25, 40),
}

local cam_spline = spline.CatmullRom(cam_path_points)
local scene_center = btVector3(0, 5, 0)

local anim_duration = 1200
local anim_frame = 0
local animating = true

v:postSim(function(N)
  if not animating then return end

  local progress = anim_frame / anim_duration

  if progress > 1 then
    progress = 1
    animating = false
  end

  local t = progress * cam_spline.num_segments

  local p = cam_spline:eval(t)
  v.cam.pos = btVector3(p.x, p.y, p.z)
  v.cam.look = scene_center
  v.cam:setUpVector(btVector3(0, 1, 0), false)

  local fov = 0.4 + 0.2 * math.sin(progress * math.pi * 2)
  v.cam:setHorizontalFieldOfView(fov)

  anim_frame = anim_frame + 1
end)

v:preDraw(function(N)
  if not animating then return end

  for _, obj in ipairs(objects) do
    local p = obj.pos
    if p.y < -50 then
      obj.pos = btVector3(
        (math.random() - 0.5) * 30,
        10 + math.random() * 10,
        (math.random() - 0.5) * 30
      )
      obj.vel = btVector3(0, 0, 0)
    end
  end
end)

function restart()
  anim_frame = 0
  animating = true
end
