EffectInfo = { 
    Name = "Blindness",
    EffectId = "screen_blindness",
    TimedType = "Short",
    EffectGroup = "_group_shader",
    EffectCategory = "Shader",

}

function OnStart()
end

function OnStop()
end

function OnTick()
    DRAW_RECT(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)
end
