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
    SET_PLAYER_INVINCIBLE(0, false)
end

function OnTick()
    playerPed = PLAYER_PED_ID()
    if DOES_ENTITY_EXIST(playerPed) and not IS_PED_DEAD_OR_DYING(playerPed,0) then
        SET_MAX_WANTED_LEVEL(0)
        SET_PLAYER_INVINCIBLE(0, true)
    end
end
