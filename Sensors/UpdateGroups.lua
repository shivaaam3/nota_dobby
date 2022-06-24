local sensorInfo = {
	name = "UpdateGroups",
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

--  UnitsTable = {
--
--         Maverick ={1, 2, 3, 4},
--         Atlas = {q1, 2,3 4}
--            ...
-- }

function CheckForUnitType(name)
    if name == "armmart" or name == "armmav" or name == "armfark" or name == "armpeep" or name == "armseer" then return true end
    return false 
end


-- @ Returns updated table of unit groups.
return function()
    local myTeamID = Spring.GetMyTeamID()
    local myUnits = Spring.GetTeamUnits(myTeamID)

    for _, unitID in ipairs(myUnits) do
        if bb.assigned[unitID] == "__" or bb.assigned[unitID] == nil then 
            local name = UnitDefs[Spring.GetUnitDefID(unitID)].name

            if CheckForUnitType(name) == true then
                table.insert(bb.unitsTable[name], unitID)
                bb.assigned[unitID] = "free" 
            end
        end
    end


    -- remove dead units
    for name, value in ipairs(bb.unitsTable) do
        for i, unitID in ipairs(value) do
            if Spring.GetUnitIsDead(unitID) ~= false then
                unitTable[name][i] = nil
                break
            end
        end
    end

    return bb.unitsTable
end