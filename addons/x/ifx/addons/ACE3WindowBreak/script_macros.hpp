#define PREFIX IFX
#define COMPONENT ACE3WindowBreak
#define COMPONENT_BEAUTIFIED ACE3 Window Break

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(IFX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(IFX - COMPONENT)
#endif

#define VERSION 1.0
#define VERSION_STR 1.0.0
#define VERSION_AR 1,0,0

// #define DEBUG_MODE_NORMAL
// #define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"