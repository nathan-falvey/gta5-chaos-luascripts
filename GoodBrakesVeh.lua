EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Extremely Effective Brakes",
    EffectId = "vehs_goodbrakes", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
    IncompatibleIds = {
        "veh_brakeboost"
    }
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if IsVehicleBraking(vehicle) then
            BRING_VEHICLE_TO_HALT(vehicle, 0, 0, true)
        end
    end
end