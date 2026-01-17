EffectInfo = { 
    Name = "Invincible And No Wanted Level",
    EffectId = "player_invincandnocops",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()

end

function OnStop()
    SET_MAX_WANTED_LEVEL(5)
    SET_PLAYER_INVINCIBLE(GET_PLAYER_INDEX(), false)
end

function OnTick()
    SET_MAX_WANTED_LEVEL(0)
    SET_PLAYER_INVINCIBLE(GET_PLAYER_INDEX(), true)
end
