EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "You Called For A Cab?",
    EffectId = "misc_spawntaxidriver", -- ScriptId for mod version < 2.0
    TimedType = "None",
}



-- this code was adapted from 'Jesus Take The Wheel'

function OnStart()
    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), false) then
        entity = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false)
    else 
        entity = PLAYER_PED_ID()
    end

    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, 0, 20.0, 0.0)
    taxi = CreateTempVehicleOnPlayerPos(GET_HASH_KEY('taxi'), GET_ENTITY_HEADING(entity))
    SET_ENTITY_COORDS(taxi, coords.x, coords.y, coords.z, 1, 0, 0, 0)
    WAIT(200)
    -- After noticing a few buggy spawns, this simple if statement stops potential small rotten spawn bugs 
    if DOES_ENTITY_EXIST(taxi) then
        driver = CreatePoolPed(4, GET_HASH_KEY("a_m_y_cyclist_01"), coords.x, coords.y, coords.z+50, GET_ENTITY_HEADING(entity))
        SET_PED_INTO_VEHICLE(driver, taxi, -1)
        if DOES_ENTITY_EXIST(driver) then
            taxi_driver_group = Holder()
            ADD_RELATIONSHIP_GROUP("_TAXI_DRIVERS", taxi_driver_group)
            SET_RELATIONSHIP_BETWEEN_GROUPS(0, taxi_driver_group, GET_HASH_KEY("PLAYER"))
            SET_PED_RELATIONSHIP_GROUP_HASH(driver, taxi_driver_group)
            coords = 0
            if IS_WAYPOINT_ACTIVE() then
                coords = GET_BLIP_COORDS(GET_FIRST_BLIP_INFO_ID(8))
            else
                for i=0,3 do
                    if DOES_BLIP_EXIST(GET_FIRST_BLIP_INFO_ID(i)) then
                        coords = GET_BLIP_COORDS((GET_FIRST_BLIP_INFO_ID(i)))
                        break
                    end
                end
            end

            if coords == 0 then
                TASK_VEHICLE_DRIVE_WANDER(driver, taxi, 9999.0, 4176732)
            else
                TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(driver, taxi, coords.x, coords.y, coords.z, 9999.0, 262668, 0.0)
            end

            SET_PED_INTO_VEHICLE(PLAYER_PED_ID(), taxi, -2)
            SET_PED_KEEP_TASK(driver, true);
	        SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
        end
    end
end

function OnStop()
end

function OnTick()
end
