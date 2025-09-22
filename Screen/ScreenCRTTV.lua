EffectInfo = { 
    Name = "CRT TV",
    EffectId = "screen_crttv",
    TimedType = "Short",
    EffectGroup = "_group_shader",
    EffectCategory = "Shader"

}

function OnStart()
end

function OnStop()
    CLEAR_TIMECYCLE_MODIFIER()
end

function OnTick()
    if GET_TIMECYCLE_MODIFIER_INDEX() == -1 then
        SET_TIMECYCLE_MODIFIER("Broken_camera_fuzz")
        SET_TIMECYCLE_MODIFIER_STRENGTH(0.7)
    end
end
