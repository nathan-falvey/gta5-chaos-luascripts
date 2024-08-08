EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Do You Want A Taco????",
    EffectId = "veh_spawntacotrucks", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    for i=0,5 do
        CreateTempVehicleOnPlayerPos(GET_HASH_KEY("taco"), GET_ENTITY_HEADING(PLAYER_PED_ID()))
    end
end

function OnStop()
end

function OnTick()
end