--
-- Joystick input demo
--
-- Demonstrates reading joystick/gamepad input.
-- The callback receives axis positions and button states.
--
-- Usage: bpp -f demo/basic/12-input-joystick.lua
-- (Requires a connected joystick/gamepad)

v:onJoystick(function(N, joy)
  v:clearDebugText()
  print("onJoystick("..tostring(N)..")")
  print("axes:")
--  for i = 1, #joy.axes do
--    print(i.." "..tostring(joy.axes[i]))
--  end
  for i, axis in ipairs(joy.axes) do
    print("* "..i..": "..axis)
  end
  print("buttons:")
  for i, f in ipairs(joy.buttons) do
    print("* "..i..": "..tostring(f))
  end
  --print(tostring(joy.axes[1]))
end)