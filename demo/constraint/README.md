# Bullet Physics Constraint Demos

This directory contains Lua demos for various Bullet Physics constraint types.

## Constraint Types

### btHingeConstraint (00-hinge.lua)
A hinge constraint restricts one or two bodies to rotate around a shared axis. Supports angular motor for driving rotation.

**Features:**
- Single or two-body attachment
- Angular motor with velocity control
- Configurable limits

### btPoint2PointConstraint (02-point2point.lua)
A point-to-point constraint acts like a ball-and-socket joint, connecting two bodies at specific pivot points.

**Features:**
- Each body has a pivot point
- Creates chain/collar structures
- Used in pearls collar demo

### btSliderConstraint (03-sliderConstraint)
A slider constraint allows relative motion along one axis (linear sliding) and optionally rotation around that axis.

**Features:**
- Linear limits (lower/upper)
- Linear motor with velocity control
- Angular limits
- Angular motor with velocity control
- Configurable softness/damping

### btConeTwistConstraint (04-conetwist.lua)
A cone twist constraint limits rotation within a cone, commonly used for shoulder joints.

**Features:**
- Limit angular range per axis
- Motor target quaternion
- Enable/disable motor
- Max motor impulse

### btGeneric6DofConstraint (05-generic6dof.lua)
A generic 6 degrees of freedom constraint with independent limits per axis.

**Features:**
- Linear limits (X, Y, Z)
- Angular limits (X, Y, Z)
- Per-axis setLimit() method

### btGeneric6DofSpringConstraint (06-generic6dofspring.lua)
Extends btGeneric6DofConstraint with spring support per axis.

**Features:**
- All btGeneric6DofConstraint features
- Enable spring per axis
- Configurable stiffness
- Configurable damping
- Equilibrium point setting

### btGearConstraint (07-gear.lua)
A gear constraint couples two bodies' rotation with a configurable ratio.

**Features:**
- Configurable gear ratio
- Independent axis direction per body
- Used to simulate gear trains

## Usage

Run a demo:
```bash
./release/bpp -f demo/constraint/00-hinge.lua
```

## Keyboard Shortcuts

- **F1** - Previous car (01-car.lua only)
- **F2** - Next car (01-car.lua only)

## See Also

- [Bullet Physics Documentation](https://pybullet.org/)
- [Bullet3 GitHub](https://github.com/bulletphysics/bullet3)