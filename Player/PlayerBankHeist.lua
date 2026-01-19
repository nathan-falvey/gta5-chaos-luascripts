EffectInfo = { 
    Name = "The Big Score",
    EffectId = "player_tptoheistlocation",
    TimedType = "None",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
    EnableScriptThreadBlock()
    bankLoc = {22.70556, -744.3594, 43.93562}

    vanModel = "burrito4"
    vanHash = GET_HASH_KEY(vanModel)
    van = CreatePoolVehicle(vanHash, bankLoc[1], bankLoc[2], bankLoc[3], -61) -- translates the table into coords using a simple method

    gunManModel = "hc_gunman"
    hackerModel = "hc_hacker"
    gunManModelHash = GET_HASH_KEY(gunManModel)
    hackerModelHash = GET_HASH_KEY(hackerModel)

    models = {
        gunManModelHash,
        hackerModelHash
    }
    for _, model in ipairs(models) do
        REQUEST_MODEL(model)
        while not HAS_MODEL_LOADED(model) do
            WAIT(50)
        end

        ped = CreatePoolPed(0, model, bankLoc[1], bankLoc[2], bankLoc[3]+20, 0)
        SET_PED_INTO_VEHICLE(ped, van, -2)
    end 



    SET_PED_INTO_VEHICLE(PLAYER_PED_ID(), van, -1)

    if GET_PLAYER_WANTED_LEVEL(PLAYER_ID()) < 3 then
        SET_PLAYER_WANTED_LEVEL(PLAYER_ID(), 3, 0)
        SET_PLAYER_WANTED_LEVEL_NOW(PLAYER_ID(), 0)
    end

    DisableScriptThreadBlock()
end

function OnStop()
end

function OnTick()
end
