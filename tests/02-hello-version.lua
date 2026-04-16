local pass = 0
local fail = 0

local function assert_eq(name, got, expected)
  if got == expected then
    print("PASS " .. name)
    pass = pass + 1
  else
    print("FAIL " .. name .. ": got=" .. tostring(got) .. " expected=" .. tostring(expected))
    fail = fail + 1
  end
end

local result = string.format("Hello from %s!", _VERSION)
assert_eq("printf version", result, "Hello from Lua 5.1!")

print(string.format("\n%d passed, %d failed", pass, fail))