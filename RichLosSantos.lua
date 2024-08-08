EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Rich Los Santos",
    EffectId = "misc_richpeds", -- ScriptId for mod version < 2.0
    TimedType = "Short",
}

function OnStart()
end

function OnStop()
end

function OnTick()

    for _,ped in ipairs(GetAllPeds()) do
        if GET_PED_MONEY(ped) < 5000 then
            SET_PED_MONEY(ped, math.random(5000,65000))
        end
    end

    for _, vehicle in ipairs(GetAllVehicles()) do
        vehicle_class = GET_VEHICLE_CLASS(vehicle)
        if vehicle_class < 5 or vehicle_class > 7 then
            ReplaceVehicle(vehicle, false)
        end
    end

end

