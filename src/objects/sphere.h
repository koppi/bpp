#ifndef SPHERE_H
#define SPHERE_H

#include "object.h"

#include <btBulletDynamicsCommon.h>

class Sphere : public Object {
public:
  Sphere(btScalar radius = 0.5, btScalar mass = 1.0);
  ~Sphere(); // Add destructor declaration

  void setRadius(btScalar radius);
  btScalar getRadius() const;

  static void luaBind(lua_State *s);
  QString toString() const;
  void toPOV(QTextStream *s) const;

protected:
  virtual void renderInLocalFrame(btVector3 &minaabb, btVector3 &maxaabb);

  btScalar radius;
};

#endif // SPHERE_H
