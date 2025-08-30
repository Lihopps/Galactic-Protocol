local mod_gui = require("__core__.lualib.mod-gui")
local gui = require("__flib__.gui")
local util_tooltip =require("util.tooltip")

local custom_tooltip = {}


local function create_custom_tooltip(player,entity,data_display,type)
    -- Remove old
    if mod_gui.get_frame_flow(player).custom_tooltip then
        mod_gui.get_frame_flow(player).custom_tooltip.destroy()
    end

    -- Create overlay
    local tooltip=gui.add(mod_gui.get_frame_flow(player),{
        type = "frame",
        name = "custom_tooltip",
        tags={type=type},
        caption = data_display[2] ,
        direction = "vertical",
        children = data_display[1] or {}
    })
end

local function destroy_custom_tooltip(player)
    if mod_gui.get_frame_flow(player).custom_tooltip then
        mod_gui.get_frame_flow(player).custom_tooltip.destroy()
    end
end

local function data_display_collector(entity)
    if entity.type=="lamp" and entity.name=="spaceshipph" then
        --collect data for spaceship
        local platform=storage.gpship[entity.unit_number]
        local data=util_tooltip.make_platform_Tooltip(platform)
        return {data,{"",{"surface-name.space-platform"}," ",platform.name}}
    elseif entity.type=="roboport" and prototypes.space_location[entity.name] then 
        --collect data for planet and star
        local data=util_tooltip.make_corps_Tooltip(prototypes.space_location[entity.name])
        return {data,{"?",entity.localised_name,entity.name}}
    end
    return nil
end

local function data_display_collector_from_list(platform)
        local data=util_tooltip.make_platform_Tooltip(platform)
        return {data,{"",{"surface-name.space-platform"}," ",platform.name}}
end

-- Handle selection changes
local function on_selected_entity_changed(e)
    local player = game.get_player(e.player_index)
    local entity = player.selected
    if entity and entity.valid and string.find(entity.surface.name, "gpstar-",0,true) then
        local tag_type="corps"
        if entity.name=="spaceshipph" then
            tag_type="space_ship"
        end
        create_custom_tooltip(player, entity,data_display_collector(entity),tag_type)
        storage.players_custom_tooltip[player.index] = true
        
    else
        destroy_custom_tooltip(player)
        storage.players_custom_tooltip[player.index] = nil
    end
end

local function update_custom_tooltip_ship(player)
    if mod_gui.get_frame_flow(player).custom_tooltip then
        if mod_gui.get_frame_flow(player).custom_tooltip.tags.type=="space_ship" then
            util_tooltip.update_travel_gui(mod_gui.get_frame_flow(player).custom_tooltip,storage.gpship[player.selected.unit_number])
        end
        --player.gui.screen.custom_tooltip.location=player.
    end
end

local function on_tick(e)
    for index, _ in pairs(storage.players_custom_tooltip) do
        update_custom_tooltip_ship(game.players[index])
    end
end

function custom_tooltip.create_tooltip_from_list(bool,player,platform,tag_type)
    if bool then
        create_custom_tooltip(player, nil,data_display_collector_from_list(platform),tag_type)
    else
        destroy_custom_tooltip(player)
    end
    
end

custom_tooltip.events = {
    [defines.events.on_selected_entity_changed] = on_selected_entity_changed,
    [defines.events.on_tick] = on_tick
}

return custom_tooltip