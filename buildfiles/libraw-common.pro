# If you built the static library, enable this line!
DEFINES += LIBRAW_NODLL

# OS Specific configs
macx:CONFIG-=app_bundle
win32:CONFIG+=console

# Library Linking (make sure libraw project builds first!)
CONFIG(debug,debug|release) {
    win32:LIBS+=librawd.lib libjpeg.lib
    unix:LIBS+=-lrawd -ljpeg
} else {
    win32:LIBS+=libraw.lib libjpeg.lib
    unix:LIBS+=-lraw -ljpeg
}

# Pull in same config as library
include (libraw-common-lib.pro)
