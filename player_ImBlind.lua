EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "POV: You're a blind person",
    EffectId = "player_isblind", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
    IncompatibleIds = {
        "player_rgboverlay"
    }
}

function OnStart()
end

function OnStop()
end

function OnTick()
    DRAW_RECT(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)
end