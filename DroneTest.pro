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


DJI_ROOT = ./Onboard-SDK-3.6.1/

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
        $$DJI_ROOT/osdk-core/api/src/dji_ack.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_broadcast.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_camera.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_command.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_control.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_error.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_gimbal.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_hardware_sync.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_hotpoint.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_mfio.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_mission_manager.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_mobile_communication.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_subscription.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_vehicle.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_version.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_virtual_rc.cpp \
        $$DJI_ROOT/osdk-core/api/src/dji_waypoint.cpp \
        $$DJI_ROOT/osdk-core/protocol/src/dji_aes.cpp \
        $$DJI_ROOT/osdk-core/protocol/src/dji_open_protocol.cpp \
        $$DJI_ROOT/osdk-core/protocol/src/dji_protocol_base.cpp \
        $$DJI_ROOT/osdk-core/hal/src/dji_hard_driver.cpp \
        $$DJI_ROOT/osdk-core/hal/src/dji_log.cpp \
        $$DJI_ROOT/osdk-core/hal/src/dji_memory.cpp \
        $$DJI_ROOT/osdk-core/hal/src/dji_platform_manager.cpp \
        $$DJI_ROOT/osdk-core/hal/src/dji_thread_manager.cpp \
        $$DJI_ROOT/osdk-core/utility/src/dji_circular_buffer.cpp \
        $$DJI_ROOT/osdk-core/utility/src/dji_singleton.cpp \
        $$DJI_ROOT/osdk-core/platform/linux/src/linux_serial_device.cpp \
        $$DJI_ROOT/osdk-core/platform/default/src/dji_memory_default.cpp \
        $$DJI_ROOT/sample/linux/common/dji_linux_environment.cpp \
        $$DJI_ROOT/sample/linux/flight-control/flight_control_sample.cpp
#LIBS +=
