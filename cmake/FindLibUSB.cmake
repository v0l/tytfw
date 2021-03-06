if(NOT WIN32)
    set(MODULE "libusb-1.0")
    include(FindPkgConfig)
    if(PKG_CONFIG_FOUND)
        SET(MODULE "libusb-1.0")
        IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
            SET(MODULE "libusb-1.0>=1.0.20")
        ENDIF()
        IF(LibUSB_FIND_REQUIRED)
            SET(LibUSB_REQUIRED "REQUIRED")
        ENDIF()
        PKG_CHECK_MODULES(LibUSB ${LibUSB_REQUIRED} ${MODULE} IMPORTED_TARGET)
        RETURN()
    endif()
endif()
message(SEND_ERROR "Platform not supported")