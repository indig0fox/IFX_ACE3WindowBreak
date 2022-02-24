# IFX - ACE3 Window Break

## Purpose

Provide players a way to break a window on any building using ACE interaction as if done with a hammer, weapon stock, or gloved fist to both save ammo and minimize noise profile. Provide customization options to minimize interaction clutter and maximize consistent usability and preference.

Provide server owners and mission makers the ability to enforce consistency of the gameplay mechanics this introduces.

## CBA Settings

### Available Options

**Enable Interactions**
Enable or disable the clientside process which adds interactions as well as any existing actions on buildings. _(default true)_

**Interaction Distance**
How far away a player can be for actions to appear. _(default 2m)_

**Interaction Color**
What color the action icons will be. _(default White)_

**Break Sound Distance**
How far away the breaking glass can be heard. _(default 8m)_

**Enable on invincible buildings**
Enable/disable action use on editor-placed buildings that were marked as invincible (allowDamage false). _(default true)_

> Note: This setting requires the addon to be running on the server as well. If it isn't, this setting will be ignored and all buildings will be interactable.

### Admin Enforcement

The following can be added to a server-side or mission folder cba_settings file to enforce the defaults above:

```sqf
  // IFX - ACE3 Window Break
  force force ifx_ACE3WindowBreak_setting_enabled = true;
  force force ifx_ACE3WindowBreak_setting_interactionDistance = 2;
  ifx_ACE3WindowBreak_setting_color = [1,1,1]; // not forced
  force force ifx_ACE3WindowBreak_setting_audibleDistance = 8;
  force force ifx_ACE3WindowBreak_setting_allowInvincible = true;
```
