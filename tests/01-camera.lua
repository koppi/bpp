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

-- test invalid data handling (functions should not crash with invalid args)
-- luabind errors are acceptable - they don't crash the interpreter
local function test_no_crash(name, fn, line)
  local ok, err = pcall(fn)
  if ok then
    print("PASS " .. name .. " (no crash)")
    pass = pass + 1
  elseif err and string.find(tostring(err), "No matching overload") then
    --print("LUABIND line " .. line .. " exception: " .. tostring(err))
    pass = pass + 1
  else
    print("FAIL " .. name .. " line " .. line .. ": " .. tostring(err))
    fail = fail + 1
  end
end

-- test properties with invalid data
test_no_crash("cam.pos = nil", function() v.cam.pos = nil end, 80)
test_no_crash("cam.pos = 'string'", function() v.cam.pos = "string" end, 81)
test_no_crash("cam.pos = 123", function() v.cam.pos = 123 end, 82)
test_no_crash("cam.pos = {}", function() v.cam.pos = {} end, 83)
test_no_crash("cam.look = nil", function() v.cam.look = nil end, 85)
test_no_crash("cam.look = 'string'", function() v.cam.look = "string" end, 86)
test_no_crash("cam.look = 123", function() v.cam.look = 123 end, 87)
test_no_crash("cam.look = {}", function() v.cam.look = {} end, 88)
test_no_crash("cam.up = nil", function() v.cam.up = nil end, 90)
test_no_crash("cam.up = 'string'", function() v.cam.up = "string" end, 91)
test_no_crash("cam.up = 123", function() v.cam.up = 123 end, 92)
test_no_crash("cam.up = {}", function() v.cam.up = {} end, 93)
test_no_crash("cam.focal_blur = nil", function() v.cam.focal_blur = nil end, 95)
test_no_crash("cam.focal_blur = 'string'", function() v.cam.focal_blur = "string" end, 96)
test_no_crash("cam.focal_blur = {}", function() v.cam.focal_blur = {} end, 97)
test_no_crash("cam.focal_point = nil", function() v.cam.focal_point = nil end, 99)
test_no_crash("cam.focal_point = 'string'", function() v.cam.focal_point = "string" end, 100)
test_no_crash("cam.focal_point = 123", function() v.cam.focal_point = 123 end, 101)
test_no_crash("cam.focal_point = {}", function() v.cam.focal_point = {} end, 102)
test_no_crash("cam.focal_aperture = nil", function() v.cam.focal_aperture = nil end, 104)
test_no_crash("cam.focal_aperture = 'string'", function() v.cam.focal_aperture = "string" end, 105)
test_no_crash("cam.focal_aperture = {}", function() v.cam.focal_aperture = {} end, 106)
test_no_crash("cam.pre_sdl = nil", function() v.cam.pre_sdl = nil end, 108)
test_no_crash("cam.pre_sdl = 123", function() v.cam.pre_sdl = 123 end, 109)
test_no_crash("cam.pre_sdl = {}", function() v.cam.pre_sdl = {} end, 110)
test_no_crash("cam.post_sdl = nil", function() v.cam.post_sdl = nil end, 112)
test_no_crash("cam.post_sdl = 123", function() v.cam.post_sdl = 123 end, 113)
test_no_crash("cam.post_sdl = {}", function() v.cam.post_sdl = {} end, 114)

-- test functions with invalid data
test_no_crash("cam:setUpVector(nil)", function() v.cam:setUpVector(nil) end, 117)
test_no_crash("cam:setUpVector('string')", function() v.cam:setUpVector("string") end, 118)
test_no_crash("cam:setUpVector(123)", function() v.cam:setUpVector(123) end, 119)
test_no_crash("cam:setUpVector({})", function() v.cam:setUpVector({}) end, 120)
test_no_crash("cam:setUpVector(btVector3(0,1,0), nil)", function() v.cam:setUpVector(btVector3(0,1,0), nil) end, 121)
test_no_crash("cam:setUpVector(btVector3(0,1,0), 'string')", function() v.cam:setUpVector(btVector3(0,1,0), "string") end, 122)
test_no_crash("cam:setUpVector(btVector3(0,1,0), 123)", function() v.cam:setUpVector(btVector3(0,1,0), 123) end, 123)
test_no_crash("cam:getUpVector() with bad args", function() v.cam:getUpVector("extra") end, 125)
test_no_crash("cam:setFieldOfView(nil)", function() v.cam:setFieldOfView(nil) end, 127)
test_no_crash("cam:setFieldOfView('string')", function() v.cam:setFieldOfView("string") end, 128)
test_no_crash("cam:setFieldOfView({})", function() v.cam:setFieldOfView({}) end, 129)
test_no_crash("cam:setHorizontalFieldOfView(nil)", function() v.cam:setHorizontalFieldOfView(nil) end, 131)
test_no_crash("cam:setHorizontalFieldOfView('string')", function() v.cam:setHorizontalFieldOfView("string") end, 132)
test_no_crash("cam:setHorizontalFieldOfView({})", function() v.cam:setHorizontalFieldOfView({}) end, 133)

print(string.format("\n%d passed, %d failed", pass, fail))