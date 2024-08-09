EffectInfo = { 
    Name = "Chaotic (Meta)",
    EffectId = "meta_chaotic",
    TimedType = "Normal",
    IsMeta = true, 
}

function OnStart()
    start = GetTickCount()
end

function OnStop()
end

function OnTick()
    if start > GetTickCount() + 7000 then
        MetaModifiers.AdditionalEffectsToDispatch(4)
        start = GetTickCount()
    end
end
