EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Euro Truck Simulator",
    EffectId = "misc_spawntruck", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    EnableScriptThreadBlock()
    TeleportPlayer(-2273.0342, 4224.4517, 42.63149, true)
    local playerVehicle = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID())

    if playerVehicle then
        SET_ENTITY_AS_MISSION_ENTITY(playerVehicle)
        DELETE_ENTITY(Holder(playerVehicle))
    end


    
    truck_model = getRandomItem({'phantom', 'packer'})
    truck = CreatePoolVehicle(GET_HASH_KEY(truck_model), -2273.0342, 4224.4517, 42.63149, 145)
    SET_FOLLOW_VEHICLE_CAM_VIEW_MODE(4)
    TASK_WARP_PED_INTO_VEHICLE(PLAYER_PED_ID(), truck, -1)
    trailer_model = getRandomItem({
        "armytanker",
        "armytrailer",
        "armytrailer2",
        "docktrailer",
        "freighttrailer",
        "tr2",
        "tr3",
        "tr4",
        "trflat",
        "tanker",
        "tanker2",
        "tvtrailer",
        "trailerlogs",
        "trailers",
        "trailers2",
        "trailers3"
      })
    
    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(truck, 0, 50, 0)
    trailer = CreatePoolVehicle(GET_HASH_KEY(trailer_model), coords.x, coords.y, coords.z, 145)
    ATTACH_VEHICLE_TO_TRAILER(truck, trailer,  1065353216)
    DisableScriptThreadBlock()


end

function OnStop()
end


function getRandomItem(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
  end