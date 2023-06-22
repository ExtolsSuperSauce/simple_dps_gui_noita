
gui = gui or GuiCreate()
local scr_x, scr_y = GuiGetScreenDimensions(gui)
local ms_x = ModSettingGet("extol_dps_gui.extol_dps_pos_x")
local ms_y = ModSettingGet("extol_dps_gui.extol_dps_pos_y")
local eid = GetUpdatedEntityID()
local vsc_id = EntityGetFirstComponentIncludingDisabled( eid, "VariableStorageComponent", "EXTOL_DPS_STORAGE" )
local dps = ComponentGetValue2(vsc_id, "value_float")
dps = math.ceil(math.floor(dps * 2500) / 100)
local text_x = scr_x * ms_x
local text_y = scr_y * ms_y
GuiColorSetForNextWidget( gui, 0.95, 0.05, 0.05, 1 )
GuiText( gui, text_x, text_y, dps )
GuiColorSetForNextWidget( gui, 0.5, 0.5, 0.5, 1 )
local old_dps = ComponentGetValue2( vsc_id, "value_int" )
GuiText( gui, text_x, text_y - 10, old_dps )

if GameGetFrameNum()%60 == 0 then
	ComponentSetValue2(vsc_id, "value_bool", true)
	ComponentSetValue2( vsc_id, "value_int", dps )
end