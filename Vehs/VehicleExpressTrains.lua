EffectInfo = { 
    Name = "Express Trains",
    EffectId = "vehs_expresstrains",
    TimedType = "Normal",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
end

function OnTick()
    SET_RANDOM_TRAINS(true)
    for _, vehicle in ipairs(GetAllVehicles()) do
        if GET_VEHICLE_CLASS(vehicle) == 21 then
            SET_TRAIN_SPEED(vehicle, 9999.0)
        end
    end
    WAIT(750)

end
