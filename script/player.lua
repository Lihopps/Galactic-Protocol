local mod_gui = require("__core__.lualib.mod-gui")
local gui = require("__flib__.gui")
local pltformlist = require("script.starmap.star_map_platform_list")

local player = {}

local function on_player_changed_surface(e)
    local player = game.players[e.player_index]
    if player and player.valid then
        if player.surface then
            if string.find(game.surfaces[player.surface.index].name, "gpstar-", 0, true) then
                --player.game_view_settings.show_entity_info=false
                player.game_view_settings.show_map_view_options = false
                player.game_view_settings.show_quickbar = false
                player.game_view_settings.show_minimap = false
                player.game_view_settings.show_shortcut_bar = false
                player.game_view_settings.show_crafting_queue = false
                player.game_view_settings.show_tool_bar = false
                player.game_view_settings.show_entity_tooltip = false
            else
                --player.game_view_settings.show_entity_info=true
                player.game_view_settings.show_map_view_options = true
                player.game_view_settings.show_quickbar = true
                player.game_view_settings.show_minimap = true
                player.game_view_settings.show_shortcut_bar = true
                player.game_view_settings.show_crafting_queue = true
                player.game_view_settings.show_tool_bar = true
                player.game_view_settings.show_entity_tooltip = true
            end
        end
    end
end

local function on_player_controller_changed(e)
    local player = game.players[e.player_index]
    if player and player.valid then
        if player.controller_type == defines.controllers.remote then
            pltformlist.create_list(player)
            if storage.lihop_debug then
                player.game_view_settings.show_surface_list=true
            end
        else
            pltformlist.destroy_list(player)
            player.game_view_settings.show_surface_list=false
        end
    end
end

local function on_gui_opened(e)
    if e.entity and e.entity.valid then
        if e.entity.type == "roboport" then
            if prototypes.space_location[e.entity.name] then
                game.players[e.player_index].opened = nil
                if game.planets[e.entity.name] then
                    if game.planets[e.entity.name].surface then
                        game.players[e.player_index].set_controller { type = defines.controllers.remote, surface = game.planets[e.entity.name].surface }
                        return
                    end
                    game.print("pas de surface")
                    return
                elseif e.entity.surface.name == "gpstar-gpuniverse" then
                    game.players[e.player_index].set_controller { type = defines.controllers.remote, surface = e.entity.name }
                    return
                end
                game.print("pas une planet")
            end
        elseif e.entity.name == "spaceshipph" then
            if storage.gpship[e.entity.unit_number] then
                game.players[e.player_index].opened = nil
                game.players[e.player_index].centered_on=storage.gpship[e.entity.unit_number].hub
            end
        end
    end
end

local function custom_input(e)
    if e.input_name == "open-custom-PLANET" then
        if e.selected_prototype then
            if e.selected_prototype.base_type == "entity" and e.selected_prototype.derived_type == "roboport" then
                if prototypes.space_location[e.selected_prototype.name] then
                    game.players[e.player_index].open_factoriopedia_gui(prototypes.space_location
                    [e.selected_prototype.name])
                end
            end
        end
    end
end

local function open_star_system(e)
    local play = game.players[e.player_index]
    local surface = play.physical_surface
    if surface.planet then
        play.centered_on = storage.gpuniverse[surface.planet.name]
    else
        game.print("oune PB system")
    end
end

local function open_star_universe(e)
    local play = game.players[e.player_index]
    local surface = play.physical_surface or play.surface
    if surface.planet then
        play.centered_on = storage.gpuniverse["gp-universe"]
    else
        game.print("oune PB universe")
    end
end

function player.create_starSystem_button(player)
    local flow = mod_gui.get_button_flow(player)
    if flow then
        if not flow["gpstarSystem"] then
            local button = gui.add(mod_gui.get_button_flow(player), {
                {
                    type = "sprite-button",
                    style = "frame_action_button",
                    sprite = "starmapsystem",
                    style_mods = { size = { 37, 37 } },
                    name = "gpstarSystem",
                    tooltip = { "gui.open-systemMap" },
                    handler = { [defines.events.on_gui_click] = open_star_system },
                },
            })
        end
    end
end

function player.create_starUniverse_button(player)
    local flow = mod_gui.get_button_flow(player)
    if flow then
        if not flow["gpstarUniverse"] then
            local button = gui.add(mod_gui.get_button_flow(player), {
                {
                    type = "sprite-button",
                    style = "frame_action_button",
                    sprite = "starmapsystem",
                    style_mods = { size = { 37, 37 } },
                    name = "gpstarUniverse",
                    tooltip = { "gui.open-universeMap" },
                    handler = { [defines.events.on_gui_click] = open_star_universe },
                },
            })
        end
    end
end

function player.show_list()
    for _, player in pairs(game.players) do
        player.game_view_settings.show_surface_list = storage.lihop_debug
    end
end

player.events = {
    [defines.events.on_player_changed_surface] = on_player_changed_surface,
    [defines.events.on_player_controller_changed]=on_player_controller_changed,
    [defines.events.on_gui_opened] = on_gui_opened,
    ["open-custom-PLANET"] = custom_input,
}

gui.add_handlers({
    open_star_system = open_star_system,
    open_star_universe = open_star_universe,
})

return player
