--
-- Random pyramids demo
--
-- Creates tetrahedra and square-based pyramids composed from
-- Triangle faces, plus dynamic cubes for physics interaction.
--

local color = require "module/color"

v.gravity = btVector3(0, -9.81, 0)
v.timeStep      = 1/50
v.maxSubSteps   = 7
v.fixedTimeStep = 1/120

-- ground plane
p = Plane(0, 1, 0, 0, 50)
p.col = "#333333"
v:add(p)

-- helper: add a triangle face (static, mass = 0)
function add_triangle(a, b, c, col)
  local t = Triangle(a, b, c, 0)
  t.col = col or color.random_google()
  v:add(t)
  return t
end

-- helper: build a tetrahedron (3-sided pyramid) from Triangle faces
function tetrahedron(cx, cy, cz, size, col)
  local s = size * 0.5
  local h = size
  local base0 = btVector3(cx - s, cy, cz - s)
  local base1 = btVector3(cx + s, cy, cz - s)
  local base2 = btVector3(cx,     cy, cz + s)
  local apex  = btVector3(cx,     cy + h, cz)

  local c = col or color.random_google()
  add_triangle(base0, base1, base2, c)
  add_triangle(base0, base1, apex,  c)
  add_triangle(base1, base2, apex,  c)
  add_triangle(base2, base0, apex,  c)
end

-- helper: build a square-based pyramid from Triangle faces
function pyramid(cx, cy, cz, base, height, col)
  local s = base * 0.5
  local h = height
  local b0 = btVector3(cx - s, cy, cz - s)
  local b1 = btVector3(cx + s, cy, cz - s)
  local b2 = btVector3(cx + s, cy, cz + s)
  local b3 = btVector3(cx - s, cy, cz + s)
  local apex = btVector3(cx, cy + h, cz)

  local c = col or color.random_google()
  -- base
  add_triangle(b0, b1, b2, c)
  add_triangle(b0, b2, b3, c)
  -- sides
  add_triangle(b0, b1, apex, c)
  add_triangle(b1, b2, apex, c)
  add_triangle(b2, b3, apex, c)
  add_triangle(b3, b0, apex, c)
end

-- seed
math.randomseed(os.time())

-- random tetrahedra sitting on the ground
for i = 1, 5 do
  local x  = math.random(-5, 5)
  local z  = math.random(-5, 5)
  local sz = 0.5 + math.random() * 1.2
  tetrahedron(x, 0.0, z, sz, color.random_google())
end

-- random square-based pyramids sitting on the ground
for i = 1, 5 do
  local x  = math.random(-5, 5)
  local z  = math.random(-5, 5)
  local b  = 0.5 + math.random() * 1.2
  local h  = 0.8 + math.random() * 1.5
  pyramid(x, 0.0, z, b, h, color.random_chrome())
end

-- dynamic cubes to knock into the pyramids
for i = 1, 8 do
  local x = math.random(-4, 4)
  local y = 2 + math.random() * 5
  local z = math.random(-4, 4)
  local s = 0.3 + math.random() * 0.4
  local c = Cube(s, s, s, 1)
  c.pos = btVector3(x, y, z)
  c.col = color.random_google()
  v:add(c)
end

-- some spheres too
for i = 1, 4 do
  local r = 0.2 + math.random() * 0.3
  local s = Sphere(r, 1)
  s.pos = btVector3(math.random(-3, 3), 3 + math.random() * 4, math.random(-3, 3))
  s.col = color.random_bpp()
  v:add(s)
end

-- EOF