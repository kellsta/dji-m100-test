QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# 1. My Header FILES
HEADERS += \
#    flight_control_sample.hpp \

# 2. My source files
SOURCES += \
        main.cpp \
#    flight_control_sample.cpp \


DJI_ROOT = /home/miguel/rep18/hsfl-dji/Onboard-SDK-3.6.1/

# 3. Their header files (libraries headers, include the path to headers)
INCLUDEPATH += $$DJI_ROOT/osdk-core/api/inc
INCLUDEPATH += $$DJI_ROOT/osdk-core/protocol/inc
INCLUDEPATH += $$DJI_ROOT/osdk-core/hal/inc
INCLUDEPATH += $$DJI_ROOT/osdk-core/utility/inc
INCLUDEPATH += $$DJI_ROOT/osdk-core/platform/linux/inc
INCLUDEPATH += $$DJI_ROOT/osdk-core/platform/default/inc
INCLUDEPATH += $$DJI_ROOT/sample/linux/common
INCLUDEPATH += $$DJI_ROOT/sample/linux/flight-control


# 4. Their source files (libraries implementation, include the source files)
#optional
HEADERS += \
        $$DJI_ROOT/osdk-core/api/inc/*.hpp \
        $$DJI_ROOT/sample/linux/common/*.hpp

SOURCES += \
        $$DJI_ROOT/osdk-core/api/src/*.cpp \
        $$DJI_ROOT/osdk-core/protocol/src/*.cpp \
        $$DJI_ROOT/osdk-core/hal/src/*.cpp \
        $$DJI_ROOT/osdk-core/utility/src/*.cpp \
        $$DJI_ROOT/osdk-core/platform/linux/src/*.cpp \
        $$DJI_ROOT/osdk-core/platform/default/src/*.cpp \
        $$DJI_ROOT/sample/linux/common/*.cpp \
        $$DJI_ROOT/sample/linux/flight-control/flight_control_sample.cpp
#LIBS +=
