##############################################################
#                Getting The Git Revision                    # 
##############################################################
include(cmake/GetGitRevisionDescription.cmake)

get_git_head_revision(GIT_REFSPEC GIT_SHA)
string(SUBSTRING "${GIT_SHA}" 0 12 GIT_REV)
if(NOT GIT_SHA)
    set(GIT_REV "0")
endif()
##################################################################
#                  Simple Meta Data                              #
##################################################################
set(META_PROJECT_NAME    "DynamicWeatherEffects")
set(META_VERSION_MAJOR   "0")
set(META_VERSION_MINOR   "1")
set(META_VERSION_PATCH   "0")
set(META_VERSION_REVISION "${GIT_REV}")
set(META_VERSION         "${META_VERSION_MAJOR}.${META_VERSION_MINOR}.${META_VERSION_PATCH}")
set(META_NAME_VERSION    "${META_PROJECT_NAME} v${META_VERSION} revision(${META_VERSION_REVISION})")
set(META_REDEMPTION_SHA  "${GIT_REV}")

string (MAKE_C_IDENTIFIER ${META_PROJECT_NAME} META_PROJECT_ID)
string(TOUPPER ${META_PROJECT_ID} META_PROJECT_ID)