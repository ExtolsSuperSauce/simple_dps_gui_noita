
local damage_types = {"curse","drill","electricity","fire","ice","melee","projectile","slice"}
function shot(projectile)
	local eid = GetUpdatedEntityID()
	local vsc_id = EntityGetFirstComponentIncludingDisabled( eid, "VariableStorageComponent", "EXTOL_DPS_STORAGE" )
	if ComponentGetValue2(vsc_id, "value_bool") == true then
		ComponentSetValue2( vsc_id, "value_bool", false )
		ComponentSetValue2( vsc_id, "value_float", 0 )
	end
	local pc_ids = EntityGetComponent(projectile, "ProjectileComponent")
	if #pc_ids > 0 then
		for k, proj_comp in ipairs(pc_ids) do
			for i, d_type in ipairs(damage_types) do
				local damage = ComponentObjectGetValue2( proj_comp, "damage_by_type", d_type )
				local stored = ComponentGetValue2( vsc_id, "value_float" )
				ComponentSetValue2( vsc_id, "value_float", stored + damage )
			end
			local damage = ComponentGetValue2( proj_comp, "damage")
			local stored = ComponentGetValue2( vsc_id, "value_float" )
			ComponentSetValue2( vsc_id, "value_float", stored + damage )
		end
	end
end