EffectInfo = { 
    Name = "Welcome to Canada eh?",
    EffectId = "weather_canadian",
    TimedType = "Normal",
    EffectGroup = "_group_weatherchange",
    EffectCategory = "None",
    IncompatibleIds = {
        "world_snow",
        "weather_snowstorm"
    }

}

function OnStart()
    snowMen = {}
    snowManModel = "prop_prlg_snowpile"
    snowManModelhash = GET_HASH_KEY(snowManModel)
    LoadModel(snowManModelhash)
end

function OnStop()
    for _, object in ipairs(GetAllProps()) do
        if GET_ENTITY_MODEL(object) == snowManModelhash then
            DELETE_ENTITY(Holder(object))
        end
    end
    SetSnowState(false)
    USE_SNOW_FOOT_VFX_WHEN_UNSHELTERED(false)
end

function OnTick()
    SetSnowState(true)
    for _, ped in ipairs(GetAllPeds()) do
        if DOES_ENTITY_EXIST(ped) and not IS_PED_DEAD_OR_DYING(ped, false) and snowMen[ped] ~= true then
            --

            coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0, 0, 50)

            snowManProp = CreatePoolProp(snowManModelhash, coords.x, coords.y, coords.z, false)
            SET_ENTITY_COLLISION(snowManProp, false, false)
            ATTACH_ENTITY_TO_ENTITY(snowManProp, ped, GET_PED_BONE_INDEX(ped, 0x0), 0, 0, 0, 0, 0, 0, false, false, false, false, 0, true)

            snowMen[ped] = true -- allows me to internally track which ped has a snowman attached to them to prevent spawning duplicates and causing a memory crash
        end
    end
    USE_SNOW_FOOT_VFX_WHEN_UNSHELTERED(true)


end
