EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Pizza Time",
    EffectId = "peds_setintopizzaboys", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
end

function OnStop()
    SetSurroundingPedsInVehicles(GET_HASH_KEY("pizzaboy"), 250)
end

function OnTick()
end

