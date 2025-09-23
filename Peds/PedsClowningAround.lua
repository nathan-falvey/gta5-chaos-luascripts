EffectInfo = { 
    Name = "Clowning Around",
    EffectId = "peds_clowningaround",
    TimedType = "None",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "TrafficSpawner"

}

function OnStart()
    clownVanHash = GET_HASH_KEY("speedo2")
    SetSurroundingPedsInVehicles(clownVanHash, 0)

    playerPed = PLAYER_PED_ID()

    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0, 10, 0)
    heading = GET_ENTITY_HEADING(playerPed)
    van = CreateTempVehicle(clownVanHash, coords.x, coords.y, coords.z, heading)
    TASK_WARP_PED_INTO_VEHICLE(playerPed, van, -1)
end

function OnStop()
end

function OnTick()
end
