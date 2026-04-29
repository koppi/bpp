--
-- Dominos demo
--
-- Physics simulation of domino chains being struck by a sphere.
-- Demonstrates collision, friction, and restitution settings.
--
-- Usage: bpp -f demo/basic/11-domino.lua

v.pre_sdl = [[

#include "textures.inc"

]]

plane = Plane(0,1,0,0,100)
plane.col = "#333333"
plane.friction = 2

v.timeStep      = 1/5
v.fixedTimeStep = v.timeStep / 4
v.maxSubSteps   = 10

if (use_lightsys == 1) then
  plane.sdl = [[ pigment { rgb ReferenceRGB(Gray20) } ]]
else
  plane.sdl = [[ pigment { rgb <0.2,0.2,0.2> } ]]
end

v:add(plane)

local spline = require("spline")
local trans = require("scad/trans")

local domino_height = 3
local y_pos = domino_height / 2

function spline_dominos(N, damp_lin, damp_ang, fri, res)
  local num_control = 200
  local control_points = {}

  for i = 1, num_control do
    local angle = (i - 1) * math.pi * 0.05
    local radius = 5 + (i - 1) * 0.1
    local cp = {
      x = math.cos(angle) * radius,
      y = y_pos,
      z = math.sin(angle) * radius,
    }
    control_points[i] = cp

    local marker = Sphere(0.1, 0)
    marker.pos = btVector3(cp.x, cp.y, cp.z)
    marker.col = "#ff0000"
    --v:add(marker)
  end

  local sp = spline.CatmullRom(control_points, 0.5)

  local s = Sphere(1, 10)
  local start = sp:eval(1)
  s.pos = btVector3(35, 2, -20)
  s.col = "#ff0000"
  s.vel = btVector3(-10, 0, 0)
  s.sdl = [[ texture { Polished_Chrome } ]]

  v:add(s)

  local d_end
  local spacing = 4

  for i = 1, N do
    local t = 1 + (i - 1) * 0.75
    local p = sp:eval(t)

    local p_next = sp:eval(t + 0.1)

    local d = Cube(0.4, domino_height, 1.5, .1)
    d.col = "#cccccc"

    d.friction = fri
    d.restitution = res

    d.damp_lin = damp_lin
    d.damp_ang = damp_ang

    local angle = math.atan2(p_next.z - p.z, p_next.x - p.x)
    local q = btQuaternion(0, 0.8, 0, angle)
    trans.rotate(d, q, btVector3(0, 0, 0))

    local pos = btVector3(p.x, p.y, p.z)
    trans.move(d, pos)

    v:add(d)

    if (i == math.floor(N / 2)) then
      d_end = d
    end
  end

  return s, d_end
end

n = 200

s,d = spline_dominos(n, 0.01,  0.01,  0.5, 0.01)

v.cam:setUpVector(btVector3(-0.0268739, 0.890931, -0.453343), true)
v.cam.up   = btVector3(-0.0268739, 0.890931, -0.453343)
v.cam.pos  = btVector3(0.845566, 20.5427, 40.3213)
v.cam.look = btVector3(-18681.3, -453855, -890829)

