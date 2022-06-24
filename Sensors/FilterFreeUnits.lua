local sensorInfo = {
	name = "FilterFreeUnits",
	desc = "Filter list of Free units.",
	author = "Dobby",
	date = "2022-06-24",
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

local SpringValidUnitID = Spring.ValidUnitID

-- @description return filter function
return function(unitsIDs)
	local freeUnits = {}

	local myTeamID = Spring.GetMyTeamID()
    local myUnits = Spring.GetTeamUnits(myTeamID)

    for idx,val in ipairs(unitsIDs) do
        if bb.assigned[val] == "free" then 
			table.insert(freeUnits, val) 
			bb.assigned[val] = "occupied"
		end
    end
    
	return freeUnits
end