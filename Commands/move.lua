function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move custom group to defined position. Group is defined by table of unitID => formationIndex.",
		parameterDefs = {
			{ 
				name = "unit",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "position",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "fight",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "false",
			},
		}
	}
end


function Run(self, units, parameter)
	
	local fight = parameter.fight -- boolean

	if not Spring.ValidUnitID(parameter.unit) then
		return FAILURE
	end

	local epsilon = 100

	local x,_,z = Spring.GetUnitPosition(parameter.unit)

	if x == nil or parameter.position.x == nil then
		return FAILURE
	end

	if math.abs(x - parameter.position.x) < epsilon and math.abs(z - parameter.position.z) < epsilon then
		return SUCCESS
	end

	

	if not self.init then
		if (fight) then cmdID = CMD.FIGHT end
		if parameter.position.x < 500 or Spring.GetUnitPosition(parameter.unit) < 500 then
			Spring.GiveOrderToUnit(parameter.unit, CMD.MOVE, {100, 128, 100}, {"shift"})
		end
		Spring.GiveOrderToUnit(parameter.unit, CMD.MOVE, {parameter.position.x, parameter.position.y, parameter.position.z}, {"shift"})
		self.init = true
	end

	return RUNNING
end


function Reset(self)
	self.init = false
end
