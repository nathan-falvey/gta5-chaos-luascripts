EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Buggy Interface",
    EffectId = "misc_buggyinterface", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
    IsMeta = true,
}

function OnStart()
end

function OnStop()
    MetaModifiers.FlipChaosUI(false)
end

function OnTick()
    MetaModifiers.FlipChaosUI(true)
    WAIT(math.random(100, 9000))
    MetaModifiers.FlipChaosUI(false)
    WAIT(math.random(100, 9000))
end