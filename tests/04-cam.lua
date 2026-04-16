-- test camera properties: pos, look, up, focal_blur, focal_aperture, focal_point

local pass = 0
local fail = 0

local function assert_eq(name, got, expected, tol)
  tol = tol or 0.001
  if math.abs(got - expected) > tol then
    print("FAIL " .. name .. ": got=" .. tostring(got) .. " expected=" .. tostring(expected))
    fail = fail + 1
    return
  end
  print("PASS " .. name)
  pass = pass + 1
end

local function assert_vec3(name, vec, ex, ey, ez, tol)
  tol = tol or 0.001
  if math.abs(vec.x - ex) > tol or math.abs(vec.y - ey) > tol or math.abs(vec.z - ez) > tol then
    print("FAIL " .. name .. ": got=(" .. vec.x .. "," .. vec.y .. "," .. vec.z .. ") expected=(" .. ex .. "," .. ey .. "," .. ez .. ")")
    fail = fail + 1
    return
  end
  print("PASS " .. name)
  pass = pass + 1
end

local p = Plane(0,1,0,0,100)
v:add(p)

-- test cam.pos
v.cam.pos = btVector3(10, 20, 30)
assert_vec3("cam.pos", v.cam.pos, 10, 20, 30)

-- test cam.look
v.cam.look = btVector3(50, 0, 50)
assert_vec3("cam.look", v.cam.look, 50, 0, 50)

-- test cam.up (property via single-arg setUpVector)
v.cam.up = btVector3(0, 1, 0)
assert_vec3("cam.up", v.cam.up, 0, 1, 0)

-- test cam:setUpVector with noMove=true preserves position
v.cam.pos = btVector3(10, 20, 30)
v.cam:setUpVector(btVector3(0, 0, 1), true)
assert_vec3("cam.up after setUpVector(noMove=true)", v.cam.up, 0, 0, 1)
assert_vec3("cam.pos preserved after setUpVector(noMove=true)", v.cam.pos, 10, 20, 30, 0.1)

-- test cam.focal_aperture
v.cam.focal_aperture = 3.7
assert_eq("cam.focal_aperture", v.cam.focal_aperture, 3.7)

-- test cam.focal_point
v.cam.focal_point = btVector3(5, 10, 15)
assert_vec3("cam.focal_point", v.cam.focal_point, 5, 10, 15)

-- test cam.focal_blur
v.cam.focal_blur = 1
assert_eq("cam.focal_blur", v.cam.focal_blur, 1)
v.cam.focal_blur = 0
assert_eq("cam.focal_blur=0", v.cam.focal_blur, 0)

-- test tostring
print("tostring: " .. tostring(v.cam))

print(string.format("\n%d passed, %d failed", pass, fail))