# Give Bot Weapons Vscript Edition

Script that gives bots random weapons on spawn.

## Install

* Clone or download the repository.
* Move the contents of `tf2\givebotweapons\` to `Team Fortress 2\tf\scripts\vscripts`.
* (Optional) Delete the **README.md** from `Team Fortress 2\tf\scripts\vscripts`.

## Usage

Run `script_execute givebotweapons.nut` once per map.

## Compatibility

Should be compatible with most bots.    
Officially tested with TFBots and [NavBot](https://github.com/caxanga334/NavBot).

Bots may have difficulty using certain weapons.    
TFBots are the least compatible with non-stock weapons.    
This script automatically skips BLU team bots on Mann vs Machine game mode.

## Conflicts

This script's functions have a unique prefix to avoid conflicts with other scripts.
