EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Snow Storm",
    EffectId = "weather_snowstorm", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
    EffectGroup = "_group_weatherchange",
    EffectCategory = "Shader"

}

function OnStart()
    SET_TIMECYCLE_MODIFIER("prologue_ending_fog")
end

function OnStop()
    SetSnowState(false)
    CLEAR_TIMECYCLE_MODIFIER()
    SET_WEATHER_TYPE_NOW("CLEAR")
end

function OnTick()
    SetSnowState(true)
    SET_WEATHER_TYPE_NOW("BLIZZARD")
end
