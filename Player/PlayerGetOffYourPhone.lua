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
    if IS_MOBILE_PHONE_CALL_ONGOING() then return end
    DESTROY_MOBILE_PHONE()
end

function OnTick()
    playerPed = PLAYER_PED_ID()
    if not DOES_ENTITY_EXIST(playerPed) or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PED_DEAD_OR_DYING(playerPed,0) then return end
    phoneType = 0
    if IS_PED_MODEL(playerPed, GET_HASH_KEY("player_two")) then
        phoneType = 1
    end

    if IS_PED_MODEL(playerPed, GET_HASH_KEY("player_one")) then
        phoneType = 2
    end

    CREATE_MOBILE_PHONE(phoneType)
end
