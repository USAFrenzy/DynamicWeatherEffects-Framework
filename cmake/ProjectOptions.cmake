#############################################################################################################
#                                    Project Options                                                        #
#############################################################################################################
option(ENABLE_TESTING                      "Enable Test Builds"                                       ON)
option(ENABLE_FUZZ_TESTS                   "Enable Fuzz Testing Builds"                               OFF)
option(ENABLE_CPPCHECK                     "Enable The Use Of cppcheck To Analyze Code Base"          OFF)
option(ENABLE_IPO                          "Enable Interprocedural Optimization (LTO)"                OFF)
option(ENABLE_CACHE                        "Enable Cache If Available"                                ON)
option(ENABLE_CPPCHECK                     "Enable Static Analysis With cppcheck"                     OFF)
option(ENABLE_CLANG_TIDY                   "Enable Static Analysis With clang-tidy"                   OFF)
option(ENABLE_INCLUDE_WHAT_YOU_USE         "Enable Static Analysis With include-what-you-use"         OFF)
option(WARNINGS_AS_ERRORS                  "Treat compiler warnings as errors"                        OFF)
option(ENABLE_SANITIZER_ADDRESS            "Enable address sanitizer"                                 FALSE)
option(ENABLE_SANITIZER_LEAK               "Enable leak sanitizer"                                    FALSE)
option(ENABLE_SANITIZER_THREAD             "Enable thread sanitizer"                                  FALSE)
option(ENABLE_SANITIZER_MEMORY             "Enable memory sanitizer"                                  FALSE)
option(ENABLE_SANITIZER_UNDEFINED_BEHAVIOR "Enable undefined behavior sanitizer"                      FALSE)
option(ENABLE_COVERAGE                     "Enable coverage reporting for gcc/clang"                  FALSE)
######################################## ADD MORE HERE IN THE FUTURE #######################################
