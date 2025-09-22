EffectInfo = { 
    Name = "Snow Storm",
    EffectId = "weather_snowstorm",
    TimedType = "Normal",
    EffectGroup = "_group_weatherchange",
    EffectCategory = "Shader"

}

function OnStart()
end

function OnStop()
    SetSnowState(false)
    SET_TIMECYCLE_MODIFIER_STRENGTH(1.0) -- reset the timecycle strength for any effects that require it but do not modify the strength by themselves. 
    CLEAR_TIMECYCLE_MODIFIER()
    SET_WEATHER_TYPE_NOW("CLEAR")
end

function OnTick()
    SetSnowState(true)
    SET_WEATHER_TYPE_NOW("BLIZZARD")
    SET_TIMECYCLE_MODIFIER("prologue_ending_fog")
    SET_TIMECYCLE_MODIFIER_STRENGTH(0.6)
end
