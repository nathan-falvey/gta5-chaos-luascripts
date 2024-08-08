EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Blizzard",
    EffectId = "misc_blizzard", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
    SetSnowState(false)
    SET_WEATHER_TYPE_NOW("CLEAR")
end
function OnTick()
    SetSnowState(true)
    SET_WEATHER_TYPE_NOW("BLIZZARD")
end