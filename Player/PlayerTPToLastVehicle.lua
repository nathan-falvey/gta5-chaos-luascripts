EffectInfo = { 
    Name = "Teleport to last used vehicle",
    EffectId = "player_tptolastveh",
    TimedType = "None",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
    playerPed = PLAYER_PED_ID()
    vehicle = GET_LAST_DRIVEN_VEHICLE()
    if DOES_ENTITY_EXIST(vehicle) and IS_PED_DEAD_OR_DYING(playerPed,0) then
        SET_PED_INTO_VEHICLE(playerPed, vehicle, -1)
    end
end

function OnStop()
end

function OnTick()
end
