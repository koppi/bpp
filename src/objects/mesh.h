#ifndef MESH_H
#define MESH_H

#ifdef HAS_LIB_ASSIMP

// #include <GL/glew.h>

#ifdef WIN32
#include <windows.h>
#endif

#include "object.h"

#include "BulletCollision/Gimpact/btGImpactCollisionAlgorithm.h"
#include "BulletCollision/Gimpact/btGImpactShape.h"
#include <btBulletDynamicsCommon.h>

#include <assimp/scene.h>

class Mesh : public Object {
public:
  Mesh(const QString &filename, btScalar mass);
  Mesh(const QString &filename);
  Mesh();
  ~Mesh();

  btGImpactMeshShape *getShape() const;
  void setShape(btGImpactMeshShape *shape);

  btTriangleMesh *getTriangleMesh() const;
  void setTriangleMesh(btTriangleMesh *mesh);

  void setMass(btScalar mass) override;

  void luaRelease() {
    m_shape = nullptr;
    m_mesh = nullptr;
    body = nullptr;
    shape = nullptr;
  }

  void loadFile(const QString &filename, btScalar mass);

  static void luaBind(lua_State *s);
  QString toString() const override;
  void toPOV(QTextStream *s) const override;
  void toMesh2(QTextStream *s) const;

  void renderInLocalFrame(btVector3 &minaabb, btVector3 &maxaabb) override;

protected:
  btGImpactMeshShape *m_shape;
  btTriangleMesh *m_mesh;
  const aiScene *m_scene;
};

#endif

#endif // MESH_H
