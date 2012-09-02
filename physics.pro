#CONFIG += debug_and_release

## windows: you need:
##
## * VC 2008 SP1: Fix for vector <function <FT>> crash.
##   http://www.microsoft.com/en-us/download/details.aspx?id=15303
## * ..
##

win32 {
  DEFINES += BUILDTIME=\\\"$$system('echo %time%')\\\"
  DEFINES += BUILDDATE=\\\"$$system('echo %date%')\\\"
} else {
  DEFINES += BUILDTIME=\\\"$$system(date '+%H:%M')\\\"
  DEFINES += BUILDDATE=\\\"$$system(date '+%Y-%m-%d')\\\"
}

TEMPLATE = app
TARGET = physics
DEPENDPATH += .
INCLUDEPATH += .
INCLUDEPATH += /usr/include/bullet
INCLUDEPATH += /usr/local/include/bullet
INCLUDEPATH += src/objects/robots/roboop/include
INCLUDEPATH += src/objects/robots/roboop/newmat
INCLUDEPATH += src/objects/robots/roboop/source

win32 {
  DEFINES += WIN32
} else {
  DEFINES += HAS_GETOPT
  CONFIG += link_pkgconfig
  QMAKE_CXXFLAGS_WARN_ON =
  QMAKE_CXXFLAGS_DEBUG += -g3 -O0

  MOC_DIR = .moc
  OBJECTS_DIR = .obj
  UI_DIR = .ui
}

## Add linked libs and paths for headers and palettes here using pkg-config.
## If your system doesn't support pkg-config then comment out the next line and
## set these values below.
#CONFIG += link_pkgconfig

link_pkgconfig {
  message("Config using pkg-config version "$$system(pkg-config --version))
  PKGCONFIG += bullet alsa lua5.1 luabind

  LIBS += -lqglviewer-qt4 -lglut -lGL -l3ds -lroboop -lnewmat -Lsrc/objects/robots/roboop
} else {
  message("Config not using pkg-config")

  LUA_SRC_DIR = C:\\Lua\\5.1
  INCLUDEPATH += $$LUA_SRC_DIR\\include
  LIBS += -L$$LUA_SRC_DIR\\lib -llua

  LUABIND_SRC_DIR = C:\\libs\\luabind-0.9.1
  INCLUDEPATH += $$LUABIND_SRC_DIR $$LUABIN_SRC_DIR\\include
  LIBS += -L$$LUABIND_SRC_DIR -lluabind
  DEFINES += LUABIND_DYNAMIC_LINK

  QGL_SRC_DIR = C:\\libs\\libQGLViewer-2.3.11
  INCLUDEPATH += $$QGL_SRC_DIR
  LIBS += -lqglviewer2

## http://www.transmissionzero.co.uk/software/freeglut-devel/
  GLUT_SRC_DIR = C:\\libs\\freeglut
  INCLUDEPATH += $$GLUT_SRC_DIR\\include
  LIBS += -L$$GLUT_SRC_DIR\\lib -lglut32 -lopengl32

  BUL_SRC_DIR = C:\\libs\\bullet-2.79\\src
  INCLUDEPATH += $$BUL_SRC_DIR

  BUL_LIB_DIR = C:\\libs\\dll\\bullet
  LIBS += -L$$BUL_LIB_DIR -lBulletCollision -lBulletDynamics -lBulletMultithreaded -lBulletSoftBody -lLinearMath /NODEFAULTLIB:LIBCMT

  BOOST_SRC_DIR = C:\\libs\\boost_1_47
  INCLUDEPATH += $$BOOST_SRC_DIR
  LIBS += -L$$BOOST_SRC_DIR\\lib

##  lib3ds-20080909.zip from http://code.google.com/p/lib3ds/
  L3DS_SRC_DIR = C:\\libs\\lib3ds-20080909
  INCLUDEPATH += C:\\libs\dll\\include
  LIBS += -llib3ds-1_3

## The following directory contains dlls for QGLViewer, lua.
  LIBS += -LC:\\libs\\dll
}

QT += xml opengl

unix:!mac {
    DEFINES += __LINUX_ALSASEQ__
}

SOURCES += src/main.cpp \
           src/objects/palette.cpp \
           src/viewer.cpp \
           src/objects/object.cpp \
           src/objects/cube.cpp \
           src/objects/sphere.cpp \
           src/objects/plane.cpp \
           src/objects/cylinder.cpp \
           src/objects/mesh3ds.cpp \
           src/collisionfilter.cpp \
           src/objects/robots/rm.cpp \
           src/objects/robots/rm1.cpp \
           src/objects/cubeaxes.cpp \
           src/gui.cpp \
           src/commandline.cpp \
           src/objects/dice.cpp \
           src/MidiIO.cpp \
           src/MidiEvent.cpp \
           src/RtMidi.cpp \
           src/codeeditor.cpp \
           src/highlighter.cpp \
           src/objects/objects.cpp \
           src/objects/robots/roboop/source/utils.cpp \
           src/objects/robots/roboop/source/trajectory.cpp \
           src/objects/robots/roboop/source/stewart.cpp \
           src/objects/robots/roboop/source/sensitiv.cpp \
           src/objects/robots/roboop/source/robot.cpp \
           src/objects/robots/roboop/source/quaternion.cpp \
           src/objects/robots/roboop/source/kinemat.cpp \
           src/objects/robots/roboop/source/invkine.cpp \
           src/objects/robots/roboop/source/homogen.cpp \
           src/objects/robots/roboop/source/dynamics_sim.cpp \
           src/objects/robots/roboop/source/dynamics.cpp \
           src/objects/robots/roboop/source/delta_t.cpp \
           src/objects/robots/roboop/source/controller.cpp \
           src/objects/robots/roboop/source/control_select.cpp \
           src/objects/robots/roboop/source/config.cpp \
           src/objects/robots/roboop/source/comp_dqp.cpp \
           src/objects/robots/roboop/source/comp_dq.cpp \
           src/objects/robots/roboop/source/clik.cpp \
           src/objects/robots/roboop/newmat/cholesky.cpp \
           src/objects/robots/roboop/newmat/evalue.cpp \
           src/objects/robots/roboop/newmat/fft.cpp \
           src/objects/robots/roboop/newmat/hholder.cpp \
           src/objects/robots/roboop/newmat/jacobi.cpp \
           src/objects/robots/roboop/newmat/myexcept.cpp \
           src/objects/robots/roboop/newmat/newfft.cpp \
           src/objects/robots/roboop/newmat/newmat1.cpp \
           src/objects/robots/roboop/newmat/newmat2.cpp \
           src/objects/robots/roboop/newmat/newmat3.cpp \
           src/objects/robots/roboop/newmat/newmat4.cpp \
           src/objects/robots/roboop/newmat/newmat5.cpp \
           src/objects/robots/roboop/newmat/newmat6.cpp \
           src/objects/robots/roboop/newmat/newmat7.cpp \
           src/objects/robots/roboop/newmat/newmat8.cpp \
           src/objects/robots/roboop/newmat/newmat9.cpp \
           src/objects/robots/roboop/newmat/newmatex.cpp \
           src/objects/robots/roboop/newmat/newmatnl.cpp \
           src/objects/robots/roboop/newmat/newmatrm.cpp \
           src/objects/robots/roboop/newmat/nm_misc.cpp \
           src/objects/robots/roboop/newmat/solution.cpp \
           src/objects/robots/roboop/newmat/sort.cpp \
           src/objects/robots/roboop/newmat/submat.cpp \
           src/objects/robots/roboop/newmat/svd.cpp \
           src/objects/robots/roboop/newmat/bandmat.cpp \
           src/objects/cam.cpp

HEADERS += src/objects/palette.h \
           src/viewer.h \
           src/objects/object.h \
           src/objects/cube.h \
           src/objects/sphere.h \
           src/objects/plane.h \
           src/objects/cylinder.h \
           src/objects/mesh3ds.h \
           src/collisionfilter.h \
           src/objects/robots/rm.h \
           src/objects/robots/rm1.h \
           src/objects/cubeaxes.h \
           src/gui.h \
           src/commandline.h \
           src/objects/dice.h \
           src/MidiIO.h \
           src/MidiEvent.h \
           src/RtMidi.h \
           src/codeeditor.h \
           src/highlighter.h \
           src/objects/objects.h \
           src/objects/robots/roboop/source/utils.h \
           src/objects/robots/roboop/source/trajectory.h \
           src/objects/robots/roboop/source/stewart.h \
           src/objects/robots/roboop/source/robot.h \
           src/objects/robots/roboop/source/quaternion.h \
           src/objects/robots/roboop/source/dynamics_sim.h \
           src/objects/robots/roboop/source/controller.h \
           src/objects/robots/roboop/source/control_select.h \
           src/objects/robots/roboop/source/config.h \
           src/objects/robots/roboop/source/clik.h \
           src/objects/robots/roboop/newmat/controlw.h \
           src/objects/robots/roboop/newmat/include.h \
           src/objects/robots/roboop/newmat/myexcept.h \
           src/objects/robots/roboop/newmat/newmat.h \
           src/objects/robots/roboop/newmat/newmatap.h \
           src/objects/robots/roboop/newmat/newmatio.h \
           src/objects/robots/roboop/newmat/newmatnl.h \
           src/objects/robots/roboop/newmat/newmatrc.h \
           src/objects/robots/roboop/newmat/newmatrm.h \
           src/objects/robots/roboop/newmat/precisio.h \
           src/objects/robots/roboop/newmat/solution.h \
           src/objects/robots/roboop/newmat/tmt.h \
           src/objects/cam.h

FORMS   += src/gui.ui

RESOURCES += res.qrc

QMAKE_DISTCLEAN += object_script.* .ui .moc .rcc .obj

OTHER_FILES +=
