#######################################################################
#             Provided By Jason Turner - Ammended                     #
#######################################################################

#################################################################################
# Sets A Build Type If There Was None Specified To CMake                        #
#################################################################################
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE
      RelWithDebInfo
      CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui, ccmake
  set_property(
    CACHE CMAKE_BUILD_TYPE
    PROPERTY STRINGS
             "Debug"
             "Release"
             "MinSizeRel"
             "RelWithDebInfo")
endif()
###################################################################################
# Generate compile_commands.json to make it easier to work with clang based tools #
###################################################################################
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    if(ENABLE_IPO)
      include(CheckIPOSupported)
        check_ipo_supported(
        RESULT
        result
        OUTPUT
        output)
      if(result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
      else()
        message(SEND_ERROR "IPO is not supported: ${output}")
      endif()
  endif()

######################################################################
#      Some More Project options - May Or May Not Keep These         #
######################################################################
set(DEFAULT_PROJECT_OPTIONS
    DEBUG_POSTFIX             "d"
    CXX_STANDARD              20 
    LINKER_LANGUAGE           "CXX"
    POSITION_INDEPENDENT_CODE ON
    CXX_VISIBILITY_PRESET     "hidden"
    CXX_EXTENSIONS            Off
)

#####################################################################################
#                    Use pthreads on mingw and linux                                #
#####################################################################################
if("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU" OR "${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
    set(DEFAULT_LINKER_OPTIONS
        PUBLIC
            ${DEFAULT_LINKER_OPTIONS}
            -pthread
    )
    if (${OPTION_COVERAGE_ENABLED})
        set(DEFAULT_LINKER_OPTIONS
            PUBLIC
                ${DEFAULT_LINKER_OPTIONS}
                -fprofile-arcs
                -ftest-coverage
        )
    endif ()
endif()