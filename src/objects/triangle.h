#ifndef TRIANGLE_H
#define TRIANGLE_H

#include "object.h"

#include <btBulletDynamicsCommon.h>

class Triangle : public Object {

public:
  Triangle(const btVector3 &p0 = btVector3(0, 0, 0),
           const btVector3 &p1 = btVector3(1, 0, 0),
           const btVector3 &p2 = btVector3(0.5, 0, 1),
           btScalar mass = 0);
  ~Triangle();

  btVector3 vertices[3];

  static void luaBind(lua_State *s);
  QString toString() const override;
  void toPOV(QTextStream *s) const override;

  void renderInLocalFrame(btVector3 &minaabb, btVector3 &maxaabb) override;

protected:
  void init(const btVector3 &p0, const btVector3 &p1, const btVector3 &p2,
            btScalar mass);
};

#endif // TRIANGLE_H