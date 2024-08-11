EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Do You Want A Taco????",
    EffectId = "veh_spawntacotrucks", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    for i=0,5 do
        coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), randomFloatInRange(-25.0, 25.0), randomFloatInRange(-25.0, 25.0), 0)
        truck = CreateTempVehicleOnPlayerPos(GET_HASH_KEY("taco"), GET_ENTITY_HEADING(PLAYER_PED_ID()))
        SET_ENTITY_COORDS(truck, coords.x, coords.y, coords.z, 1, 0, 0, 0)
        CREATE_PED_INSIDE_VEHICLE(truck, 4, GET_HASH_KEY("u_m_y_mani"), -1, true, false)
    end
end

function OnStop()
end

function OnTick()
end

function randomFloatInRange(min, max)
    return math.random() * (max - min) + min
  end
