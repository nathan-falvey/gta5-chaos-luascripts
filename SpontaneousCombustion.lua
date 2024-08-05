EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Spontaneous Combustion",
    EffectId = "player_randomlysetonfirelol", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    random_num = math.random(0, 6000)
    if random_num == 49 then
        local playerVehicle = GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID())

        if playerVehicle and IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), false) then
            SET_VEHICLE_ENGINE_HEALTH(playerVehicle, -1.0)
            SET_VEHICLE_PETROL_TANK_HEALTH(playerVehicle, -1.0)
            SET_VEHICLE_BODY_HEALTH(playerVehicle, -1.0)
        end

        START_ENTITY_FIRE(PLAYER_PED_ID())

        WAIT(3000)
    end
end