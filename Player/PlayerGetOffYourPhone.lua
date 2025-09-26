EffectInfo = { 
    Name = "Get Off Your Phone",
    EffectId = "player_getoffyourphone",
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
    if not DOES_ENTITY_EXIST(playerPed) or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PED_DEAD_OR_DYING(playerPed,0) then return end
    if not IS_PED_RUNNING_MOBILE_PHONE_TASK(playerPed) then
        TASK_USE_MOBILE_PHONE_TIMED(playerPed, 60)
    end
end
