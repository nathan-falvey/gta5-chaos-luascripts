EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Stop!",
    EffectId = "misc_stop_player", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
end

function OnStop()
    local playerVehicle = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID())
    if playerVehicle then
        coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), 0,8,0)
    else
        coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), 0,5,0)
    end
    prop = CreatePoolProp(GET_HASH_KEY("prop_sign_road_01b"), coords.x, coords.y, coords.z, false)
    --SET_ENTITY_COORDS_NO_OFFSET(prop, coords.x, coords.y, coords.z, 0, 180, 0)
end

function OnTick()
end