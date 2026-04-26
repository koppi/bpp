# Bullet Physics Playground (BPP) - Source Code

**Version:** 0.3.29

A Qt-based application for creating physics simulations using Lua scripting with the Bullet Physics engine.

## Overview

BPP allows you to create 3D physics simulations by writing Lua scripts. The application provides:
- Real-time 3D visualization using OpenGL (QGLViewer)
- Full Bullet Physics integration for rigid body dynamics
- POV-Ray animation export for high-quality rendering
- Interactive debugging and command-line interface

## Directory Structure

```
src/
├── main.cpp              # Application entry point, CLI parsing
├── viewer.cpp/h          # 3D OpenGL viewer + physics world
├── gui.cpp/h             # Main window (editor, debug, toolbars)
├── prefs.cpp/h           # Preferences dialog
├── code.cpp/h            # Lua code editor with line numbers
├── cmd.cpp/h             # Command line input with history
├── high.cpp/h            # Lua syntax highlighter
├── glutils.cpp/h         # OpenGL primitives (cube, sphere, cylinder)
├── lua_bullet.cpp        # Luabind bindings for Bullet Physics
├── pch.h                 # Pre-compiled headers
├── objects/              # Physics object implementations
│   ├── cube.cpp/h
│   ├── sphere.cpp/h
│   ├── cylinder.cpp/h
│   ├── plane.cpp/h
│   ├── triangle.cpp/h
│   ├── mesh.cpp/h        # Assimp-based mesh loading
│   ├── openscad.cpp/h    # OpenSCAD integration
│   ├── cam.cpp/h         # Camera class
│   └── ...
├── joystick/             # Gamepad/joystick support
│   ├── joystickinterface*.cpp/h
│   └── joystickhandler*.cpp/h
└── *.ui                  # Qt Designer UI files
```

## Core Components

### Viewer (`viewer.cpp/h`)
The heart of BPP. Manages:
- Bullet physics world (`btDiscreteDynamicsWorld`)
- Lua state and script execution
- OpenGL rendering via QGLViewer
- POV-Ray export
- Keyboard/mouse input handling
- Lua callbacks (`preSim`, `postDraw`, `onShortcut`, etc.)

### GUI (`gui.cpp/h`)
Main application window with:
- Lua script editor with syntax highlighting
- Debug output panel
- Command line interface
- Camera info display
- Parameters table
- Menu bar and toolbars

### Lua Bindings (`lua_bullet.cpp`)
Exposes Bullet Physics classes to Lua via luabind:
- Collision shapes (`btSphereShape`, `btBoxShape`, `btGImpactMeshShape`, etc.)
- Rigid bodies (`btRigidBody`)
- Constraints (`btHingeConstraint`, `btSliderConstraint`, etc.)
- Vehicles (`btRaycastVehicle`)
- Math types (`btVector3`, `btQuaternion`, `btTransform`)

## Usage

### GUI Mode
```bash
./bpp [script.lua]
```

### Headless Mode
```bash
./bpp -f script.lua -n 100 -e  # Run 100 frames, export to POV-Ray
./bpp -l "print('Hello')"      # Run Lua expression
./bpp -i < script.lua          # Read from stdin
```

### Key Bindings
- **S** - Toggle simulation
- **P** - Toggle POV-Ray export
- **D** - Toggle deactivation
- **R** - Reload script
- **C** - Reset camera view
- **F1/F2** - Cycle objects (if callback defined)

## Lua API Example

```lua
-- Create a sphere
local s = Sphere(1.0)
s:setPosition(btVector3(0, 5, 0))
v:add(s)

-- Create ground plane
local g = Plane(10)
g:setPosition(btVector3(0, -1, 0))
v:add(g)

-- Set gravity
v.gravity = btVector3(0, -9.81, 0)
```

## Dependencies

- **Qt 5/6** - GUI framework
- **Bullet Physics** - Physics engine
- **Lua 5.1/5.2** - Scripting language
- **luabind** - Lua/C++ binding
- **QGLViewer** - 3D OpenGL viewer
- **libassimp** (optional) - 3D mesh loading
- **SDL2** (optional) - Joystick support

## POV-Ray Export

Enable POV-Ray export with **P** key or via menu. Frames are saved to:
```
export/<scene_name>/<scene_name>-<frame>.inc
```

Configure export settings in Preferences → POV-Ray.

## Building

Requires CMake and a C++ compiler:

```bash
mkdir build && cd build
cmake ..
make
```

## License

Copyright © 2008-2026 Jakob Flierl  
Copyright © 2012-2016 Jaime Vives Piqueres

GitHub: https://github.com/bullet-physics-playground/bpp
