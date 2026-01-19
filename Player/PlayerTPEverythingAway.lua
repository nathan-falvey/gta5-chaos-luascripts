-- Short coherent template for a Chaos Mod effect.
-- Edit the fields below to describe the effect and adjust timing/weighting.
-- Full reference: https://github.com/gta-chaos-mod/ChaosModV/wiki/Lua-Scripting

EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Teleport Everything Away", -- Display name of the effect
    EffectId = "player_tpallaway", -- ScriptId for mod version < 2.0, must be unique
    Description = "Teleports all nearby vehicles and peds away from the player.", -- Short description of the effect
    TimedType = "None", -- None, Normal, Short, Permanent, or "Custom"
    -- CustomTime = 10, -- (seconds) only if TimedType = "Custom"
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
    EnableScriptThreadBlock()
    -- Initialize effect state here (e.g. set timers, spawn helpers)
    playerPed = PLAYER_PED_ID()
    playerPos = GET_ENTITY_COORDS(playerPed, true)
    for _, vehicle in ipairs(GetAllVehicles()) do
        vehiclePos = GET_ENTITY_COORDS(vehicle, true)
        distance = VDIST2(playerPos.x, playerPos.y, playerPos.z, vehiclePos.x, vehiclePos.y, vehiclePos.z)
        if distance < 1000000 then -- 1000 units squared
            newX = vehiclePos.x + math.random(-500, 500)
            newY = vehiclePos.y + math.random(-500, 500)
            newZ = vehiclePos.z + 50 -- teleport above ground to avoid collisions
            SET_ENTITY_COORDS(vehicle, newX, newY, newZ, false, false, false, true)
        end
    end
    for _, ped in ipairs(GetAllPeds()) do
        if ped ~= playerPed then
            if IS_PED_IN_ANY_VEHICLE(ped, false) then
                TASK_LEAVE_VEHICLE(ped, GET_VEHICLE_PED_IS_IN(ped, false), 16)
            end

            pedPos = GET_ENTITY_COORDS(ped, true)
            distance = VDIST2(playerPos.x, playerPos.y, playerPos.z, pedPos.x, pedPos.y, pedPos.z)
            if distance < 1000000 then -- 1000 units squared
                newX = pedPos.x + math.random(-500, 500)
                newY = pedPos.y + math.random(-500, 500)
                newZ = pedPos.z + 50 -- teleport above ground to avoid collisions
                SET_ENTITY_COORDS(ped, newX, newY, newZ, false, false, false, true)
            end
        end
    end
    DisableScriptThreadBlock()
end

-- Called once when the effect stops/ends
function OnStop()
    print("[effect_template] OnStop: " .. ((EffectInfo and EffectInfo.Name) or "unknown"))
    -- Cleanup state here (e.g. remove entities, clear timers)
end

-- Called every game tick while the effect is active
function OnTick()
    -- Keep this lightweight. Use this for per-frame checks or gradual changes.
end

-- Add custom helper functions below.
