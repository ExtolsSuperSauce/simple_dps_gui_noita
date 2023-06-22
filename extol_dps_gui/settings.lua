dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "extol_dps_gui"
mod_settings_version = 1 
mod_settings = 
{
	{
		category_id = "group_of_settings",
		ui_name = "GUI Position",
		settings = {
			{
				id = "extol_dps_pos_x",
				ui_name = "GUI Pos X",
				ui_description = "Where to display dps. Horizontal",
				value_default = 8,
				value_min = 1,
				value_max = 1000,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "extol_dps_pos_y",
				ui_name = "GUI Pos Y",
				ui_description = "Where to display dps. Vertical",
				value_default = 8,
				value_min = 1,
				value_max = 1000,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		}
	}
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
