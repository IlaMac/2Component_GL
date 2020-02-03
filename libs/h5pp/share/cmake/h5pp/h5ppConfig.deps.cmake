
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was h5ppConfig.deps.cmake.in                            ########

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

include(CMakeFindDependencyMacro)
if (NOT Eigen3_FOUND OR NOT TARGET Eigen3::Eigen)
    set(PACKAGE_PREFIX_DIR              ${PACKAGE_PREFIX_DIR_SAVED})
    find_dependency(Eigen3 3.3.4
        PATHS ${DIRECTORY_HINTS} ${Eigen3_DIR} ${EIGEN3_ROOT_DIR} ${EIGEN3_INCLUDE_DIR}
        PATH_SUFFIXES Eigen3 eigen3 include/Eigen3 include/eigen3
        NO_CMAKE_PACKAGE_REGISTRY)

endif()
if (NOT spdlog_FOUND OR NOT TARGET spdlog::spdlog)
    include(GNUInstallDirs)
    set(PACKAGE_PREFIX_DIR              ${PACKAGE_PREFIX_DIR_SAVED})
    set(spdlog_DIR                      "")
    find_dependency(spdlog 1.3
            PATHS ${spdlog_DIR} ${DIRECTORY_HINTS}
            PATH_SUFFIXES spdlog spdlog/${CMAKE_INSTALL_LIBDIR} spdlog/${CMAKE_INSTALL_LIBDIR}/cmake/spdlog spdlog/share spdlog/cmake
            NO_DEFAULT_PATH)
endif()

if (NOT HDF5_FOUND OR NOT hdf5::hdf5)
    set(PACKAGE_PREFIX_DIR              ${PACKAGE_PREFIX_DIR_SAVED})
    ##################################################################
    ### Adapt pthread for static/dynamic linking                   ###
    ##################################################################
    set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
    set(THREADS_PREFER_PTHREAD_FLAG FALSE)
    find_package(Threads)
    if(TARGET Threads::Threads AND NOT BUILD_SHARED_LIBS)
        set_target_properties(Threads::Threads PROPERTIES INTERFACE_LINK_LIBRARIES "-Wl,--whole-archive ${CMAKE_THREAD_LIBS_INIT} -Wl,--no-whole-archive")
    endif()

    enable_language(C)
    include(${H5PP_INSTALL_CONFIGDIR}/FindPackageHDF5.cmake)
endif()


