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
	local theta = math.random(-math.pi, math.pi)
	local thisX = x + (math.sin(theta) * r * 0.9)
	local thisZ = z + (math.cos(theta) * r * 0.9)

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
