EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Just Planes",
    EffectId = "vehs_changetoplane", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if IS_THIS_MODEL_A_PLANE(GET_ENTITY_MODEL(vehicle)) == false then
            ReplaceVehicle(vehicle, false)
        end
    end
end