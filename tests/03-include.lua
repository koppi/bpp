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

local function assert_match(name, got, pattern)
  if string.match(got, pattern) then
    print("PASS " .. name)
    pass = pass + 1
  else
    print("FAIL " .. name .. ": got=" .. tostring(got) .. " expected pattern=" .. pattern)
    fail = fail + 1
  end
end

local c = require "color"

assert_eq("color module red", c.red, "#ff0000")
assert_match("color module is table", type(c), "table")

print(string.format("\n%d passed, %d failed", pass, fail))