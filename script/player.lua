local player={}

local function on_player_changed_surface(e)
    local player=game.players[e.player_index]
    if player and player.valid then
        if player.surface then
            if string.find(game.surfaces[player.surface.index].name,"gpstar-",0,true) then
                player.game_view_settings.show_entity_info=false
                player.game_view_settings.show_map_view_options=false
                player.game_view_settings.show_quickbar=false
                player.game_view_settings.show_minimap=false
                player.game_view_settings.show_shortcut_bar=false
                player.game_view_settings.show_crafting_queue=false
                player.game_view_settings.show_tool_bar=false
            else
                player.game_view_settings.show_entity_info=true
                player.game_view_settings.show_map_view_options=true
                player.game_view_settings.show_quickbar=true
                player.game_view_settings.show_minimap=false
                player.game_view_settings.show_shortcut_bar=true
                player.game_view_settings.show_crafting_queue=true
                player.game_view_settings.show_tool_bar=true
            end
        end
    end
end

local function on_gui_opened(e)
    if e.entity and e.entity.valid then
        if e.entity.type=="lamp" then
            if prototypes.space_location[e.entity.name] then
                game.players[e.player_index].opened=nil
                if game.planets[e.entity.name] then
                    if game.planets[e.entity.name].surface then
                        game.players[e.player_index].set_controller{type=defines.controllers.remote,surface=game.planets[e.entity.name].surface}
                        return
                    end
                    game.print("pas de surface")
                    return
                end
                game.print("pas une planet")
            end
        end
    end
end

player.events={
    [defines.events.on_player_changed_surface]=on_player_changed_surface,
    [defines.events.on_gui_opened]=on_gui_opened,
}

return player
