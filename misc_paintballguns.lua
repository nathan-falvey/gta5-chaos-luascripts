EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Paintball Guns",
    EffectId = "misc_paintballguns", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
    for _, veh in ipairs(GetAllVehicles()) do
            CLEAR_ENTITY_LAST_DAMAGE_ENTITY(veh)
    end
end

function OnStop()
end

function OnTick()
    for _, veh in ipairs(GetAllVehicles()) do
        weapon = Holder()
        GET_CURRENT_PED_WEAPON(PLAYER_PED_ID(), weapon, true)
        if HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(veh, PLAYER_PED_ID(), true) and IS_PED_ARMED(PLAYER_PED_ID(), 4) and IS_PED_SHOOTING(PLAYER_PED_ID()) then
            CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh)
            CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh)
            SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, math.random(0,255),math.random(0,255),math.random(0,255))
            SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh,math.random(0,255),math.random(0,255),math.random(0,255))
            CLEAR_ENTITY_LAST_DAMAGE_ENTITY(veh)
        end
    end
end