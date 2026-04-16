#ifndef PLANE_H
#define PLANE_H

#include "object.h"

#include <btBulletDynamicsCommon.h>

class Plane : public Object {
public:
  Plane(const btVector3 &dim, btScalar nConst, btScalar size);
  Plane(btScalar nx = 0.0, btScalar ny = 0.0, btScalar nz = 0.0,
        btScalar nConst = 0.0, btScalar size = 10.0);
  ~Plane(); // Add destructor declaration

  void setPigment(const QString &pigment);

  static void luaBind(lua_State *s);
  QString toString() const override;
  void toPOV(QTextStream *s) const override;

  void renderInLocalFrame(btVector3 &minaabb, btVector3 &maxaabb) override;
  void render(btVector3 &minaabb, btVector3 &maxaabb);

  btScalar getSize() const;

protected:
  void init(btScalar nx, btScalar ny, btScalar nz, btScalar nConst,
            btScalar size);

  btScalar size;

  QString mPigment;
};

#endif // PLANE_H
