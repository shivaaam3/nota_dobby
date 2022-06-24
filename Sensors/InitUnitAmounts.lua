local sensorInfo = {
	name = "InitUnitAmounts",
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

-- bb.unitAmount[type]
-- @ Returns initialized table of unit groups.
return function()
    local groups = {}
    groups["armmart"] = 0
    groups["armmav"] = 0
    groups["armfark"] = 0
    groups["armpeep"] = 0
    groups["armseer"] = 0
    return groups
end