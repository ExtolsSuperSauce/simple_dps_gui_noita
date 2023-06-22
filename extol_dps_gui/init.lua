function OnPlayerSpawned(pid)
	local init_check = GameHasFlagRun("EXTOL_DPSGUI_FLAG")
	if init_check then
		local lua_comp = EntityGetFirstComponentIncludingDisabled( pid, "LuaComponent", "EXTOL_DPSGUI_FLAG" )
		EntityRemoveComponent(pid, lua_comp)
		EntityAddComponent2( pid, "LuaComponent", {script_shot="mods/extol_dps_gui/gui_update.lua", script_source_file="mods/extol_dps_gui/gui.lua", _tags="EXTOL_DPS_STORAGE"} )
		return
	end
	GameAddFlagRun("EXTOL_DPSGUI_FLAG")
	EntityAddComponent2( pid, "LuaComponent", {script_shot="mods/extol_dps_gui/gui_update.lua", script_source_file="mods/extol_dps_gui/gui.lua", _tags="EXTOL_DPS_STORAGE"} )
	EntityAddComponent2( pid, "VariableStorageComponent", {_tags="EXTOL_DPS_STORAGE"})
end