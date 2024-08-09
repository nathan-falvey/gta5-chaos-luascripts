EffectInfo = { 
    Name = "Spawn Muscle Man",
    EffectId = "peds_spawnmuscleman",
    TimedType = "None",
}

function OnStart()
    PLAYER_GROUP = GET_HASH_KEY("PLAYER")
    CIV_GROUP = GET_HASH_KEY("CIVMALE")
    FCIV_GROUP = GET_HASH_KEY("CIVFEMALE")

    playerPos = GET_ENTITY_COORDS(PLAYER_PED_ID(), false)
    local rel_group = Holder()
    ADD_RELATIONSHIP_GROUP("_HOSTILE_MUSCLEMAN", rel_group)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, PLAYER_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, CIV_GROUP)
    SET_RELATIONSHIP_BETWEEN_GROUPS(5, rel_group, FCIV_GROUP)
    ped = CreatePoolPed(4, GET_HASH_KEY('u_m_y_babyd'), playerPos.x, playerPos.y, playerPos.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    
    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), true) then
        SET_PED_INTO_VEHICLE(ped, GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false), -2)
    end
    
    SET_PED_DEFAULT_COMPONENT_VARIATION(ped)

    SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
	SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)

	SET_PED_RELATIONSHIP_GROUP_HASH(ped, rel_group)
	SET_PED_HEARING_RANGE(ped, 9999.0)
	SET_PED_CONFIG_FLAG(ped, 281, true)

    SET_ENTITY_MAX_HEALTH(ped, 1500)
    SET_ENTITY_HEALTH(ped, 1500, 0, 0)
    

    TASK_COMBAT_PED(ped, PLAYER_PED_ID(), 0, 16)
end

function OnStop()
end

function OnTick()
end


function getRandomItem(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
  end