EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Sensitive Vehicles",
    EffectId = "vehs_sensitive", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
    IncompatibleIds = {
        "misc_gothamcity"
    }
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if HAS_ENTITY_COLLIDED_WITH_ANYTHING(vehicle) then
            if GET_VEHICLE_ENGINE_HEALTH(vehicle) > -1000 then
                SET_VEHICLE_ENGINE_HEALTH(vehicle,-1000)
            end
        end
    end
end