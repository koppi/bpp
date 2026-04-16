#ifndef CYLINDER_H
#define CYLINDER_H

#include "object.h"

#include <btBulletDynamicsCommon.h>

class Cylinder : public Object {
public:
  Cylinder(const btVector3 &dim, btScalar mass = 1.0);
  Cylinder(btScalar radius = 1.0, btScalar depth = 1.0, btScalar mass = 1.0);
  ~Cylinder(); // Add destructor declaration

  btScalar lengths[3];

  static void luaBind(lua_State *s);
  QString toString() const override;
  void toPOV(QTextStream *s) const override;

protected:
  void init(btScalar radius, btScalar depth, btScalar mass);
  void renderInLocalFrame(btVector3 &minaabb, btVector3 &maxaabb) override;
};

#endif // CYLINDER_H
