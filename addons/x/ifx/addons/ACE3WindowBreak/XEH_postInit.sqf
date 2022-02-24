#include "script_macros.hpp"

if (isServer) then {
  [] spawn FUNC(checkBuildings);
};

if (hasInterface) then {
  GVAR(namespace) = false call CBA_fnc_createNamespace;
  GVAR(namespace) setVariable ["buildingsRegistered", []];

  call FUNC(registerActionsLoop);

  [{
    // if server hasn't finished in 15 seconds from player postInit, then we'll assume server isn't running it and disable invincibility
    if (GVAR(setting_allowInvincible) && !(missionNamespace getVariable [QGVAR(serverChecksDone), false])) then {
      systemChat format[
        "[%1] (%2) Warning: Server not running addon -- invincibility checking on buildings is disabled and related restrictions will be ignored!",
        QUOTE(PREFIX),
        QUOTE(COMPONENT)
      ];
    };
  }, [], 30] call CBA_fnc_waitAndExecute;
};

ADDON = true;