EffectInfo = { 
    Name = "Guess im walking then",
    EffectId = "player_cantusevehicles",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
    for _, vehicle in ipairs(GetAllVehicles()) do
        SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, true)
        SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, false)
    end
end

function OnTick()
    playerPed = PLAYER_PED_ID()
    for _, vehicle in ipairs(GetAllVehicles()) do
        SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, false)
        SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
    end

    if IS_PED_SITTING_IN_ANY_VEHICLE(playerPed, false) then
        playerVeh = GET_VEHICLE_PED_IS_USING(playerPed)
        TASK_LEAVE_VEHICLE(playerPed, playerVeh, 16)
    end

    WAIT(750)
end
