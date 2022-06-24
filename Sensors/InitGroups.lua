local sensorInfo = {
	name = "InitGroups",
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


-- @ Returns initialized table of unit groups.
return function()
    local groups = {}
    groups = {
        ["armmart"] = {},
        ["armmav"] = {},
        ["armfark"] = {},
        ["armpeep"] = {},
        ["armseer"] = {}
    }
    return groups
end