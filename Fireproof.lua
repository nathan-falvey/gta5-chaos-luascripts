EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Fireproof",
    EffectId = "player_fireproof", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
    SET_ENTITY_PROOFS(PLAYER_PED_ID(), false, false, false, false, false, false, false, false, false)
end

function OnTick()
    SET_ENTITY_PROOFS(PLAYER_PED_ID(), false, true, false, false, false, false, false, false, false)
end