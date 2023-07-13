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
    GIT_SHALLOW TRUE
    OPTIONS
    "TF_BUILD_EXAMPLES OFF"
    "TF_BUILD_TESTS OFF"
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
    GIT_SHALLOW TRUE
    OPTIONS
    "DLIB_ISO_CPP_ONLY_STR TRUE"
    "DLIB_NO_GUI_SUPPORT_STR TRUE"
    "DLIB_USE_LAPACK_STR TRUE"
    "DLIB_USE_BLAS_STR TRUE"
    "DLIB_USE_CUDA_STR FALSE"
)

if(dlib_ADDED)
    message(STATUS "Added dlib @ ${dlib_SOURCE_DIR}")
    list(APPEND DEP_LIBS dlib::dlib)
else()
    message(FATAL_ERROR "dlib was not installed.")
endif()
# ----------------------------------------------------------------- #

# --------------------------- ensmallen --------------------------- #
CPMAddPackage(
    NAME ensmallen
    VERSION 1.16.2
    DOWNLOAD_ONLY YES
    GIT_TAG ensmallen-1.16.2
    GITHUB_REPOSITORY "mlpack/ensmallen"
    GIT_SHALLOW TRUE
    OPTIONS
    "DOWNLOAD_DEPENDENCIES=OFF"
)

if(ensmallen_ADDED)
    message(STATUS "Added ensmallen @ ${ensmallen_SOURCE_DIR}")
    add_library(ensmallen INTERFACE IMPORTED)
    target_include_directories(ensmallen INTERFACE "${ensmallen_SOURCE_DIR}/include")
    list(APPEND DEP_LIBS ensmallen)
else()
    message(FATAL_ERROR "ensmallen was not installed.")
endif()
# ----------------------------------------------------------------- #

# ---------------------------- cereal ----------------------------- #
CPMAddPackage(
    NAME cereal
    VERSION 1.3.2
    DOWNLOAD_ONLY YES
    GIT_TAG v1.3.2
    GITHUB_REPOSITORY "USCiLab/cereal"
    GIT_SHALLOW TRUE
)

if(cereal_ADDED)
    message(STATUS "Added cereal @ ${cereal_SOURCE_DIR}")
    add_library(cereal INTERFACE IMPORTED)
    target_include_directories(cereal INTERFACE "${cereal_SOURCE_DIR}/include")
    list(APPEND DEP_LIBS cereal)
else()
    message(FATAL_ERROR "cereal was not installed.")
endif()
# ----------------------------------------------------------------- #

# # ------------- mlpack (Requires armadillo & cereal) -------------- #
# CPMAddPackage(
#     NAME mlpack
#     VERSION 3.1.1
#     DOWNLOAD_ONLY YES
#     URL "https://github.com/mlpack/mlpack/archive/refs/tags/4.2.0.tar.gz"
#     OPTIONS
#     "BUILD_PYTHON_BINDINGS=OFF"
#     "BUILD_TESTS=OFF"
# )

# if(mlpack_ADDED)
#     message(STATUS "Added mlpack @ ${mlpack_SOURCE_DIR}")
#     add_library(mlpack INTERFACE IMPORTED)
#     target_include_directories(mlpack INTERFACE "${mlpack_SOURCE_DIR}/src/")
#     list(APPEND DEP_LIBS mlpack)
# else()
#     message(FATAL_ERROR "mlpack was not installed.")
# endif()
# # ----------------------------------------------------------------- #

# ---------------------------- spdlog ----------------------------- #
CPMAddPackage(
    NAME spdlog
    VERSION 1.12.0
    DOWNLOAD_ONLY YES
    GIT_TAG v1.12.0
    GITHUB_REPOSITORY "gabime/spdlog"
    GIT_SHALLOW TRUE
)

if(spdlog_ADDED)
    message(STATUS "Added spdlog @ ${spdlog_SOURCE_DIR}")
    add_library(spdlog INTERFACE IMPORTED)
    target_include_directories(spdlog INTERFACE "${spdlog_SOURCE_DIR}/include")
    list(APPEND DEP_LIBS spdlog)
else()
    message(FATAL_ERROR "spdlog was not installed.")
endif()
# ----------------------------------------------------------------- #

# ---------------------------- fmtlib ----------------------------- #

CPMAddPackage("gh:fmtlib/fmt#10.0.0")


if(fmt_ADDED)
    message(STATUS "Added fmt @ ${fmt_SOURCE_DIR}")
    list(APPEND DEP_LIBS fmt)
else()
    message(FATAL_ERROR "fmt was not installed.")
endif()
# ----------------------------------------------------------------- #

# # ------------------- fmtlog (REQUIRES fmtlib) -------------------- #
# NOT WORKING
# CPMAddPackage(
#     NAME fmtlog
#     VERSION 2.2.1
#     DOWNLOAD_ONLY YES
#     GIT_TAG v2.2.1
#     GITHUB_REPOSITORY "MengRao/fmtlog"
#     # GIT_SUBMODULES FALSE
#     GIT_SHALLOW TRUE
#     OPTIONS
#     "FMTLOG_HEADER_ONLY YES"
# )

# if(fmtlog_ADDED)
#     message(STATUS "Added fmtlog @ ${fmtlog_SOURCE_DIR}")
#     add_library(fmtlog INTERFACE IMPORTED)
#     target_include_directories(fmtlog INTERFACE "${fmtlog_SOURCE_DIR}")
#     list(APPEND DEP_LIBS fmtlog)
# else()
#     message(FATAL_ERROR "fmtlog was not installed.")
# endif()
# # ----------------------------------------------------------------- #


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
