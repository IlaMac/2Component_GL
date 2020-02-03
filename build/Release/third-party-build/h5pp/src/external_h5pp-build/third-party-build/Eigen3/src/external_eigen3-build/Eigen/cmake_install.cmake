# Install script for directory: /home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/libs/Eigen3")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE FILE FILES
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Cholesky"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/CholmodSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Core"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Dense"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Eigen"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Eigenvalues"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Geometry"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Householder"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/IterativeLinearSolvers"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Jacobi"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/LU"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/MetisSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/OrderingMethods"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/PaStiXSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/PardisoSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/QR"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/QtAlignedMalloc"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SPQRSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SVD"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/Sparse"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SparseCholesky"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SparseCore"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SparseLU"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SparseQR"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/StdDeque"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/StdList"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/StdVector"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/SuperLUSupport"
    "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/UmfPackSupport"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE DIRECTORY FILES "/home/ilaria/Desktop/MultiComponents_SC/2Components_GL/build/Release/third-party-build/h5pp/src/external_h5pp-build/third-party-build/Eigen3/src/external_eigen3/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

