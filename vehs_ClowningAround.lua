EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Clowning Around",
    EffectId = "peds_putinclownvans", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()

    for i=1, math.random(9)
    do
        coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), randomFloatInRange(-75.0, 75.0), randomFloatInRange(-50.0, 50.0), randomFloatInRange(5.0, 35.0))
        CreatePoolPed(4, GET_HASH_KEY("s_m_y_clown_01"), coords.x, coords.y, coords.z,  GET_ENTITY_HEADING(PLAYER_PED_ID()))
    end

    SetSurroundingPedsInVehicles(GET_HASH_KEY("speedo2"), 500)
    SET_AGGRESSIVE_HORNS(true)
    for _,ped in ipairs(GetAllPeds()) do
        if ped ~= PLAYER_PED_ID() then
            SET_DRIVER_AGGRESSIVENESS(ped, true)
        end
    end
end

function OnStop()
end


function randomFloatInRange(min, max)
    return math.random() * (max - min) + min
  end
  