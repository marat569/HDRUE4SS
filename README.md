# HDRUE4SS
Enables Unreal Engine Native HDR with the power of UE4SS

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

! For stability, I highly suggest going into `UE4SS-settings.ini` and setting `bUseUObjectArrayCache` to `false`
  `bUseUObjectArrayCache = false`

- Best used with Ersh's reshade addon that fixs the UI, more on this later
