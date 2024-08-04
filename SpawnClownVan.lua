EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "You are what you drive",
    EffectId = "veh_spawn_clown_van", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    local playerVehicle = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID())

    veh = CreateTempVehicleOnPlayerPos(GET_HASH_KEY("speedo2"), GET_ENTITY_HEADING(PLAYER_PED_ID()))
    if not playerVehicle then
        TASK_WARP_PED_INTO_VEHICLE(PLAYER_PED_ID(), veh, -1)
    end
end

function OnStop()
end

function OnTick()
end