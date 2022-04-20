/*
  Author: IndigoFox
  Contact: Indigo#6290 on Discord

  Required Mods:
    - CBA
    - ACE3 (ace_interact_menu)

  Description:
    Players will see an ACE action on the windows of all buildings that will allow them to break the glass, bypassing the need to shoot them out.

  Notes:
    This script runs on a player's local machine.
    Every 10 seconds, it will gather all buildings in a 125 meter radius and add an ACE action for the player which allows them to break any windows on that building, based on "glass" hitPoints of that building's model.
    A player-only variable is saved on a building once it's processed, to avoid re-processing and save time on cycles.
    This procedure runs in the scheduled environment to not cost frames, and is very light to begin with.
    Because models are made differently by different devs, the exact position of the interaction relative to the window's center will vary.

  Installation:
    Add this file to initPlayerLocal.sqf, or any client-side init scripts you already use.

  Copyright 2022 IndigoFox

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
#include "script_macros.hpp"

if (!hasInterface) exitWith {};
if (!isNil QGVAR(PFHObject)) then {
  [GVAR(PFHObject)] call CBA_fnc_deletePerFrameHandlerObject;
  GVAR(PFHObject) = nil;
};

GVAR(PFHObject) = [
  {
    if (!isNil QGVAR(subroutine)) then {
      if (!scriptDone GVAR(subroutine)) exitWith {};
    };

    GVAR(subroutine) = [] spawn {
      private _buildings = player nearObjects ["Building", 125];

      {
        private _building = _x;
        if (isNull _building) then {continue};
        if (_building getVariable [QGVAR(registered), false]) then {continue};

        _selections = (_building selectionNames "HitPoints") select {_x find "glass" > -1};
        {
          private _selection = _x;
          private _helperPos = AGLtoASL (_building modelToWorld (selectionPosition [_building, _x, (allLODs _building) findIf {_x#1 == "hitpoints"}, false, "AveragePoint"]));
          private _helperObject = "ACE_LogicDummy" createVehicleLocal [0,0,0];
          _helperObject setPosASL _helperPos;

          private _breakWindowAction = [
            "Break_Window",
            "Break Window",
            ["", GVAR(setting_color) call BIS_fnc_colorRGBtoHTML],
            {
              params ["_target", "_player", "_params"];
              _params params ["_building", "_selectionName"];
              playSound3D ["a3\sounds_f\weapons\hits\glass_1.wss", objNull, false, getPosASL _player, 1.5, 1, 10];
              [_building, [_selectionName, 1, true, _player]] remoteExecCall ["setHit", 0];
            }, // statement
            {
              params ["_target", "_player", "_params"];
              _params params ["_building", "_selectionName"];
              if (!GVAR(setting_allowInvincible) && _building getVariable [QGVAR(invincible), false]) exitWith {false};
              (_building getHit _selectionName) < 1 && GVAR(setting_enabled)
              // true;
            }, // condition
            {}, // child code
            [_building, _selection], // params
            [0,0,0], // position
            GVAR(setting_interactionDistance), // distance
            //[showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] // special params
            [false, true, true, false, true]
          ] call ace_interact_menu_fnc_createAction;

          // [typeOf _building, 0, [], _breakWindowAction] call ace_interact_menu_fnc_addActionToClass;
          [_helperObject, 0, [], _breakWindowAction] call ace_interact_menu_fnc_addActionToObject;

        } forEach _selections;

        _building setVariable [QGVAR(registered), true];
        (GVAR(namespace) getVariable "buildingsRegistered") pushBack _building;
        // hintSilent format["%1 buildings are ready", count (GVAR(namespace) getVariable "buildingsRegistered")];
      } forEach _buildings;
    };
  },
  15, // delay
  [], // args
  {}, // code, executed when added
  {}, // code, executed when removed
  {GVAR(setting_enabled)}, // if true, execute PFH cycle
  {false} // if true, delete object
] call CBA_fnc_createPerFrameHandlerObject;