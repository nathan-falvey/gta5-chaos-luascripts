EffectInfo = { 
    Name = "Spawn Slow Down Pad",
    EffectId = "misc_spawnslowdownpad",
    TimedType = "None",
    HideRealNameOnStart = true,
}

function OnStart()
    OverrideEffectName('Slow Down!')

    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), false) then
        entity = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false)
    else 
        entity = PLAYER_PED_ID()
    end

    pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, 0, 10.0, 1.0)
    slowdown = CreatePoolProp(GET_HASH_KEY('stt_prop_track_slowdown_t1'), pos.x, pos.y, pos.z, false)
    PLACE_OBJECT_ON_GROUND_PROPERLY(slowdown)
    SET_ENTITY_HEADING(slowdown, PLAYER_PED_ID() - 180) -- specifying an entity does not matter here, as more often than not, the player will follow a vehicles heading and vice versa
    SET_ENTITY_ROTATION(slowdown, GET_ENTITY_PITCH(PLAYER_PED_ID()), -GET_ENTITY_ROLL(PLAYER_PED_ID()),
    GET_ENTITY_HEADING(PLAYER_PED_ID())-90, 0, true)
    WAIT(3000)
end

function OnStop()
end

function OnTick()
end


function IS_PED_A_DRIVER(ped)
    return IS_PED_IN_ANY_VEHICLE(ped, false) and GET_PED_IN_VEHICLE_SEAT(GET_VEHICLE_PED_IS_IN(ped, false), ped, -1)
end