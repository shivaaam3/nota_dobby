local sensorInfo = {
	name = "SwapKeyValue",
	desc = "Swaps Keys with values for a given table",
	author = "Dobby",
	date = "2022-04-25",
	license = "N/A",
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

-- @returns a new table with swapped keys and values
return function()
	local swappedTable = {}
    for k, v in pairs(units) do
		if tonumber(k) ~= nil then
        	swappedTable[v] = k
		end	
    end
	return swappedTable
end