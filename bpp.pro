TARGET   = bpp

TEMPLATE = app

CONFIG += c++11

CONFIG *= qt opengl warn_on shared thread

DEFINES        += HAS_LIB_ASSIMP
DEFINES        += BOOST_BIND_GLOBAL_PLACEHOLDERS

# QMAKE_CXXFLAGS += -Wno-attributes -Wno-deprecated -Wno-deprecated-copy -Wno-deprecated-declarations -Wno-reorder -Wno-parentheses -Wno-ignored-qualifiers -Wno-unused-local-typedefs -Wno-terminate

win32 {

  CONFIG += build_with_msys2
  include(msys2.pri)

  RESOURCES   += res.qrc humanity.qrc

  RC_FILE      = bpp.rc

} else {

  CONFIG      += link_pkgconfig

  bpp-binary.path = /usr/bin
  bpp-binary.files = release/bpp
  bpp-deskop.path = /usr/share/applications
  bpp-deskop.files = bpp.desktop
  bpp-icons.path = /usr/share/icons/hicolor/scalable/apps
  bpp-icons.files = icons/bpp.svg
  bpp-man.path = /usr/share/man/man1
  bpp-man.files = bpp.1
  bpp-man.depends = $(SOURCES)
  bpp-man.commands = help2man --no-discard-stderr -N -n \"Bullet Physics Playground\" -o bpp.1 ./bpp

  INSTALLS    += bpp-binary bpp-deskop bpp-icons bpp-man

  RESOURCES   += res.qrc humanity.qrc

  QMAKE_EXTRA_TARGETS += bpp-man
}

mac {
  CONFIG      += x86 ppc
  ICON         = icons/bpp.icns
}

win32 {
  DEFINES += BUILDTIME=\\\"$$system('echo %time%')\\\"
  DEFINES += BUILDDATE=\\\"$$system('echo %date%')\\\"
  DEFINES += BULLET_VERSION=\\\"\\\"
} else {
  DEFINES += BUILDTIME=\\\"$$system(date '+%H:%M')\\\"
  DEFINES += BUILDDATE=\\\"$$system(date '+%Y-%m-%d')\\\"
  DEFINES += BULLET_VERSION=\\\"$$system(pkg-config bullet --modversion)\\\"
}

QMAKE_CXXFLAGS_RELEASE += -O3
QMAKE_CXXFLAGS_DEBUG   += -O0

#CONFIG(debug, debug|release){
#  DESTDIR = ./debug
#  OBJECTS_DIR = debug/.obj
#  MOC_DIR = debug/.moc
#  RCC_DIR = debug/.rcc
#  UI_DIR = debug/.ui
#}

#CONFIG(release, debug|release){
#  DESTDIR = ./release
#  OBJECTS_DIR = release/.obj
#  MOC_DIR = release/.moc
#  RCC_DIR = release/.rcc
#  UI_DIR = release/.ui
#}

#INCLUDEPATH += /usr/include/bullet
#INCLUDEPATH += /usr/local/include/bullet

unix:link_pkgconfig {
#  message("Using pkg-config "$$system(pkg-config --version)".")

  LSB_RELEASE_ID  = $$system(. /etc/os-release; echo "$NAME")
  LSB_RELEASE_REL = $$system(. /etc/os-release; echo "$VERSION_ID")

  message(This is $$LSB_RELEASE_ID $$LSB_RELEASE_REL)

  contains(LSB_RELEASE_ID, Ubuntu): {
    contains(LSB_RELEASE_REL, 22.04) : {
      PKGCONFIG += lua5.2
      PKGCONFIG -= luabind
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
    contains(LSB_RELEASE_REL, 22.10) : {
      PKGCONFIG += lua5.2
      PKGCONFIG -= luabind
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
    contains(LSB_RELEASE_REL, 23.04) : {
      PKGCONFIG += lua5.2
      PKGCONFIG -= luabind
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
    contains(LSB_RELEASE_REL, 23.10) : {
      PKGCONFIG += lua5.2
      PKGCONFIG -= luabind
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
  }
  contains(LSB_RELEASE_REL, 24.04) : {
      PKGCONFIG += lua5.1
      PKGCONFIG -= luabind 
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }

  contains(LSB_RELEASE_ID, Debian): {
     contains(LSB_RELEASE_REL, 11) : {
      PKGCONFIG += lua5.2
      PKGCONFIG -= luabind
      PKGCONFIG += bullet
      PKGCONFIG += sdl2
      LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
      DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
    contains(LSB_RELEASE_REL, 12) : {
     PKGCONFIG += lua5.2
     PKGCONFIG -= luabind
     PKGCONFIG += bullet
     PKGCONFIG += sdl2
     LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
     DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
    contains(LSB_RELEASE_REL, 13) : {
     PKGCONFIG += lua5.1
     PKGCONFIG -= luabind
     PKGCONFIG += bullet
     PKGCONFIG += sdl2
     LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
     DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
    }
  }
  contains(LSB_RELEASE_ID, Mint): {
    PKGCONFIG += lua5.2
    PKGCONFIG -= luabind
    PKGCONFIG += bullet
    PKGCONFIG += sdl2
    LIBS += -lQGLViewer-qt5 -lGLEW -lGLU -lGL -lglut -lluabind
    DEFINES += HAVE_btHingeAccumulatedAngleConstraint
    DEFINES += BOOST_BIND_GLOBAL_PLACEHOLDERS
  }
  contains(LSB_RELEASE_ID, FreeBSD): {
    PKGCONFIG += bullet lua-5.1 sdl2
    LIBS += -lluabind -lQGLViewer -lGLEW -lGLU -lGL -lglut
  }

  contains(DEFINES, HAS_LIB_ASSIMP) {
    PKGCONFIG += assimp
  }
}

CONFIG  *= debug_and_release
CONFIG  *= qt opengl
CONFIG  += warn_on
CONFIG  += thread

QT      *= opengl xml network gui core

INCLUDEPATH += src/wrapper
DEPENDPATH  += src/wrapper

# Main BPP source files

INCLUDEPATH += src
DEPENDPATH  += src

SOURCES += $$files("src/*.cpp", true)
HEADERS += $$files("src/*.h", true)

FORMS   += src/gui.ui \
           src/prefs.ui

ICON    = icons/bpp.svg

OTHER_FILES += README.md \
               bpp.nsi \
               License \
               debian/changelog

OTHER_FILES += $$files("icons/*.*", true)
OTHER_FILES += $$files("demo/*.*", true)
OTHER_FILES += $$files("includes/*.*", true)
OTHER_FILES += $$files("export/*.*", true)

win32:DISTFILES += \
    msys2.pri
