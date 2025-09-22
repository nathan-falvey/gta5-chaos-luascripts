EffectInfo = { 
    Name = "Horn Bombs",
    EffectId = "vehs_hornbombs",
    TimedType = "Normal",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if IS_HORN_ACTIVE(vehicle) then
            EXPLODE_VEHICLE(vehicle,true,false)
        end
    end
end
