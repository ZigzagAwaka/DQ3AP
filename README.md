# Dragon Quest III HD-2D Remake Archipelago

Dragon Quest III HD-2D Remake implementation for the [Archipelago multiworld randomizer](https://archipelago.gg/).

## Setup Guide

1. Make sure you have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7+ installed
2. Download the latest version of [DQ3AP](https://github.com/ZigzagAwaka/DQ3AP/releases)
3. Place `Game-WindowsNoEditor_P_DQ3AP.pak` in `Game/Content/Paks` in the game folder
4. Place `DQ3AP.asi`, `dsound.dll` and `libAPCpp.dll` in `Game/Binaries/Win64` in the game folder, next to the executable
5. For [generating a world](https://archipelago.gg/tutorial/Archipelago/setup_en#on-your-local-installation), place or install `dq3.apworld` in the `custom_worlds` folder of your Archipelago installation
6. For configuring your randomized game, select `Generate Template Options` in the Archipelago Launcher to create a `Dragon Quest III HD-2D Remake.yaml` that you can edit to your liking (make sure to have the apworld installed before doing this)

## Connecting to a hosted room

When the setup is finished, you can open the game on Steam to see a new separate DQ3AP console appearing alongside the game. Use it to connect to a room :

- Type `/connect <host> <player> [password]` into the console with valid parameters *(example: /connect archipelago.gg:12345 Player1)*
- You can connect anytime you want, before or after loading your game file. But make sure to be connected before checking a new location in the game !

## FAQ
### What does randomization do to this game ?

In Dragon Quest III HD-2D Remake, all obtainable items (usable items, equipment, gold, ...) are shuffled into the multiworld. From chests to barrels, pots, bookshelves and important NPC events, you'll have a great time figuring out a route to complete your goal !

### What is the goal of the game when randomized ?

The end goal of the randomizer is to defeat the final boss of the game.

*Planned : Configurable ways to edit the goal to instead be something else, like a medal hunt.*

### Which items can be in another player's world ?

All obtainable items can be placed in other players' worlds, except the World Map which is not randomized.

Items in shops and enemy drops are also not randomized but this may change in the future.

### What does another world's item look like in the game ?

Multiworld items appear as a mini medal sprite when you collect them.

*Planned : The sprite will be edited into a proper Archipelago sprite in a future release.*

### What versions of the game are supported ?

The only supported version is the Steam release of `Dragon Quest III HD-2D Remake`.

Also, as development for this integration was made on Windows, we don't know if it works well on other operating systems.

### When the player receives an item, what happens ?

The game will cache the received items then give them all to the player when one of the following events happens :

- The player enters/exits an area, dungeon, or village
- The player successfully defeats an enemy or a boss

*Planned : Some other ways to give items are being considered and will be work on in future releases.*

### Archipelago is all about playing with multiple worlds/players, but can I play in singleplayer ?

You can play in singleplayer by generating a world with only this game, then connect and play as usual.

As items are all remotely implemented for now, you will still find multiworld items and receive your own items as if someone else was giving it to you but besides that it's completely playable.

### What about saving ?

Make sure to always save the game before turning it off !

If you check a location then turn off the game without saving (or reloading a previous save) then the location will be available to check again but actually checking it will have no effect since it was already checked by the Archipelago server.

If you receive an item then turn off the game without saving (or reloading a previous save) then the item will be lost (use Archipelago server admin commands to get it back).

The game already perform some auto saves automatically when entering an area, so you can also reload the last auto save if you need it.

### Can I go back to previously explored areas ?

If you don't want to walk back to previous areas, then you can collect and use a Chimera Wing or level up and learn Zoom to warp to any previously explored areas. This is the same as in a regular non-randomized game.

### Is there a location tracker available ?

For this, you can use [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker).

### What other modifications are being made to the game ?

Other modifications were implemented to nicely integrate Archipelago :

- Major NPC (that gives an important item) will be available to speak with multiple times instead of just once so you'll not miss the check from this NPC. This has the effect of NPCs trying to give you their non randomized items multiple times but of course it's just for the visuals/cutscene, not for the real gameplay !
- Once the Ship is unlocked, it will spawn near Portoga but if you don't have access to it yet then you can use Zoom to teleport to a previously explored location and the ship will be teleported near you. *Planned: Maybe make it so the ship spawn near Aliahan?*

## Feedbacks and issues

You can report anything in the `Dragon Quest III HD-2D Remake` post in the `future-game-design` channel of the [Archipelago discord server](https://discord.gg/archipelago) or post a new issue on github.

## Useful ressources and special thanks

- [Guide and Walkthrough by FranckKnight](https://gamefaqs.gamespot.com/xbox-series-x/466974-dragon-quest-iii-hd-2d-remake/faqs/81601/introduction)
- [Game Interactive Maps by th3blackb3rry](https://gamefaqs.gamespot.com/pc/466975-dragon-quest-iii-hd-2d-remake/faqs)
- [APCpp Library: used by the client mod](https://github.com/N00byKing/APCpp)
- [@mike9k1: for useful modding advices](https://www.nexusmods.com/profile/mike9k1)
- [@seraphin_eveles: for good support](https://www.twitch.tv/seraphin_eveles)