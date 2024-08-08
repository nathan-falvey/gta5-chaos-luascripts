EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Spawn Jim Pickens",
    EffectId = "ped_spawnjim", -- ScriptId for mod version < 2.0
    TimedType = "None",
}

function OnStart()
    PLAYER_GROUP = GET_HASH_KEY("PLAYER")
    CIV_GROUP = GET_HASH_KEY("CIVMALE")
    FCIV_GROUP = GET_HASH_KEY("CIVFEMALE")

    playerPos = GET_ENTITY_COORDS(PLAYER_PED_ID(), false)
    local rel_group = Holder()
    ADD_RELATIONSHIP_GROUP("_HOSTILE_JIM", rel_group)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, PLAYER_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, CIV_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, FCIV_GROUP)

    ped = CreatePoolPed(4, GET_HASH_KEY("a_m_m_golfer_01"), playerPos.x, playerPos.y, playerPos.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    
    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), true) then
        SET_PED_INTO_VEHICLE(ped, GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false), -2)
    end
    
    SET_PED_DEFAULT_COMPONENT_VARIATION(ped)

    SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
	SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)

	SET_PED_RELATIONSHIP_GROUP_HASH(ped, rel_group)
	SET_PED_HEARING_RANGE(ped, 9999.0)
	SET_PED_CONFIG_FLAG(ped, 281, true)

    GIVE_WEAPON_TO_PED(ped, GET_HASH_KEY("weapon_machete"), 9000, false, true)
    SET_CURRENT_PED_WEAPON(ped, GET_HASH_KEY("weapon_machete"),true)
    SET_ENTITY_HEALTH(ped, 1500, 0, 0)

    TASK_COMBAT_PED(ped, PLAYER_PED_ID(), 0, 16)

end

function OnStop()
end

function OnTick()
end