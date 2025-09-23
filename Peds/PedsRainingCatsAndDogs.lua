EffectInfo = { 
    Name = "Its Raining Cats And Dogs",
    EffectId = "peds_rainingcatsanddogs",
    TimedType = "Normal",
    EffectGroup = "_group_spawngeneric",
    EffectCategory = "None"

}

function OnStart()
    DisplayHelpText("No animals were harmed in this effect.", 8)
    test = {"g", "y"}
    spawned_animals = {}
end

function OnStop()
end

function OnTick()
    animals = {"a_c_cat_01", "a_c_chop", "a_c_husky", "a_c_poodle", "a_c_pug", "a_c_rottweiler_02", "a_c_retriever", "a_c_westy", "a_c_shepherd", "a_c_rottweiler"}
    animalModel = GET_HASH_KEY(random_choice(animals))
    playerPed = PLAYER_PED_ID()
    heading = GET_ENTITY_HEADING(playerPed)
    coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, math.random(75), math.random(75), math.random(75))
    animal = CreatePoolPed(0, animalModel, coords.x, coords.y, coords.z, heading)
    SET_ENTITY_INVINCIBLE(animal, true)
    TASK_REACT_AND_FLEE_PED(animal, playerPed)
    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(animal, true)
    table.insert(spawned_animals, animal)
    WAIT(math.random(1500, 6000))
    if #spawned_animals > 50 then
        for animal in spawned_animals do
            if DOES_ENTITY_EXIST(animal) then
                DELETE_ENTITY(Holder(animal))
                table.remove(spawned_animals, animal)
            end
        end
    end
end


function random_choice(p1)
    choice = p1[math.random(#p1)]
    return choice
end