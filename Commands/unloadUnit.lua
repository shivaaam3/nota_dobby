function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move custom group to defined position. Group is defined by table of unitID => formationIndex.",
		parameterDefs = {
			{ 
				name = "atlas",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "unit",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "area",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}

		}
	}
end

function RandomPointInCircle(x, y, z, r)
	math.randomseed(math.random(-100000, 100000))
	local randomX = math.random(-r, r)
	local thisX = x + randomX / 1.75

	local randomZ= math.random(-r, r)
	local thisZ = z + randomZ / 1.75

	return {thisX, y, thisZ}
end	


function Run(self, units, parameter)
	
	if not Spring.ValidUnitID(parameter.atlas) or not Spring.ValidUnitID(parameter.unit) then
		return FAILURE
	end

	if Spring.GetUnitTransporter(parameter.unit) == nil then
		return SUCCESS
	end

	local position = RandomPointInCircle(parameter.area.center.x, parameter.area.center.y, parameter.area.center.z, parameter.area.radius)
	-- Debug.Assert(position)
	-- Debug.Assert(parameter.area.center.x, parameter.area.center.y, parameter.area.center.z)
	if not self.init then
		-- Spring.GiveOrderToUnit(parameter.atlas, CMD.UNLOAD_UNITS, {parameter.area.center.x, parameter.area.center.y, parameter.area.center.z, parameter.area.radius}, {"shift"})
		Spring.GiveOrderToUnit(parameter.atlas, CMD.UNLOAD_UNIT, position, {"shift"})
		self.init = true
	end
 
	return RUNNING
end


function Reset(self)
	self.init = false
end
