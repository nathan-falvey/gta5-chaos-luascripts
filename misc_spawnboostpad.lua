EffectInfo = { 
    Name = "Spawn Boost Pad",
    EffectId = "misc_spawnboostpad",
    TimedType = "None",
}

function OnStart()

    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), false) then
        entity = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false)
    else 
        entity = PLAYER_PED_ID()
    end

    pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, 0, 10.0, 0.7)
    booster = CreatePoolProp(GET_HASH_KEY('stt_prop_track_speedup_t2'), pos.x, pos.y, pos.z, false)
    PLACE_OBJECT_ON_GROUND_PROPERLY(booster)
    SET_ENTITY_ROTATION(booster, GET_ENTITY_PITCH(PLAYER_PED_ID()), -GET_ENTITY_ROLL(PLAYER_PED_ID()),
    GET_ENTITY_HEADING(PLAYER_PED_ID())+90, 0, true)
end

function OnStop()
end

function OnTick()
end

