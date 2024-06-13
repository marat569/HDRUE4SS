# HDR UE4SS
Enables Unreal Engine Native HDR via UE4SS

Disclaimer: The code is super scuffed, based on example code from the PCGW. Things "just work" :tm: , with plans for cleanup/optimization/merging both mods into one

Why use this instead of editing engine.ini?
Engine.ini ignores `r.HDR.Display.OutputDevice`, which is a critical cvar. It tells a shader what colorspace we're in -- HDR10 or scRGB. Without this script or manually changing the value with something like UUU; it will always default to a value of 5.
  - The issue with this is that 5 is the value for "scRGB", which Unreal Engine uses only when the game is running in DX11. If you play a DX12 game, there will be a colorspace missmatch, and everything will look off.

This mod sets all values to the correct value -- effectivly making all UE4 and UE5 games have Native HDR!



How to:
1) Get UE4SS -- https://github.com/UE4SS-RE/RE-UE4SS/releases

2) Extract UE4SS into the game's main folder, not the root folder!
  - In Sand Land's case, the folder would be: `\steamapps\common\SANDLAND\SANDLAND\Binaries\Win64`

3) Extract both mods into the "mods" folder

4) Edit mods.txt, and enable either `hdr-dx11` or `hdr-dx12` depending on the game's output api -- ONLY ENABLE ONE
   `hdr-dx11 : 1` is how you properly enable a mod

Done

----
- Added alternative `-2k` mods that use ACES 2000 (peak 2000 nits) -- which might result in better highlights.
  - Use a highlight compressor like lilium's tonemapper with bt2390 to compress 2k to your target peak luminance

! For stability, I highly suggest going into `UE4SS-settings.ini` and setting `bUseUObjectArrayCache` to `false`
  `bUseUObjectArrayCache = false`

- Best used with Ersh's reshade addon that fixs the UI, more on this later

----
**If you have issues with the UI and Framegeneration** : 

Open the main.lua file for the mod your using, so `hdr-dx12/scripts/main.lua`

and paste this line: `ExecCmd("r.Streamline.TagUIColorAlpha 0")` under `ExecCmd("r.HDR.UI.Level 1.0")` -- so it should look something like this below -- and save!:
![image](https://github.com/marat569/HDRUE4SS/assets/7017110/4b2a2e71-ab92-4be8-ac05-824b6e149e97)
