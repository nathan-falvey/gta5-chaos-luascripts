EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Downgrade Player's Vehicle",
    EffectId = "vehs_downgradeplayer", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
end

function OnStop()
    local playerVehicle = GET_VEHICLE_PED_IS_IN(playerPed)

    if playerVehicle then
        SET_VEHICLE_MOD_KIT(playerVehicle, 1)
        for i=0,50 do
            SET_VEHICLE_MOD(playerVehicle, i, -1, false)
            TOGGLE_VEHICLE_MOD(playerVehicle, i, false)
        end
    end
end

function OnTick()
end