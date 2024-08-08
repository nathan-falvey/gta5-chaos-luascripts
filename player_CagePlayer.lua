EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Cage Player",
    EffectId = "misc_cage_player", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
end

function OnStop()
    local playerVehicle = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID())

    if playerVehicle then
        CLEAR_PED_TASKS_IMMEDIATELY()
    end
    local playerCoords = GET_ENTITY_COORDS(PLAYER_PED_ID())
    CreatePoolProp(GET_HASH_KEY("prop_dog_cage_02"), playerCoords.x, playerCoords.y, playerCoords.z, false)
end

function OnTick()
end