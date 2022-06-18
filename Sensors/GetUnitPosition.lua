local sensorInfo = {
	name = "GetUnitPosition",
	desc = "Get unit position",
	author = "Dobby",
	date = "2021-06-17",
	license = "none",
}

-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function(unit)
	if not Spring.ValidUnitID(unit) then return nil end
	local x, y, z = Spring.GetUnitPosition(unit)

	local pos = Vec3(x,y,z)
	return pos
end