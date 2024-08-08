EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Loud Vehicle Radios",
    EffectId = "misc_loudradiovehicles", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, vehicle in ipairs(GetAllVehicles()) do
        SET_VEHICLE_RADIO_LOUD(vehicle, true)
    end
end