EffectInfo = { 
    Name = "Clean Up Dead Stuff",
    EffectId = "misc_cleanup",
    TimedType = "None",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
    for _, vehicle in ipairs(GetAllVehicles()) do
        if GET_VEHICLE_ENGINE_HEALTH(vehicle) <= -4000 then
            DELETE_ENTITY(Holder(vehicle))
        end
    end


    for _, ped in ipairs(GetAllPeds()) do
        if ped ~= PLAYER_PED_ID() and IS_PED_DEAD_OR_DYING(ped, false) then
            DELETE_ENTITY(Holder(ped))
        end
    end

end

function OnStop()
end

function OnTick()
end
