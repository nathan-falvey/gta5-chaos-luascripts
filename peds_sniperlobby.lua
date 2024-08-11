EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Sniper Lobby",
    EffectId = "peds_sniperlobby", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
    SET_MAX_WANTED_LEVEL(0)
end

function OnStop()
    SET_RIOT_MODE_ENABLED(false)
    SET_MAX_WANTED_LEVEL(5)
end

function OnTick()
    SET_RIOT_MODE_ENABLED(true)
    for _, ped in ipairs(GetAllPeds()) do
        current_ped_weapon = Holder()
        GET_CURRENT_PED_WEAPON(ped, current_ped_weapon)
        if ped ~= PLAYER_PED_ID() and not IS_PED_DEAD_OR_DYING(ped) and current_ped_weapon ~= GET_HASH_KEY('weapon_sniperrifle') and GET_IS_TASK_ACTIVE(ped, 383) == false then
            GIVE_WEAPON_TO_PED(ped, GET_HASH_KEY("weapon_sniperrifle"), 9000, false, true)
            SET_CURRENT_PED_WEAPON(ped, GET_HASH_KEY("weapon_sniperrifle"),true)
        end
        SET_PED_FIRING_PATTERN(ped, 0xC6EE6B4C)
        SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
    end
end
