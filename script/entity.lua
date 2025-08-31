local function on_entity_build(e)
	local entity = e.entity or e.created_entity
	local constructeur = nil
	if e.player_index then
		constructeur = game.players[e.player_index]
	else
		constructeur = e.robot or e.platform
	end
	if not entity or not entity.valid then
		return
	end
	if not constructeur or not constructeur.valid then
		return
	end
	if (entity.name == "gp-harvester") then
        entity.recipe_locked=true
	end
	---test.on_entity_build(e)
end

local entities={}

entities.events={
	[defines.events.on_built_entity]=on_entity_build,
	[defines.events.on_robot_built_entity]=on_entity_build,
	[defines.events.on_space_platform_built_entity]=on_entity_build,
}

return entities