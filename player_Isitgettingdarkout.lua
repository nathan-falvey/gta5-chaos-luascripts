EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Is It Getting Dark Out?",
    EffectId = "player_isitgettingdarkout", -- ScriptId for mod version < 2.0
    TimedType = "Custom",
    CustomTime = 300,
    IncompatibleIds = {
        "player_isblind",
        "player_isitgettingdarkout"
    }
}

function OnStart()
    start = GetTickCount()
    x = 0
    
end

function OnStop()
end

function OnTick()    
    if GetTickCount() > start + 1000 and x < 256 then
        x = x + 1
        start = GetTickCount()
    end
    DRAW_RECT(0.5, 0.5, 1.0, 1.0, 0, 0, 0, x)
end