-- Short coherent template for a Chaos Mod effect.
-- Edit the fields below to describe the effect and adjust timing/weighting.
-- Full reference: https://github.com/gta-chaos-mod/ChaosModV/wiki/Lua-Scripting

EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Disable Pedestrians", -- Display name of the effect
    EffectId = "misc_disablepeds", -- ScriptId for mod version < 2.0, must be unique
    --Description = "A short one-line description of what this effect does.",
    TimedType = "Custom", -- None, Normal, Short, Permanent, or "Custom"
    CustomTime = 120, -- (seconds) only if TimedType = "Custom"
    WeightMultiplier = 1, -- Relative probability of being chosen
    HideRealNameOnStart = false, -- true to hide the effect's real name when it starts
    EffectCategory = "None", -- Optional category
    EffectGroup = "", -- Optional grouping (leave empty if unused)
    IncompatibleIds = {
        -- Example: "other_effect_id", -- add EffectIds that cannot run simultaneously
    }
}

-- Called once when the effect starts
function OnStart()
    print("[effect_template] OnStart: " .. ((EffectInfo and EffectInfo.Name) or "unknown"))
    -- Initialize effect state here (e.g. set timers, spawn helpers)
end

-- Called once when the effect stops/ends
function OnStop()
    SET_PED_POPULATION_BUDGET(3)
    SET_VEHICLE_POPULATION_BUDGET(3)
    SET_REDUCE_PED_MODEL_BUDGET(false)
    SET_REDUCE_VEHICLE_MODEL_BUDGET(false)
    SET_DISTANT_CARS_ENABLED(true)
    print("[effect_template] OnStop: " .. ((EffectInfo and EffectInfo.Name) or "unknown"))
    -- Cleanup state here (e.g. remove entities, clear timers)
end

-- Called every game tick while the effect is active
function OnTick()
    -- Keep this lightweight. Use this for per-frame checks or gradual changes.

    SET_PED_POPULATION_BUDGET(0)
    SET_VEHICLE_POPULATION_BUDGET(0)
    SET_REDUCE_PED_MODEL_BUDGET(true)
    SET_REDUCE_VEHICLE_MODEL_BUDGET(true)
    SET_DISTANT_CARS_ENABLED(false)
    WAIT(500) -- Example: wait 500 ms between ticks, adjust as needed, also for performance

end



-- A compilation of frequently used lua helper functions.
-- If downloaded externally, ensure to credit the original author.

-- Add custom helper functions below.

function IS_PLAYER_AVAILABLE()
    local player_ped = PLAYER_PED_ID()
    if not DOES_ENTITY_EXIST(player_ped) or IS_ENTITY_DEAD(player_ped) or IS_PLAYER_SWITCH_IN_PROGRESS() then
        return false
    end
    return true
end

function GET_PLAYER_PED_OFFSET(offset_x, offset_y, offset_z)
    local player_ped = PLAYER_PED_ID()
    return GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_ped, offset_x, offset_y, offset_z)
end

function RETURN_PLAYER_VEHICLE()
    local player_ped = PLAYER_PED_ID()
    if IS_PED_IN_ANY_VEHICLE(player_ped, false) then
        local vehicle = GET_VEHICLE_PED_IS_IN(player_ped, false)
        return vehicle
    end
    return nil
end

function GET_PLAYER_PED_HEADING()
    local player_ped = PLAYER_PED_ID()
    return GET_ENTITY_HEADING(player_ped)
end

function RANDOM_CHOICE(p1)
    if type(p1) ~= "table" or #p1 == 0 then
        return nil
    end
    local choice = p1[math.random(#p1)]
    return choice
end


function CREATE_GHOST(ped_model, offset_x, offset_y, offset_z)
    local player_heading = GET_PLAYER_PED_HEADING()
    local ped_model_hash = GET_HASH_KEY(ped_model)
    local player_coords =  GET_PLAYER_PED_OFFSET(offset_x, offset_y, offset_z)
    local ghost = CreatePoolPed(1, ped_model_hash, player_coords.x, player_coords.y, player_coords.z, player_heading)
    SET_ENTITY_ALPHA(ghost, 0, false)
    return ghost
end

