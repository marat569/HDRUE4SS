local UEHelpers = require("UEHelpers")

local GetKismetSystemLibrary = UEHelpers.GetKismetSystemLibrary

local ksl = GetKismetSystemLibrary()
local engine = FindFirstOf("Engine")

local canExecute = true
local init = false



--- @param cmd string
function ExecCmd(cmd)
	--- Life is better without this check
    --- if not ksl:IsValid() then
    ---     error("KismetSystemLibrary not valid\n")
    --- end

    ExecuteInGameThread(function()
        ksl:ExecuteConsoleCommand(
            engine,
            cmd,
            nil
        )
    end)
end

function Loop()
---  ExecCmd("r.AllowHDR 1")
---	 ExecCmd("r.HDR.EnableHDROutput 1")
---	 ExecCmd("r.HDR.Display.OutputDevice 3")
---	 ExecCmd("r.HDR.Display.ColorGamut 2")
---	 ExecCmd("r.HDR.UI.CompositeMode 1")
---	 ExecCmd("r.HDR.UI.Level 1.0")

	
end

function Init()
    if init then
        return
    end

    init = true

    ExecCmd("r.AllowHDR 1")
	ExecCmd("r.HDR.EnableHDROutput 1")
	ExecCmd("r.HDR.Display.OutputDevice 4")
	ExecCmd("r.HDR.Display.ColorGamut 2")
    ExecCmd("r.HDR.UI.CompositeMode 1")
	ExecCmd("r.HDR.UI.Level 1.0")

    LoopAsync(500, function()
        Loop()
        return false
    end)
end

function ExecuteDelayedFix()
    if not canExecute then
        return
    end

    Init()

    canExecute = false

    local delay = 50

    while delay < 500 do
        ExecuteWithDelay(delay, function()
            Loop()
            canExecute = true
        end)
        delay = delay * 2
    end
end

NotifyOnNewObject("/Script/Engine.Level", function()
    ExecuteDelayedFix()
end)
