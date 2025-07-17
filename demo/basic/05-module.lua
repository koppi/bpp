--
-- Basic LUA module demo
--

-- adjust the module path to include the demo/ directory
package.path = "C:\\msys64\\home\\koppi\\bpp\\demo\\?.lua;"..package.path

-- print the package path
print("LUA package path: "..package.path)

-- load the module "color.lua"
local color = require "module/color"

-- use the color module
print(color.red)
print(color.green)
