EffectInfo = { 
    Name = "Derail Trains",
    EffectId = "vehs_derailtrains",
    TimedType = "Normal",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "None"
    IncompatibleIds = {
        "vehs_expresstrains",
    }
}

function OnStart()
end

function OnStop()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if GET_VEHICLE_CLASS(vehicle) == 21 then
            SET_RENDER_TRAIN_AS_DERAILED(vehicle, false)
        end
    end
end

function OnTick()
    SET_RANDOM_TRAINS(true)
    for _, vehicle in ipairs(GetAllVehicles()) do
        if GET_VEHICLE_CLASS(vehicle) == 21 then
            SET_TRAIN_SPEED(vehicle, 0.0)
            SET_RENDER_TRAIN_AS_DERAILED(vehicle, true)
        end
    end
end
