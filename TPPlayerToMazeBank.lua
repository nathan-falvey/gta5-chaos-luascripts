EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Teleport to Maze Bank (With Godmode)",
    EffectId = "misc_tptomazebank", -- ScriptId for mod version < 2.0
    TimedType = "Short",
}

function OnStart()
    TeleportPlayer(-75.7, -818.62, 326.16, true)
    SET_PLAYER_INVINCIBLE_BUT_HAS_REACTIONS(PLAYER_ID(), true)
end

function OnStop()
    SET_PLAYER_INVINCIBLE_BUT_HAS_REACTIONS(PLAYER_ID(), false)
end

function OnTick()
end