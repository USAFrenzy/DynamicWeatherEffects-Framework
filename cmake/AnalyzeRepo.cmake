#############################################################################
#      Get Latest Commit SHA On Master Branch Of Dynamic Weather Effects
#############################################################################
file(DOWNLOAD
    "https://api.github.com/repos/USAFrenzy/Redemption/commits/main"
    "${PROJECT_BINARY_DIR}/DynamicWeatherEffects-Framework.github.data"
)
file(READ
    "${PROJECT_BINARY_DIR}/DynamicWeatherEffects-Framework.github.data"
    DWE_INFO
)
##############################################################################
# Match A Regex Pattern From DWE_INFO And Set That To DWE_SHA  
# Then Search DWE_SHA And Take The 8th-40th Values And Set That As The DWE_SHA
##############################################################################
string(REGEX MATCH
    "\"sha\": \"([0-9a-f]+)\","
    DWE_SHA
    ${DWE_INFO}
)
string(SUBSTRING
    ${DWE_SHA}
    8
    48
    DWE_SHA
)
#########################################################################################################
#      Get latest Commit On The DWE Repository - APPLIED_DWE_SHA Can Be Set By Parent Script  
#########################################################################################################
if(NOT APPLIED_DWE_SHA)
    set(APPLIED_DWE_SHA "")
endif ()
if("${APPLIED_DWE_SHA}" STREQUAL "")
    message(WARNING
        "No Dyanamic Weather Effects Version Detected, Was Unable To Verify If Up To Date. "
        "Set The Version By Defining META_REDEMPTION_SHA."
    )
    return()
endif()
    if (${APPLIED_REDEMPTION_SHA} STREQUAL ${REDEMPTION_SHA})
        message(STATUS "Dynamic Weather Effects Is Up-To-Date (${DWE_SHA})")
    else()
        message(STATUS "Dyanamic Weather Effects Needs To Be Updated https://github.com/USAFrenzy/DynamicWeatherEffects-Framework/compare/${APPLIED_DWE_SHA}...main")
    endif()