EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "British Police",
    EffectId = "ped_britishpolice", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, ped in ipairs(GetAllPeds()) do
        if GET_PED_TYPE(ped) == 6 and IS_PED_DEAD_OR_DYING(ped, true) ~= true then
            weapon = Holder()
            GET_CURRENT_PED_WEAPON(ped, weapon, true)
            if weapon ~= GET_HASH_KEY("weapon_stungun") then
            GIVE_WEAPON_TO_PED(ped, GET_HASH_KEY("weapon_stungun"), 9000, false, true)
            SET_CURRENT_PED_WEAPON(ped, GET_HASH_KEY("weapon_stungun"),true)
            end
        end
    end
end