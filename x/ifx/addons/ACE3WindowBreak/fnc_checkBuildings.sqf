#include "script_macros.hpp"
/* 
  Analyzes any editor placed objects to determine whether or not they're invincible.
  Run on server because those objects are server local at mission start.
  Apply a variable so clients can determine whether actions should be available or not based on setting.
*/
private _startTime = diag_tickTime;
private _buildingCount = ({
  private _building = _x;
  if (isNil {_building getVariable QGVAR(invincible)}) then {
    _building setVariable [QGVAR(invincible), isDamageAllowed _building, true];
  };
  true
} count ((allMissionObjects "Building") select {typeOf _x != "ACE_LogicDummy"}));

private _duration = diag_tickTime - _startTime;
diag_log text format["[%1] (%2) Server analyzed %3 buildings in %4 seconds", QUOTE(PREFIX), QUOTE(COMPONENT), _buildingCount, _duration];
missionNamespace setVariable [QGVAR(serverChecksDone), true, true];