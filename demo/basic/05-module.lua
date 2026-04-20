--
-- Basic LUA module demo
--
-- Demonstrates how to create and use Lua modules in BPP.
-- The color module provides predefined color values.
--
-- Usage: bpp -f demo/basic/05-module.lua
--

-- Adjust the module path to include the demo/module/ directory
package.path = "C:\\msys64\\home\\koppi\\bpp\\demo\\module\\?.lua;"..package.path

-- print the package path
print("LUA package path: "..package.path)

-- load the module "color.lua"
local color = require "color"

-- use the color module
print(color.red)
print(color.green)
