EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Spawn Armoured Truck",
    EffectId = "veh_spawnarmouredtruck", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    if math.random(0, 100) == 20 then 
        model = "stockade2"
        driver_model ="u_m_y_proldriver_01"
    else
        model = "stockade"
        driver_model = "s_m_m_armoured_01"
    end
    player_coords = GET_ENTITY_COORDS(PLAYER_PED_ID(), true)
    road_coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), 0.0, -25.0, 0)
    truck = CreatePoolVehicle(GET_HASH_KEY(model), road_coords.x, road_coords.y, road_coords.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    if truck then
        SET_VEHICLE_ENGINE_ON(truck, true, true, false)
        SET_VEHICLE_DROPS_MONEY_WHEN_BLOWN_UP(truck, true)
        blip = ADD_BLIP_FOR_ENTITY(truck)
        SET_BLIP_SPRITE(blip, 67)
        DISPLAY_HELP_TEXT_THIS_FRAME('AMSECVAN_SHRTBP', false)
        SET_VEHICLE_ON_GROUND_PROPERLY(truck, 0)
    end
    truck_coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(truck, 0.0, 5.0, 0)
    driver = CreatePoolPed(4, GET_HASH_KEY(driver_model), truck_coords.x, truck_coords.y, truck_coords.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    if driver then
        SET_PED_RANDOM_COMPONENT_VARIATION(driver, 0)
        GIVE_WEAPON_TO_PED(driver, GET_HASH_KEY("weapon_carbinerifle"), 9000, false, true)
        SET_CURRENT_PED_WEAPON(driver, GET_HASH_KEY("weapon_carbinerifle"),true)
        TASK_WARP_PED_INTO_VEHICLE(driver, truck, -1)
        SET_PED_MONEY(driver, math.random(1000, 65000))
        TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(driver, truck, -80.6275, -679.82935, 34.054443, 9999.0, 786603, 0)
        SET_PED_KEEP_TASK(driver, true)
        SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
    end
end

function OnStop()
end

function OnTick()
end

function randomFloatInRange(min, max)
    return math.random() * (max - min) + min
  end
  