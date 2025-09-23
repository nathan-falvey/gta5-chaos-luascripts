EffectInfo = { 
    Name = "3D Glasses",
    EffectId = "screen_threedeeglasses",
    TimedType = "Normal",
    EffectGroup = "_group_shader",
    EffectCategory = "Shader",

}

function OnStart()
end

function OnStop()
end

function OnTick()
    DRAW_RECT(1.0, 0.5, 1.0, 1.0, 0, 0, 255, 168)
    DRAW_RECT(0.0, 0.5, 1.0, 1.0, 255, 0, 0, 168)
end
