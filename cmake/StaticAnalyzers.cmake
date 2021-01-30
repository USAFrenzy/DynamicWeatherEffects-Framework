if(ENABLE_CPPCHECK)
  find_program(CPPCHECK cppcheck)
  if(CPPCHECK)
    set(CMAKE_CXX_CPPCHECK
        ${CPPCHECK}
        --suppress=missingInclude
        --enable=all
        --inline-suppr
        --inconclusive
        -i
      )
  else()
    message(SEND_ERROR "cppcheck Was Not Found - Make Sure It Is Installed And Included In Your Path Or Manually Set CMAKE_CXX_CPPCHECK")
  endif()
endif()

if(ENABLE_CLANG_TIDY)
  find_program(CLANGTIDY clang-tidy)
  if(CLANGTIDY)
    set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option)
  else()
    message(SEND_ERROR "clang-tidy Was Not Found - Make Sure It Is Installed And Included In Your Path Or Manually Set CMAKE_CXX_CLANG_TIDY")
  endif()
endif()

if(ENABLE_INCLUDE_WHAT_YOU_USE)
  find_program(INCLUDE_WHAT_YOU_USE include-what-you-use)
  if(INCLUDE_WHAT_YOU_USE)
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE})
  else()
    message(SEND_ERROR "include-what-you-use Was Not Found - Make Sure It Is Installed And Included In Your Path Or Manually Set CMAKE_CXX_INCLUDE_WHAT_YOU_USE")
  endif()
endif()



#####################################################################
#      Function to register a target for enabled checks      
#####################################################################
include(${CMAKE_CURRENT_LIST_DIR}/Cppcheck.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ClangTidy.cmake)

function(StaticAnalyze target)
    if(NOT TARGET StaticAnalysis)
        add_custom_target(StaticAnalysis)
          set_target_properties(StaticAnalysis
            PROPERTIES
            FOLDER "Checks/Analysis Output"
            EXCLUDE_FROM_DEFAULT_BUILD 1
          )
    endif()
        add_custom_target(${target}-AnalysisCheck)
            set_target_properties(${target}-AnalysisCheck
            PROPERTIES
            FOLDER "Checks/Analysis Output"
            EXCLUDE_FROM_DEFAULT_BUILD 1
            )
endfunction()
#####################################################################
#     Configure cmake target to check for updates        
#####################################################################
function(Analyze_Repo Current_Repo_Sha)
    add_custom_target(
        AnalyzeRepo
        COMMAND ${CMAKE_COMMAND}
            -DPROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}
            -DPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}
            -DAPPLIED_REDEMPTION_SHA=${Current_Repo_Sha}
            -P ${PROJECT_SOURCE_DIR}/cmake/AnalyzeRepo.cmake
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    )
    set_target_properties(AnalyzeRepo
        PROPERTIES
        FOLDER "Maintenance/Repo Output"
        EXCLUDE_FROM_DEFAULT_BUILD 1
    )
endfunction()