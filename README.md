# HDRUE4SS
Enables Unreal Engine Native HDR with the power of UE4SS

This is still super scuffed, but its better than having to edit Engine.ini!

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
