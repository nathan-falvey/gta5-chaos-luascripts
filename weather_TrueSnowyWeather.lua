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
    CLEAR_TIMECYCLE_MODIFIER()
end
function OnTick()
    SetSnowState(true)
    SET_WEATHER_TYPE_NOW("BLIZZARD")
    if GET_TIMECYCLE_TRANSITION_MODIFIER_INDEX() == -1 then
        SET_TRANSITION_TIMECYCLE_MODIFIER("prologue_ending_fog", 0)
        SET_TRANSITION_TIMECYCLE_MODIFIER(0.5)
    end
end