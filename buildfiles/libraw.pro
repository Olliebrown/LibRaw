# QMake template is a library
TEMPLATE=lib

# We use qmake to build but not Qt
CONFIG-=qt

# Unix-like systems will automatically add the 'lib' part
CONFIG(debug,debug|release) {
    win32:TARGET=librawd
    unix:TARGET=rawd
} else {
    win32:TARGET=libraw
    unix:TARGET=raw
}

# Common configuraiton between the lib and the example programs
include (libraw-common-lib.pro)

# To build a static library uncomment this line
CONFIG += staticlib static

# Ensures DLL linkage is added
DEFINES+=LIBRAW_BUILDLIB

# Project source files
HEADERS= \
    ../libraw/libraw.h \
    ../libraw/libraw_alloc.h \
    ../libraw/libraw_const.h \
    ../libraw/libraw_datastream.h \
    ../libraw/libraw_types.h \
    ../libraw/libraw_internal.h \
    ../libraw/libraw_version.h \
    ../internal/defines.h \
    ../internal/var_defines.h \
    ../internal/libraw_internal_funcs.h

SOURCES+= \
    ../internal/dcraw_common.cpp \
    ../internal/dcraw_fileio.cpp \
    ../internal/demosaic_packs.cpp \
    ../src/libraw_cxx.cpp \
    ../src/libraw_datastream.cpp \
    ../src/libraw_c_api.cpp

