EffectInfo = { 
    Name = "CRT Television",
    EffectId = "misc_crttv",
    TimedType = "Short",
}

function OnStart()
end

function OnStop()
    CLEAR_TIMECYCLE_MODIFIER()
end

function OnTick()
    if GET_TIMECYCLE_TRANSITION_MODIFIER_INDEX() == -1 then
        SET_TRANSITION_TIMECYCLE_MODIFIER("Broken_camera_fuzz", 0.0)
        SET_TRANSITION_TIMECYCLE_MODIFIER(0.5)
    end
end
