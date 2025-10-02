EffectInfo = { 
    Name = "Fast Hands",
    EffectId = "player_fasthands",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
end

function OnTick()
    playerPed = PLAYER_PED_ID()
    if GET_IS_TASK_ACTIVE(playerPed, 56) then
        FORCE_PED_AI_AND_ANIMATION_UPDATE(playerPed)
    end
end
