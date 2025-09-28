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

    gunMan = CreatePoolPed(0, gunManModelHash, bankLoc[1], bankLoc[2], bankLoc[3]+20, 0)
    SET_PED_INTO_VEHICLE(gunMan, van, -2)
    
    hackerMan = CreatePoolPed(0, hackerModelHash, bankLoc[1], bankLoc[2], bankLoc[3]+20, 0)
    SET_PED_INTO_VEHICLE(hackerMan, van, -2)


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
