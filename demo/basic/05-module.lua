--
-- Basic LUA module demo
--

-- adjust the module path to include the demo/module/ directory
package.path = "C:\\msys64\\home\\koppi\\bpp\\demo\\module\\?.lua;"..package.path

-- print the package path
print("LUA package path: "..package.path)

-- load the module "color.lua"
local color = require "color"

-- use the color module
print(color.red)
print(color.green)
