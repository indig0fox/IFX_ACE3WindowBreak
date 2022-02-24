#include "script_macros.hpp"

class CfgPatches
{
  class ADDON
  {
    // Meta information for editor
    name = COMPONENT_NAME;
    author = "IndigoFox";
    authors[] = {"IndigoFox"};
    url = "https://github.com/indig0fox";

    requiredVersion = 2.06;
    VERSION_CONFIG;

    // Required addons, used for setting load order.
    // When any of the addons is missing, pop-up warning will appear when launching the game.
    requiredAddons[] = {"CBA_main", "ace_interact_menu"};
    // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups) unlocking.
    units[] = {};
    // List of weapons (CfgWeapons classes) contained in the addon.
    weapons[] = {};
  };
};

// class CfgFunctions {
//   class IFX {
//     class functions {
//       file = "IFX_ACE3WindowBreak\functions";
//       class startRegisterLoop {
//         postInit = 1;
//       };
//     };
//   };
// };


class Extended_PreInit_EventHandlers {
  class ADDON {
    // This will be executed once in 3DEN, main menu and before briefing has started for every mission
    init = QUOTE( call COMPILE_FILE(XEH_preInit) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    // This will be executed once for each mission, once the mission has started
    init = QUOTE( call COMPILE_FILE(XEH_postInit) );
  };
};