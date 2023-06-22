
gui = gui or GuiCreate()
local scr_x, scr_y = GuiGetScreenDimensions(gui)
local ms_x = ModSettingGet("extol_dps_gui.extol_dps_pos_x")
local ms_y = ModSettingGet("extol_dps_gui.extol_dps_pos_y")
local eid = GetUpdatedEntityID()
local vsc_id = EntityGetFirstComponentIncludingDisabled( eid, "VariableStorageComponent", "EXTOL_DPS_STORAGE" )
local dps = ComponentGetValue2(vsc_id, "value_float")
dps = math.ceil(math.floor(dps * 2500) / 100)
GuiColorSetForNextWidget( gui, 0.95, 0.05, 0.05, 1 )
GuiText( gui, ms_x + 10, ms_y + 5, dps )
GuiColorSetForNextWidget( gui, 0.5, 0.5, 0.5, 1 )
local old_dps = ComponentGetValue2( vsc_id, "value_int" )
GuiText( gui, ms_x + 10, ms_y - 5, old_dps )

if GameGetFrameNum()%60 == 0 then
	ComponentSetValue2(vsc_id, "value_bool", true)
	ComponentSetValue2( vsc_id, "value_int", dps )
end

has_clicked = has_clicked or false
local click = GuiImageButton( gui, 94534, ms_x, ms_y, "", "mods/extol_dps_gui/move.png" )
if click and not has_clicked then
	has_clicked = true
elseif click and has_clicked then
	has_clicked = false
elseif has_clicked then
	local cc_id = EntityGetFirstComponentIncludingDisabled( eid, "ControlsComponent" )
	local mouse_x, mouse_y = ComponentGetValue2( cc_id, "mMousePositionRaw" )
	mouse_x = mouse_x / 2 - 4
	mouse_y = mouse_y / 2 - 4
	ModSettingSetNextValue( "extol_dps_gui.extol_dps_pos_x", mouse_x, false )
	ModSettingSetNextValue( "extol_dps_gui.extol_dps_pos_y", mouse_y, false )
end
GuiStartFrame(gui)