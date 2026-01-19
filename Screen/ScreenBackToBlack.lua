-- Short coherent template for a Chaos Mod effect.
-- Edit the fields below to describe the effect and adjust timing/weighting.
-- Full reference: https://github.com/gta-chaos-mod/ChaosModV/wiki/Lua-Scripting

EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Back To Black", -- Display name of the effect
    EffectId = "screen_backtoblack", -- ScriptId for mod version < 2.0, must be unique
    Description = "A short one-line description of what this effect does.",
    TimedType = "Custom", -- None, Normal, Short, Permanent, or "Custom"
    CustomTime = 340, -- (seconds) only if TimedType = "Custom"
    WeightMultiplier = 1, -- Relative probability of being chosen
    HideRealNameOnStart = false, -- true to hide the effect's real name when it starts
    EffectCategory = "Shader", -- Optional category
    EffectGroup = "_group_shader", -- Optional grouping (leave empty if unused)
    IncompatibleIds = {
        "screen_blindness", 
    }
}

-- Called once when the effect starts
function OnStart()
    print("[effect_template] OnStart: " .. ((EffectInfo and EffectInfo.Name) or "unknown"))
    -- Initialize effect state here (e.g. set timers, spawn helpers)
end

-- Called once when the effect stops/ends
function OnStop()
    print("[effect_template] OnStop: " .. ((EffectInfo and EffectInfo.Name) or "unknown"))
    -- Cleanup state here (e.g. remove entities, clear timers)
end

-- Called every game tick while the effect is active
darkness_value = 0.0
start = GetTickCount()
function OnTick()
    playerPed = PLAYER_PED_ID()
    if not DOES_ENTITY_EXIST(playerPed) or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PED_DEAD_OR_DYING(playerPed,0) then return end
    DRAW_RECT(0.5, 0.5, 1.0, 1.0, 0, 0, 0, darkness_value)
    local elapsed = (GetTickCount() - start) / 1000.0
    if elapsed > 1 then
        darkness_value = darkness_value + 1
        start = GetTickCount()
    end
    if darkness_value > 255.0 then
        darkness_value = 255.0
    end
end

-- Add custom helper functions below.

function random_choice(p1)
    if type(p1) ~= "table" or #p1 == 0 then
        return nil
    end
    local choice = p1[math.random(#p1)]
    return choice
end



