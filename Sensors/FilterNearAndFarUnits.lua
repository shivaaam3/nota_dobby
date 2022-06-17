local sensorInfo = {
	name = "FilterNearAndFarUnits",
	desc = "Separates Units based on if they are Near or Far from the safe Area",
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
return function(list)
	nearList = {}
	farList = {}
	
	for i = 1, #list do
		local x, _, z = Spring.GetUnitPosition(list[i])
		if z < 4750 then
			nearList[#nearList + 1] = list[i]
		elseif z > 6000 then
			farList[#farList + 1] = list[i]
		end
	end

	return {nearList, farList}
end