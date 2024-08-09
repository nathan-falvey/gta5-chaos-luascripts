EffectInfo = { 
    Name = "Me And The Boys",
    EffectId = "peds_spawnsmcompanions",
    TimedType = "None",
}

function OnStart()
    model_hashes = {"player_one", "player_two", "player_zero"}
    for _, model in ipairs(model_hashes) do
        if GET_ENTITY_MODEL(PLAYER_PED_ID()) ~= GET_HASH_KEY(model) then
            if model == "player_zero" then
                weapon = 'weapon_heavysniper'
            end
            if model == "player_one" then
                weapon = 'weapon_assaultrifle'
            end
            if model == "player_two" then
                weapon = 'weapon_rpg'
            end
            SPAWN_BODYGUARD(model,"_FRIENDS_CUSTOM", GET_HASH_KEY(weapon))
        end
    end
end

function OnStop()
end

function OnTick()

end

function SPAWN_BODYGUARD(model,group,  weapon)
    friend_group = Holder()
    ADD_RELATIONSHIP_GROUP(group, friend_group)
    SET_RELATIONSHIP_BETWEEN_GROUPS(0, friend_group, GET_HASH_KEY("PLAYER"))
	SET_RELATIONSHIP_BETWEEN_GROUPS(0, GET_HASH_KEY("PLAYER"),friend_group)
    player_coords = GET_ENTITY_COORDS(PLAYER_PED_ID(), false)
    companion = CreatePoolPed(4, GET_HASH_KEY(model), player_coords.x, player_coords.y, player_coords.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
    SET_PED_RELATIONSHIP_GROUP_HASH(companion, friend_group)
    SET_PED_AS_GROUP_MEMBER(companion, GET_PLAYER_GROUP(PLAYER_ID()))
    if IS_PED_IN_ANY_VEHICLE(PLAYER_PED_ID(), true) then
        SET_PED_INTO_VEHICLE(companion, GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), false), -2)
    end
    GIVE_WEAPON_TO_PED(companion, weapon, 9000, false, true)
    SET_CURRENT_PED_WEAPON(companion, weapon, true)
    SET_PED_INFINITE_AMMO(companion, true, weapon)
    SET_PED_ACCURACY(companion, 100)
	SET_PED_FIRING_PATTERN(companion, 0xC6EE6B4C)
    return companion -- so i can reference and change specific details about them later
end


function getRandomItem(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
  end
