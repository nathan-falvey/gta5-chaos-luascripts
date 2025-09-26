EffectInfo = { 
    Name = "Freeze Clock Time",
    EffectId = "time_freezeclock",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
    PAUSE_CLOCK(false)
end

function OnTick()
    PAUSE_CLOCK(true)
end


