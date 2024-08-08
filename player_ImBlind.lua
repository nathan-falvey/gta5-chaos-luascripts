EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "POV: You're a blind person",
    EffectId = "player_isblind", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
    CLEAR_TIMECYCLE_MODIFIER()
end

function OnTick()
    if GET_TIMECYCLE_TRANSITION_MODIFIER_INDEX() == -1 then
    SET_TRANSITION_TIMECYCLE_MODIFIER("glasses_blackout", 10)
    end
    DISABLE_CONTROL_ACTION(0, 199, true)
	DISABLE_CONTROL_ACTION(0, 200, true)
    HIDE_HUD_AND_RADAR_THIS_FRAME()
end