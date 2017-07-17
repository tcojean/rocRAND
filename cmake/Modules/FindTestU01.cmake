set(ERROR_MESSAGE "Cannot find the TestU01 installation. Please set TESTU01_ROOT to the root directory containing TESTU01.")
set(TESTU01_ROOT_DIR "")
mark_as_advanced(TESTU01_ROOT_DIR)
if(TESTU01_ROOT_DIR STREQUAL "")
    set(TESTU01_ROOT_DIR "/usr/local")
endif()
FIND_LIBRARY(testu01 NAMES testu01 PATHS /usr/local/lib)
FIND_LIBRARY(probdist NAMES probdist testu01probdist PATHS /usr/local/lib)
FIND_LIBRARY(mylib NAMES mylib testu01mylib PATHS /usr/local/lib)
if(NOT testu01)
    message(FATAL_ERROR "TestU01 library not found")
endif()
if(NOT probdist)
    message(FATAL_ERROR "ProbDist library not found")
endif()
if(NOT mylib)
    message(FATAL_ERROR "MyLib library not found")
endif()
find_path(TESTU01_INCLUDE_DIRS bbattery.h PATH_SUFFIXES testu01 PATHS ${TESTU01_ROOT_DIR}/include)
set(TESTU01_LIBRARY_DIRS ${TESTU01_ROOT_DIR}/lib)