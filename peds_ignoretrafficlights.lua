EffectInfo = { 
    Name = "Peds Ignore Traffic Lights",
    EffectId = "peds_ignoretrafficlights",
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, ped in ipairs(GetAllPeds()) do
        if IS_PED_A_DRIVER(ped) and ped ~= PLAYER_PED_ID() then
            SET_DRIVE_TASK_DRIVING_STYLE(ped, 2883621)
        end
    end
end


function IS_PED_A_DRIVER(ped)
    return IS_PED_IN_ANY_VEHICLE(ped, false) and GET_PED_IN_VEHICLE_SEAT(GET_VEHICLE_PED_IS_IN(ped, false), ped, -1)
end