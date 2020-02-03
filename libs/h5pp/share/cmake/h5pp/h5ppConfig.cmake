
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was h5ppConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

#################################################################
### Set default policies if CMake is new enough               ###
#################################################################
if (CMAKE_VERSION VERSION_LESS 3.12)
    message(STATUS "Not setting policies")
else()
    cmake_policy(SET CMP0074 NEW)
    cmake_policy(SET CMP0075 NEW)
endif()

set(h5pp_FOUND TRUE)
set(H5PP_FOUND TRUE)
set(H5PP_DIR                        "${PACKAGE_PREFIX_DIR}/share/cmake/h5pp")
set(H5PP_ROOT                       "${PACKAGE_PREFIX_DIR}")
set(H5PP_INCLUDE_DIR                ${H5PP_ROOT}/include)
set(H5PP_INSTALL_DIR_THIRD_PARTY    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/libs")
set(H5PP_INSTALL_CONFIGDIR          "${PACKAGE_PREFIX_DIR}/share/cmake/h5pp")
set(DIRECTORY_HINTS                 /home/ilaria/Desktop/MultiComponents_SC/2Components_GL/libs;/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/libs;${PACKAGE_PREFIX_DIR};${PACKAGE_PREFIX_DIR}/third-party;/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/libs;/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp;/home/ilaria/.conda;/home/ilaria/anaconda3;/home/ilaria/miniconda)
set(PACKAGE_PREFIX_DIR_SAVED        ${PACKAGE_PREFIX_DIR}) # The variable can get changed inside of find_dependency calls! So we need to save it.
set(CMAKE_MODULE_PATH               ${CMAKE_MODULE_PATH} ${H5PP_INSTALL_CONFIGDIR})

include(${H5PP_DIR}/h5ppConfig.deps.cmake)
include(${H5PP_DIR}/h5ppTargets.cmake)


