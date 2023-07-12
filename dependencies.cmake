include(cmake/CPM.cmake)
# CPMUsePackageLock(package-lock.cmake)

set(CPM_USE_NAMED_CACHE_DIRECTORIES TRUE)
set(CPM_USE_LOCAL_PACKAGES TRUE)

# DO NOT REMOVE
CPMAddPackage(
  NAME Ccache.cmake
  GITHUB_REPOSITORY TheLartians/Ccache.cmake
  VERSION 1.2
)

SET(DEP_LIBS "")

# ---------------------------- Eigen ---------------------------- #
CPMAddPackage(
    NAME Eigen3 
    VERSION 3.4.0 
    DOWNLOAD_ONLY YES
    URL https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz
)

if(Eigen3_ADDED)
    message(STATUS "Added Eigen3 @ ${Eigen3_SOURCE_DIR}")
    add_library(Eigen3 INTERFACE IMPORTED)
    target_include_directories(Eigen3 INTERFACE "${Eigen3_SOURCE_DIR}")
    
    # Set env variable so other libraries can find Eigen3
    set(EIGEN_INCLUDE_DIR ${Eigen3_SOURCE_DIR})
    set(GC_EIGEN_LOCATION ${Eigen3_SOURCE_DIR} CACHE PATH "EIGEN_PATH")
    list(APPEND DEP_LIBS Eigen3)
else()
    message(FATAL_ERROR "Eigen3 was not installed.")
endif()
# ----------------------------------------------------------------- #

# -------------------------- Nanoflann  -------------------------- #
CPMAddPackage(
    NAME nanoflann
    VERSION 1.5.0
    DOWNLOAD_ONLY YES
    URL https://github.com/jlblancoc/nanoflann/archive/refs/tags/v1.5.0.tar.gz
)

if(nanoflann_ADDED)
    message(STATUS "Added nanoflann @ ${nanoflann_SOURCE_DIR}")
    add_library(nanoflann INTERFACE IMPORTED)
    target_include_directories(nanoflann INTERFACE "${nanoflann_SOURCE_DIR}/include")
    list(APPEND DEP_LIBS nanoflann)
else()
    message(FATAL_ERROR "nanoflann was not installed.")
endif()
# ----------------------------------------------------------------- #


# # ---- Geometry Central (NEEDS HAPPLY, WILL INSTALL NANOFLANN) ---- #
# CPMAddPackage(
#     NAME happly
#     URL https://github.com/nmwsharp/happly/archive/88f79725d32d78e0e637ebf42d8432d519e1c7d0.zip
#     GIT_SHALLOW TRUE
#     DOWNLOAD_ONLY YES
# )

# if(happly_ADDED)
#     message(STATUS "Added happly @ ${happly_SOURCE_DIR}")
#     add_library(happly INTERFACE IMPORTED)
#     target_include_directories(happly INTERFACE "${happly_SOURCE_DIR}")
#     list(APPEND DEP_LIBS happly)
# else()
#     message(FATAL_ERROR "happly not installed.")
# endif()

# CPMAddPackage(
#     NAME geometry-central
#     VERSION 0.1.0
#     URL https://github.com/nmwsharp/geometry-central/archive/refs/heads/master.zip
#     GIT_SHALLOW TRUE
#     OPTIONS
#     "SUITESPARSE OFF"
# )

# if(geometry-central_ADDED)
#     message(STATUS "Added geometry-central @ ${geometry-central_SOURCE_DIR}")
#     list(APPEND DEP_LIBS geometry-central)
# else()
#     message(FATAL_ERROR "geometry-central not installed.")
# endif()
# # ----------------------------------------------------------------- #

# --------------------------- Armadillo --------------------------- #
CPMAddPackage(
    NAME armadillo
    VERSION 12.4.1
    URL https://sourceforge.net/projects/arma/files/armadillo-12.4.1.tar.xz
)

if(armadillo_ADDED)
    message(STATUS "Added armadillo @ ${armadillo_SOURCE_DIR}")
    list(APPEND DEP_LIBS armadillo)
else()
    message(FATAL_ERROR "armadillo was not installed.")
endif()
# ----------------------------------------------------------------- #

# mlpack

# ---------------------------- taskflow --------------------------- #
CPMAddPackage(
    NAME taskflow
    VERSION 3.6.0
    GIT_TAG "v3.6.0"
    GITHUB_REPOSITORY "taskflow/taskflow"
)

if(taskflow_ADDED)
    message(STATUS "Added taskflow @ ${taskflow_SOURCE_DIR}")
    add_library(taskflow INTERFACE IMPORTED)
    target_include_directories(taskflow INTERFACE "${taskflow_SOURCE_DIR}")
    list(APPEND DEP_LIBS taskflow)
else()
    message(FATAL_ERROR "taskflow was not installed.")
endif()
# ----------------------------------------------------------------- #

# ------------------------------ dlib ----------------------------- #
CPMAddPackage(
    NAME dlib
    VERSION 19.24.2
    GIT_TAG "v19.24.2"
    GIT_REPOSITORY "https://github.com/davisking/dlib.git"
)

if(dlib_ADDED)
    message(STATUS "Added dlib @ ${dlib_SOURCE_DIR}")
    list(APPEND DEP_LIBS dlib::dlib)
else()
    message(FATAL_ERROR "dlib was not installed.")
endif()
# ----------------------------------------------------------------- #

# # ---------------------------- Pybind11 --------------------------- #
# CPMAddPackage(
#     NAME pybind
#     VERSION 2.10.4
#     DOWNLOAD_ONLY YES
#     URL https://github.com/pybind/pybind11/archive/refs/tags/v2.10.4.tar.gz
# )

# if(pybind_ADDED)
#     message(STATUS "Added pybind11 @ ${pybind_SOURCE_DIR}")
#     # add_library(pybind INTERFACE IMPORTED)
#     add_subdirectory(${pybind_SOURCE_DIR})
#     target_include_directories(pybind INTERFACE "${pybind_SOURCE_DIR}/include")
# else()
#     message(FATAL_ERROR "pybind11 was not installed.")
# endif()
# # ----------------------------------------------------------------- #
