include(ExternalProject)
ExternalProject_Add(capstone
  DOWNLOAD_DIR      ${CMAKE_CURRENT_BINARY_DIR}
  GIT_REPOSITORY    https://github.com/libcapstone/libcapstone.git
  GIT_TAG           9a486f5
  UPDATE_COMMAND    ""
  CMAKE_ARGS        -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCAPSTONE_BUILD_SHARED=OFF -DCAPSTONE_BUILD_TESTS=OFF -DCAPSTONE_BUILD_CSTOOL=OFF -DCAPSTONE_ARCHITECTURE_DEFAULT=OFF -DCAPSTONE_X86_SUPPORT=ON
  INSTALL_COMMAND   ""
)
ExternalProject_Get_property(capstone SOURCE_DIR)
set(capstone_SOURCE_DIR ${SOURCE_DIR})
ExternalProject_Get_property(capstone BINARY_DIR)
set(capstone_BINARY_DIR ${BINARY_DIR})

add_library(capstone_static STATIC IMPORTED GLOBAL)
set_property(TARGET capstone_static
    PROPERTY IMPORTED_LOCATION
    ${capstone_BINARY_DIR}/libcapstone.a
)

add_dependencies(capstone_static capstone)
include_directories(${capstone_SOURCE_DIR}/include/capstone)
link_directories(${capstone_BINARY_DIR})
