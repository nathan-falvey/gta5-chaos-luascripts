EffectInfo = { -- ScriptInfo for mod version < 2.0
    Name = "Get Off Your Phone",
    EffectId = "player_stuckonphone", -- ScriptId for mod version < 2.0
    TimedType = "Normal",
}

function OnStart()
end

function OnStop()
    TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("cellphone_controller")
    REQUEST_SCRIPT("cellphone_controller")
	while HAS_SCRIPT_LOADED("cellphone_controller") ~= true do
        WAIT(1)
    end
	START_NEW_SCRIPT("cellphone_controller", 1424)
	SET_SCRIPT_AS_NO_LONGER_NEEDED("cellphone_controller")
end

function OnTick()
    CREATE_MOBILE_PHONE(3)


end