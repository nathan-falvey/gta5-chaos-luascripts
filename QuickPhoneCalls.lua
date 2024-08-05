EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Quick Phone Calls",
    EffectId = "player_skipphonecalls", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
end

function OnTick()
    if IS_MOBILE_PHONE_CALL_ONGOING() then
        SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE()
    end
end