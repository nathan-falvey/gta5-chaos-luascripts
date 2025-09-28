EffectInfo = { 
    Name = "Set Everyone Into Random Vehicle",
    EffectId = "peds_seteveryoneintorandom",
    HideRealNameOnStart = true, 
    TimedType = "None",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "TrafficSpawner"

}

function OnStart()
    vehicles = {}
    for _, model in ipairs(GetAllVehicleModels()) do
        table.insert(vehicles, model)
    end
    randomVehicle = random_choice(vehicles)
    vehicleHash = randomVehicle
    SetSurroundingPedsInVehicles(vehicleHash, 0)
end

function OnStop()
end

function OnTick()
end


function random_choice(p1)
    choice = p1[math.random(#p1)]
    return choice
end
