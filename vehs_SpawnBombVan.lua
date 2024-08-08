EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Spawn Bomb Van",
    EffectId = "vehs_spawnbombvan", -- ScriptId for mod version < 2.0
    TimedType = "Short",
}

function OnStart()
    bomb_van_model = getRandomItem({'rumpo2', 'burrito4', 'pony', 'burrito'})
    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(),0, 10.0, 0)
    bomb_van = CreatePoolVehicle(GET_HASH_KEY(bomb_van_model), coords.x, coords.y, coords.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    SET_VEHICLE_LIVERY(bomb_van, math.random(-1, GET_VEHICLE_LIVERY(bomb_van)))
end

function OnStop()
    if DOES_ENTITY_EXIST(bomb_van) then
        EXPLODE_VEHICLE(bomb_van, true, false)
    end

end

function OnTick()
end


function getRandomItem(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
  end