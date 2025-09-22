EffectInfo = { 
    Name = "Pizza Time",
    EffectId = "peds_pizzatime",
    TimedType = "None",
    EffectGroup = "_group_trafficspawner",
    EffectCategory = "TrafficSpawner"

}

function OnStart()
    bikeHash = GET_HASH_KEY("pizzaboy")
    SetSurroundingPedsInVehicles(bikeHash, 0)
end

function OnStop()
end

function OnTick()
end
