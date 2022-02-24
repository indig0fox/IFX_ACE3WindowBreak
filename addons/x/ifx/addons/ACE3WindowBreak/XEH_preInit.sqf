#include "script_macros.hpp"
#include "XEH_prep.sqf"

[
  QGVAR(setting_enabled), 
  "CHECKBOX", // setting type
  [
    "Enable Interactions", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Enable/Disable interactions & polling of buildings to create them."
  ],
  [COMPONENT_NAME, "Core"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  true, // default enabled
  false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {}, // function that will be executed once on mission start and every time the setting is changed.
  false // requires restart to apply
] call CBA_fnc_addSetting;

[
  QGVAR(setting_color), 
  "COLOR", // setting type
  [
    "Interaction Color", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Adjust the color of interactions"
  ],
  [COMPONENT_NAME, "Preferences"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [1,1,1], // default white
  false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {}, // function that will be executed once on mission start and every time the setting is changed.
  true // requires restart to apply
] call CBA_fnc_addSetting;

[
  QGVAR(setting_interactionDistance), 
  "SLIDER", // setting type
  [
    "Interaction Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Distance from interaction points at which they'll appear and be usable"
  ],
  [COMPONENT_NAME, "Game Mechanics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [
      1.5, // min
      3, // max
      2, // default
      1, // trailing decimals
      false // percentage
  ], // data for this setting: [min, max, default, number of shown trailing decimals]
  false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {}, // function that will be executed once on mission start and every time the setting is changed.
  true // requires restart to apply
] call CBA_fnc_addSetting;

[
  QGVAR(setting_audibleDistance), 
  "SLIDER", // setting type
  [
    "Break Sound Range", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Max range from source at which the breaking glass will be heard"
  ],
  [COMPONENT_NAME, "Game Mechanics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [
      5, // min
      20, // max
      8, // default
      1, // trailing decimals
      false // percentage
  ], // data for this setting: [min, max, default, number of shown trailing decimals]
  false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {}, // function that will be executed once on mission start and every time the setting is changed.
  true // requires restart to apply
] call CBA_fnc_addSetting;

[
  QGVAR(setting_allowInvincible), 
  "CHECKBOX", // setting type
  [
    "Enable on Invincible Buildings", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Enable/Disable interactions on buildings set to be invincible."
  ],
  [COMPONENT_NAME, "Game Mechanics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
  true, // default enabled
  false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {}, // function that will be executed once on mission start and every time the setting is changed.
  true // requires restart to apply
] call CBA_fnc_addSetting;


ADDON = true;