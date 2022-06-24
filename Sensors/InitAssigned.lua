local sensorInfo = {
	name = "InitAssigned",
	desc = "",
	author = "Dobby",
	date = "2022-06-24",
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @ Returns initialized table of assigned units with state "free".
return function()
    local myTeamID = Spring.GetMyTeamID()
    local myUnits = Spring.GetTeamUnits(myTeamID)
    local table = {}

    for _, unitID in ipairs(myUnits) do
        table[unitID] = "__"
    end
    return table
end