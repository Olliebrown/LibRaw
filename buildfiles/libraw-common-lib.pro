# Enable C++17 support and appropriate CRT linkage
win32 {
    CONFIG(debug, debug|release) {
        QMAKE_CXXFLAGS += /std:c++17 /MDd /wd4251
    } else {
        QMAKE_CXXFLAGS += /std:c++17 /MD /wd4251
    }
} else {
    QMAKE_CXXFLAGS += -std=c++17
}

# Mac specific configurations
macx {
    CONFIG += x86 x86_64
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.10
}

# Enable use of libjpeg
# IMPORTANT: Adjust INCLUDEPATH and LIBS below to point to your libjpeg
DEFINES += USE_JPEG

win32:INCLUDEPATH += ../../jpeg-9c
win32:LIBS += -L../../jpeg-9c -llibjpeg

# TODO: Fix these
macx:INCLUDEPATH +=
macx:LIBS += -ljpeg

# Include the libraw root folder so headers can be found
INCLUDEPATH+=../

# Setup output directories
OBJECTS_DIR = obj/
MOC_DIR = moc/
RCC_DIR = rcc/
UI_DIR = ui/
DESTDIR = $$OUT_PWD/

# Point to directory where libraw will be built
LIBS+=-L$$OUT_PWD

# Turns off the majority of compiler warnings (there are LOTS)
CONFIG+=warn_off
