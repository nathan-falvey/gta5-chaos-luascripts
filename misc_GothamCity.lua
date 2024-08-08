EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Gotham City",
    EffectId = "misc_gothamcity", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
    ADVANCE_CLOCK_TIME_TO(0,0,0)
    TeleportPlayer(-75.7, -818.62, 326.16, true)
end

function OnStop()
    CLEAR_TIMECYCLE_MODIFIER()
    SET_WEATHER_TYPE_NOW("CLEAR")
end

function OnTick()
    SET_WEATHER_TYPE_NOW("HALLOWEEN")
    SET_CLOCK_TIME(0,0,0)
    if GET_TIMECYCLE_TRANSITION_MODIFIER_INDEX() == -1 then
    SET_TRANSITION_TIMECYCLE_MODIFIER("dlc_island_vault", 10)
    end
end