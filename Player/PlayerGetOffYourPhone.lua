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
    if IS_PAUSE_MENU_ACTIVE() or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PLAYER_DEAD(PLAYER_ID()) or DOES_ENTITY_EXIST(playerPed) ~= true then return end
    CREATE_MOBILE_PHONE(0)
end
