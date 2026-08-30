## This document describes the compatibility of DQ3AP with other mods.

DQ3AP is mod that needs to be used on a game that stays as vanilla as possible. Other mods could work but it depends on how they were made and on how they affect the game.

For example, vanilla-friendly mods such as quality of life mods should be compatible. In general, all mods should work fine except those that edit the game's items and scenes/events.

This means that mods that modifies or add new items and those that add new content into the game are likely to not work alongside DQ3AP. Either these mods will not be loaded, or DQ3AP will stop working, depending on the specified mods.

## Any mods recommended to be installed for a great experience ?

Here is a small list of some mods that you can install to have a better experience playing DQ3AP. These mods have all been tested and confirmed working with DQ3AP.

- [Better Monster Rewards](https://www.nexusmods.com/dragonquest3remake/mods/17): to increase EXP and gold received from defeating monsters, making characters progression faster
- [Faster Overworld Traversal](https://www.nexusmods.com/dragonquest3remake/mods/14): to increase the movement speed of the player, the ship and Ramia
- [Skip Initial Logos](https://www.nexusmods.com/dragonquest3remake/mods/22): to launch the game faster
- [Passive Snoop and Nose for Treasure](https://www.nexusmods.com/dragonquest3remake/mods/52): to help you find the treasures hidden in towns and dungeons [is partially compatible, please check the note below!]

## Note about the "Passive Snoop and Nose for Treasure" mod

"Passive Snoop and Nose for Treasure" is a mod released by mike9k1 that makes it so the abilities/spells "Snoop" and "Nose for Treasure" are simplier to use. This mod comes with 2 files: `Game-WindowsNoEditor_P_Passive_Snoop_vX.Y.Z.pak` and `Passive_Nose_Treasure_vX.Y.Z.asi`, the first one managing the "Snoop" spell upgrade, and the other managing the "Nose for Treasure" ability upgrade.

The way this mod and DQ3AP were made makes it so they are not compatible but this only affects the file `Game-WindowsNoEditor_P_Passive_Snoop_vX.Y.Z.pak`, meaning the other file is totally compatible. But what does it mean exactly ? You have 2 options.

- If you have the two mods installed: then the receiving of items in DQ3AP when using the spell "Peep" will not work! Which is fine because there is other ways to receive items as listed in the [README here](https://github.com/ZigzagAwaka/DQ3AP/blob/main/README.md#when-the-player-receives-an-item-what-happens-), but you will lose a pretty cool quality of life feature.

- If you want to keep the previously mentioned feature in DQ3AP then you need to manually delete the file `Game-WindowsNoEditor_P_Passive_Snoop_vX.Y.Z.pak`. Doing so will no longer highlight the treasures for an unlimited time when using "Snoop" and instead will revert to vanilla, which is a few seconds. But that's pretty much it, the other file of the mod can still be kept and it will work fine.

Anyways, it ultimately depends on your personal play style. Whether you prefer to have a longer treasure highlight for "Snoop" or to have a way to receive item from DQ3AP on demand with "Peep".