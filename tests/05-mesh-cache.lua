-- test Mesh caching: load 100 torus.stl objects

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

local function assert_not_nil(name, got)
  if got == nil then
    print("FAIL " .. name .. ": got=nil expected=not nil")
    fail = fail + 1
    return
  end
  print("PASS " .. name)
  pass = pass + 1
end

print("Loading 100 torus.stl mesh objects...")

local meshes = {}
for i = 1, 100 do
  local m = Mesh("demo/mesh/torus.stl", 1)
  table.insert(meshes, m)
end

print("Checking that all meshes have valid shapes...")
for i, m in ipairs(meshes) do
  assert_not_nil("Mesh " .. i .. " has shape", m.shape)
end

local shapeAddr = tostring(meshes[1].shape)
print("Verifying all meshes share the same cached shape...")
local allSame = true
for i, m in ipairs(meshes) do
  if tostring(m.shape) ~= shapeAddr then
    allSame = false
    break
  end
end

if allSame then
  print("PASS All 100 meshes share the same cached shape")
  pass = pass + 1
else
  print("FAIL Meshes do not share the same cached shape")
  fail = fail + 1
end

print(string.format("\n%d passed, %d failed", pass, fail))
