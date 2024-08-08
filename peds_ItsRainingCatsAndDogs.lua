EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "It's Raining Cats and Dogs",
    EffectId = "misc_catsanddogsrain", -- ScriptId for mod version < 2.0
    TimedType = "Short",
}

function OnStart()
    ped_list = {}
end

function OnStop()
    for _, ped in ipairs(ped_list) do
        if DOES_ENTITY_EXIST(ped) then
            DELETE_ENTITY(Holder(ped))
        end
    end
    DisplayHelpText("~g~No animals were harmed in the making of this effect.", 7)
end

function OnTick()
    peds_count = #GetAllPeds()
    if peds_count < 200 then
        coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER_PED_ID(), randomFloatInRange(-75.0, 75.0), randomFloatInRange(-50.0, 50.0), randomFloatInRange(5.0, 35.0))
        animal_list = {'a_c_chop', 
        'a_c_husky','a_c_poodle','a_c_pug','a_c_retriever','a_c_rottweiler','a_c_shepherd','a_c_westy','a_c_cat_01'}
        animal_model = getRandomItem(animal_list)
        animal = CreatePoolPed(4, GET_HASH_KEY(animal_model), coords.x, coords.y, coords.z, GET_ENTITY_HEADING(PLAYER_PED_ID()))
        SET_ENTITY_INVINCIBLE(animal, true)
        TASK_REACT_AND_FLEE_PED(animal, PLAYER_PED_ID())
        SET_PED_KEEP_TASK(animal, true)
        SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(animal, true)
        table.insert(ped_list, animal)
        WAIT(200)
    end

end

function randomFloatInRange(min, max)
    return math.random() * (max - min) + min
  end


  function getRandomItem(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
  end