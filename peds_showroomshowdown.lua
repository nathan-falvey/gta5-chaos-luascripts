EffectInfo = { 
    Name = "Showroom Showdown",
    EffectId = "peds_spawnmichaelandsimeon",
    TimedType = "None",
}

function OnStart()
    EnableScriptThreadBlock()
    TeleportPlayer(-55.523464, -1112.463, 26.435816, true)
    PLAYER_GROUP = GET_HASH_KEY("PLAYER")
    CIV_GROUP = GET_HASH_KEY("CIVMALE")
    FCIV_GROUP = GET_HASH_KEY("CIVFEMALE")
    playerPos = GET_ENTITY_COORDS(PLAYER_PED_ID(), false)
    local simeon_rel_group = Holder()
    ADD_RELATIONSHIP_GROUP("_HOSTILE_SIMEON", simeon_rel_group)
    local michael_rel_group = Holder()
    ADD_RELATIONSHIP_GROUP("_HOSTILE_MICHAEL", simeon_rel_group)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, simeon_rel_group, PLAYER_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, simeon_rel_group, CIV_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, simeon_rel_group, FCIV_GROUP)

    SET_RELATIONSHIP_BETWEEN_GROUPS(5, michael_rel_group, PLAYER_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, michael_rel_group, CIV_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, michael_rel_group, FCIV_GROUP)

    SET_RELATIONSHIP_BETWEEN_GROUPS(5, michael_rel_group, simeon_rel_group)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, simeon_rel_group, michael_rel_group)



    michael = CreatePoolPed(4, GET_HASH_KEY('player_zero'), -55.523464, -1112.463, 26.435816, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    simeon = CreatePoolPed(4, GET_HASH_KEY('ig_siemonyetarian'), -55.523464, -1112.463, 26.435816, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    SET_PED_DEFAULT_COMPONENT_VARIATION(ped)

    SET_PED_RELATIONSHIP_GROUP_HASH(michael, michael_rel_group)
    SET_PED_RELATIONSHIP_GROUP_HASH(simeon_rel_group, simeon_rel_group)

    SET_PED_COMBAT_ATTRIBUTES(michael, 5, true)
	SET_PED_COMBAT_ATTRIBUTES(michael, 46, true)
    SET_ENTITY_MAX_HEALTH(michael, 1500)
    SET_ENTITY_HEALTH(michael, 1500, 0, 0)
    SET_PED_HEARING_RANGE(michael, 9999.0)
	SET_PED_CONFIG_FLAG(michael, 281, true)
    TASK_COMBAT_PED(michael, simeon, 0, 16)


    SET_PED_COMBAT_ATTRIBUTES(simeon, 5, true)
	SET_PED_COMBAT_ATTRIBUTES(simeon, 46, true)
    SET_ENTITY_MAX_HEALTH(simeon, 1500)
    SET_ENTITY_HEALTH(simeon, 1500, 0, 0)
    SET_PED_HEARING_RANGE(simeon, 9999.0)
	SET_PED_CONFIG_FLAG(simeon, 281, true)
    TASK_COMBAT_PED(simeon, michael, 0, 16)
    

    DisableScriptThreadBlock()
end

function OnStop()
end

function OnTick()
end

