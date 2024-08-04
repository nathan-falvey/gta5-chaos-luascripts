EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Downgrade All Vehicles",
    EffectId = "vehs_downgradeall", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
end

function OnStop()
    for _, vehicle in ipairs(GetAllVehicles()) do
        SET_VEHICLE_MOD_KIT(vehicle, 1)
        for i=0,50 do
            SET_VEHICLE_MOD(vehicle, i, -1, false)
            TOGGLE_VEHICLE_MOD(vehicle, i, false)
        end
    end
end

function OnTick()
end