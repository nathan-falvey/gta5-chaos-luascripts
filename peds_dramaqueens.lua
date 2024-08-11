EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Drama Queens",
    EffectId = "peds_dramaqueens", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    for _, ped in ipairs(GetAllPeds()) do
        if HAS_ENTITY_COLLIDED_WITH_ANYTHING(ped) or HAS_ENTITY_BEEN_DAMAGED_BY_ANY_PED(ped) then
            if IS_PED_RAGDOLL(ped) == false then
            PLAY_PED_AMBIENT_SPEECH_NATIVE(ped, 'GENERIC_INSULT_HIGH', 'SPEECH_PARAMS_FORCE', 1)
            SET_PED_TO_RAGDOLL(ped, 5000, 5000, 0, true, true, false)
            CLEAR_ENTITY_LAST_DAMAGE_ENTITY(ped)
            end
        end
    end
end
