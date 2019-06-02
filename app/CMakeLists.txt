cmake_minimum_required(VERSION 3.4.1)

include_directories(src/main/jni/include/)

add_library(
        native-lib
        SHARED
        src/main/jni/native-lib.cpp
        src/main/jni/mp3_encoder.cpp
)

find_library(
        log-lib
        log
)

add_library(
        libmp3lame-lib
        SHARED
        IMPORTED
)

set_target_properties(
        libmp3lame-lib
        PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libmp3lame.so
)

target_link_libraries(
        native-lib
        libmp3lame-lib
        ${log-lib}
)
