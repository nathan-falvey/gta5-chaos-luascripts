EffectInfo = { 
    Name = "Snow Storm",
    EffectId = "weather_snowstorm",
    TimedType = "Normal",
    EffectGroup = "_group_weatherchange",
    EffectCategory = "Shader",
    IncompatibleIds = {
        "world_snow"
    }

}

function OnStart()
    REQUEST_CLIP_SET("move_f@injured")
end

function OnStop()
    SetSnowState(false)
    SET_TIMECYCLE_MODIFIER_STRENGTH(1.0) -- reset the timecycle strength for any effects that require it but do not modify the strength by themselves. 
    CLEAR_TIMECYCLE_MODIFIER()
    SET_WEATHER_TYPE_NOW("CLEAR")
    USE_SNOW_FOOT_VFX_WHEN_UNSHELTERED(false)
end

function OnTick()
    SetSnowState(true)
    SET_WEATHER_TYPE_NOW("BLIZZARD")
    SET_TIMECYCLE_MODIFIER("prologue_ending_fog")
    SET_TIMECYCLE_MODIFIER_STRENGTH(0.6)
    for _, ped in ipairs(GetAllPeds()) do
        if ped ~= PLAYER_PED_ID() then
            SET_PED_MOVEMENT_CLIPSET(ped, "move_f@injured", 1.0)
        end
    end
    USE_SNOW_FOOT_VFX_WHEN_UNSHELTERED(true)
end
