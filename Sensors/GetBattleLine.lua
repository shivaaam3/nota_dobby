local sensorInfo = {
	name = "GetBattleLine",
	desc = "Returns coordinate of battle-line in given corridor.",
	author = "Renata Pivodova",
	date = "2022-06"
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

function getClosestEnemy(enemies, toPos) 
    local bestDistance = nil
    local bestEnemy = nil
    for _, enemy in ipairs(enemies) do
        local enemy_id = Spring.GetUnitDefID(enemy)
        if enemy_id ~= nil then
            local enemy_name = UnitDefs[enemy_id].name
        end
        local x, y, z, _ = Spring.GetUnitPosition(enemy)
        local enemyPos = Vec3(x, y, z)
        local distance = enemyPos:Distance(toPos)
        if enemy_name == "shika" then
            return enemy 
        end
        if bestDistance == nil or distance < bestDistance then
            bestDistance = distance
            bestEnemy = enemy
        end
    end
    return bestEnemy
end


return function(corridor)
    for _, point in ipairs(corridor) do
        local enemies = Sensors.nota_mestek_labs.EnemyUnitsInArea({center = {x=point.x, y=point.y, z=point.z}, radius=300})
		if #enemies > 0 then
			local enemy = getClosestEnemy(enemies, corridor[1])
            local x, y, z = Spring.GetUnitPosition(enemy)
            return Vec3(x,y,z)
		end
    end
    return corridor[#corridor]
end