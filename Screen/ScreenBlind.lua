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
    playerPed = PLAYER_PED_ID()
    if not DOES_ENTITY_EXIST(playerPed) or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PED_DEAD_OR_DYING(playerPed,0) then return end
    DRAW_RECT(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)
end
