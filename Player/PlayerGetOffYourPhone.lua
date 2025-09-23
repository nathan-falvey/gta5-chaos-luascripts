EffectInfo = { 
    Name = "Get Off Your Phone",
    EffectId = "player_getoffyourphone",
    TimedType = "Normal",
    EffectGroup = "None",
    EffectCategory = "None"

}

function OnStart()
    if IS_MOBILE_PHONE_CALL_ONGOING() == false then
        TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("cellphone_controller")
    end
    REQUEST_SCRIPT("cellphone_controller")

	while (HAS_SCRIPT_LOADED("cellphone_controller") == false ) do
		WAIT(0)
    end
	START_NEW_SCRIPT("cellphone_controller", 1424)

	SET_SCRIPT_AS_NO_LONGER_NEEDED("cellphone_controller")
end

function OnStop()
    if IS_MOBILE_PHONE_CALL_ONGOING() == false then
        TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("cellphone_controller")
    end
    REQUEST_SCRIPT("cellphone_controller")

	while (HAS_SCRIPT_LOADED("cellphone_controller") == false ) do
		WAIT(0)
    end
	START_NEW_SCRIPT("cellphone_controller", 1424)

	SET_SCRIPT_AS_NO_LONGER_NEEDED("cellphone_controller")
end

function OnTick()
    playerPed = PLAYER_PED_ID()
    if IS_PAUSE_MENU_ACTIVE() or IS_PLAYER_SWITCH_IN_PROGRESS() or IS_PLAYER_DEAD(PLAYER_ID()) or DOES_ENTITY_EXIST(playerPed) ~= true then return end
    playerModel = GET_ENTITY_MODEL(playerPed)
    phoneType = 0
    if playerModel == 2602752943 then
        phoneType = 2
    end

    if playerModel == 2608926626 then
        phoneType = 1
    end
    CREATE_MOBILE_PHONE(phoneType)
end
