EffectInfo = { 
    Name = "Millenials",
    EffectId = "peds_millenials",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, ped in ipairs(GetAllPeds()) do
        if ped ~= PLAYER_PED_ID() and IS_PED_RUNNING_MOBILE_PHONE_TASK(ped) == false and IS_PED_IN_ANY_VEHICLE(ped, false) == false then
            TASK_USE_MOBILE_PHONE(ped, 1, 2)
            SET_PED_HIGHLY_PERCEPTIVE(ped, false)
            SET_PED_SEEING_RANGE(ped, 0)
        end
    end
end
