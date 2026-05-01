--
-- Dominos demo
--
-- Physics simulation of domino chains being struck by a sphere.
-- Demonstrates collision, friction, and restitution settings.

local scene = 0  -- 0: archimedean (arc-len), 1: random, 2: fixed table, 3: fermat, 4: log spiral

v.pre_sdl = [[ #include "textures.inc" ]]

plane = Plane(0,1,0,0,100)
plane.col = "#333333"
plane.friction = 2
plane.sdl = [[ pigment { rgb <0.2,0.2,0.2> } ]]
v:add(plane)

v.timeStep      = 1/5
v.fixedTimeStep = v.timeStep / 4
v.maxSubSteps   = 10

local spline = require("spline")
local trans = require("scad/trans")

local domino_height = 3

local y_pos = domino_height / 2

local function arc_length(b, theta)
  local sqrt_term = math.sqrt(1 + theta*theta)
  return b/2 * (theta * sqrt_term + math.log(theta + sqrt_term))
end

local function solve_theta_for_arc(b, target_s, theta_max)
  local lo, hi = 0, theta_max or 50
  for _ = 1, 50 do
    local mid = (lo + hi) / 2
    if arc_length(b, mid) < target_s then
      lo = mid
    else
      hi = mid
    end
  end
  return (lo + hi) / 2
end

local fixed_control_points = {
  {x =  0, y = y_pos, z =  0},
  {x =  10, y = y_pos, z =  0},
  {x =  10, y = y_pos, z =  10},
  {x =  0, y = y_pos, z =  10},
  {x =  0, y = y_pos, z =  0},
}

function spline_dominos(damp_lin, damp_ang, fri, res)
  local control_points = {}

  if scene == 2 then
    control_points = fixed_control_points
  else
    local num_control = 200
    local angled = 0
    for i = 1, num_control do
      local cp
      if scene == 0 then
        local a, b = 0, 0.65
        local total_arc = arc_length(b, 30)
        local s = (i - 1) / num_control * total_arc
        local theta = solve_theta_for_arc(b, s, 30)
        local radius = a + b * theta
        cp = {
          x = math.cos(theta) * radius,
          y = y_pos,
          z = math.sin(theta) * radius,
        }
      elseif scene == 3 then
        local angle = (i - 1) * 0.09
        local radius = 6 + math.sqrt(angle) * 4.2
        cp = {
          x = math.cos(angle) * radius,
          y = y_pos,
          z = math.sin(angle) * radius,
        }
      elseif scene == 4 then
        local angle = (i - 1) * 0.09
        local radius = 5 * math.exp(angle * 0.15)
        cp = {
          x = math.cos(angle) * radius,
          y = y_pos,
          z = math.sin(angle) * radius,
        }
      else
        cp = {
          x = math.random(-20, 20),
          y = y_pos,
          z = math.random(-20, 20),
        }
      end
      control_points[i] = cp
    end
  end

  for i, cp in ipairs(control_points) do
    local marker = Sphere(0.1, 0)
    marker.pos = btVector3(cp.x, cp.y, cp.z)
    marker.col = "#ff0000"
    --v:add(marker)
  end

  local sp = spline.CatmullRom(control_points, 0.5)

  local s = Sphere(1, 5)
  local start = sp:eval(1)
  s.pos = btVector3(25, 1, -20)
  s.col = "#ff0000"
  s.vel = btVector3(-2.5, 0, 0)
  s.sdl = [[ texture { Polished_Chrome } ]]
  v:add(s)

  local spacing = 4

  local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

  local N = tablelength(control_points)

  for i = 1, N do
    local t = 1 + (i - 1)
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
  end
end

spline_dominos(0.01,  0.01,  0.5, 0.01)

v.cam:setUpVector(btVector3(-0.0268739, 0.890931, -0.453343), true)
v.cam.up   = btVector3(-0.0268739, 0.890931, -0.453343)
v.cam.pos  = btVector3(0.845566, 20.5427, 40.3213)
v.cam.look = btVector3(-18681.3, -453855, -890829)

