# SatNav Voice - EN (TGT) v1.0.0

FH2 Mod Platform mod that replaces the English (`EN`) SatNav voice bank (`HZ2_DX_SatNav_EN.bank`, 122 lines) with a custom voice pack. It uses the universal `SatNavVoice.dll`, which loads every `SatNav\HZ2_DX_SatNav_XX.bank` it finds, so banks for several languages (for example EN and PL) can sit side by side.

113 of the 122 lines are replaced. The 9 "destination set" lines (autoshow, exhibition, festival, race, paint shop, workshop...) keep the stock game voice.

## Requirements

- Forza Horizon 2 (PC, game version 1.0.0.64 x64).
- FH2 Mod Platform v2.7.1 or newer.
- Game speech language set to **English**.
- About 35 MB of free disk space (the bank file).

## Install

Copy the contents of the `fh2-mods` folder (`SatNavVoice.dll`, `SatNavVoice.ini`, `SatNav\HZ2_DX_SatNav_EN.bank`) into the game's `fh2-mods` folder. The option **SatNavVoice** is under Pause > Settings > Mods (on by default; changing it needs a game restart). Its description, and the page **Loaded voice languages** under MODS > Installed mods, list the languages whose bank was loaded.
