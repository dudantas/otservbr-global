# Find the spdlog include directory
# The following variables are set if spdlog is found.
#  SPDLOG_FOUND        - True when the spdlog include directory is found.
#  SPDLOG_INCLUDE_DIRS  - The path to where the spdlog include files are.
# If spdlog is not found, SPDLOG_FOUND is set to false.

# Locate header.
if(MSVC)
    find_path(SPDLOG_INCLUDE_DIR spdlog/spdlog.h
        HINTS ${SPDLOG_ROOT_DIR}/include)

    # Locate library.
    find_library(SPDLOG_LIBRARY NAMES spdlog spdlogd
        HINTS ${SPDLOG_ROOT_DIR}/lib ${SPDLOG_ROOT_DIR}/lib64)

    find_package_handle_standard_args(Spdlog DEFAULT_MSG SPDLOG_INCLUDE_DIR SPDLOG_LIBRARY)
    MARK_AS_ADVANCED(SPDLOG_LIBRARY SPDLOG_INCLUDE_DIR)
endif()

# Add imported target.
if(SPDLOG_FOUND)
    set(SPDLOG_INCLUDE_DIRS "${SPDLOG_INCLUDE_DIR}")

    if(NOT SPDLOG_FIND_QUIETLY)
        message(STATUS "SPDLOG_INCLUDE_DIRS ........... ${SPDLOG_INCLUDE_DIR}")
        message(STATUS "SPDLOG_LIBRARY ................ ${SPDLOG_LIBRARY}")
    endif()

    if(NOT TARGET spdlog::spdlog)
        add_library(spdlog::spdlog UNKNOWN IMPORTED)
        set_target_properties(spdlog::spdlog PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${SPDLOG_INCLUDE_DIRS}")

        set_property(TARGET spdlog::spdlog APPEND PROPERTY
            IMPORTED_LOCATION "${SPDLOG_LIBRARY}")
    endif()
endif()
