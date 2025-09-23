EffectInfo = { 
    Name = "Annoying RC Vehicle",
    EffectId = "player_annoyingrcvehicle",
    TimedType = "None",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
    rcModelHash = GET_HASH_KEY("rcbandito")
    driverModelHash = GET_HASH_KEY("A_M_Y_Skater_01")
    playerPed = PLAYER_PED_ID()
    heading = GET_ENTITY_HEADING(playerPed)
    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0, -75, 0)
    rc = CreatePoolVehicle(rcModelHash, coords.x, coords.y, coords.z, heading)
    driver = CreatePoolPed(1, driverModelHash, coords.x, coords.y, coords.z+50, heading)
    SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(PED_TO_NET(driver), true)
    SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(VEH_TO_NET(rc), true)
    SET_PED_INTO_VEHICLE(driver, rc, -1)
    SET_ENTITY_LOAD_COLLISION_FLAG(driver, true, 1)
    SET_ENTITY_INVINCIBLE(driver, true, false)
    SET_ENTITY_ALPHA(driver, 0, 0)
    SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, false)
    SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
    TASK_VEHICLE_MISSION_PED_TARGET(driver, rc, playerPed, 6, 500.0, 786988, 0.0, 0.0, true)
    SET_PED_CAN_BE_KNOCKED_OFF_VEHICLE(driver, 1)
    SET_MODEL_AS_NO_LONGER_NEEDED(rcModelHash)
    SET_MODEL_AS_NO_LONGER_NEEDED(driverModelHash)
end

function OnStop()
end

function OnTick()
end
