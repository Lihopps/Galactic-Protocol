local mod_gui = require("__core__.lualib.mod-gui")

local character={}



local function create_custom_tooltip(player, entity)
    -- Remove old
    if mod_gui.get_frame_flow(player).custom_tooltip then
        mod_gui.get_frame_flow(player).custom_tooltip.destroy()
    end
    -- Create overlay
    mod_gui.get_frame_flow(player).add{
        type = "frame",
        name = "custom_tooltip",
        caption = "Custom Info",
        direction = "vertical",
        children={
                {
        type = "label",
        caption = "This is my own tooltip!\nHealth: " .. entity.health
    }
        }
    }
   
end

local function destroy_custom_tooltip(player)
    if mod_gui.get_frame_flow(player).custom_tooltip then
        mod_gui.get_frame_flow(player).custom_tooltip.destroy()
    end
end

-- Handle selection changes
local function on_selected_entity_changed(e)
    local player = game.get_player(e.player_index)
    local entity = player.selected
    if entity and entity.valid and entity.name == "spaceshipph" then
        create_custom_tooltip(player, entity)
        storage.players_custom_tooltip[player.index]=true
    else
        destroy_custom_tooltip(player)
        storage.players_custom_tooltip[player.index]=nil
    end
end




local function update_custom_tooltip_ship(player)
    if mod_gui.get_frame_flow(player).custom_tooltip then
        --player.gui.screen.custom_tooltip.location=player.
    end
end

local function on_tick(e)
    for index,_ in pairs(storage.players_custom_tooltip) do
        update_custom_tooltip_ship(game.players[index])
    end
end

character.events={

    [defines.events.on_selected_entity_changed]=on_selected_entity_changed,
    [defines.events.on_tick]=on_tick
}


return character