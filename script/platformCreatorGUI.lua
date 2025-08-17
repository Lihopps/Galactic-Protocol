local gui = require("__flib__.gui")

local platformCreatorGUI = {}

local function get_all_planets(player)
    local list={}
    local index=0
    for name,planet in pairs(game.planets) do
        if player.force.is_space_location_unlocked(name) then
            table.insert(list, planet.name)
            if player.surface.name==name then
                index=#list
            end
        end
    end
    return {list,index}
end

local function on_create_platform(e)
    local table=e.element.parent.parent.children[2].children[1].children[1]
    local name=table.gp_platform_name.text
    local planet=table.gp_planet_creation.items[table.gp_planet_creation.selected_index]
    local start=table.gp_starterpack.elem_value or "space-platform-starter-pack"

    game.players[e.player_index].force.create_space_platform{name=name,planet=planet,starter_pack=start}
end

local function on_gui_fermed(e)
    local player = game.players[e.player_index]
    if player.gui.screen["gp-platformCreatorGUI"] then
        player.gui.screen["gp-platformCreatorGUI"].destroy()
    end
end

local function on_gui_closed(e)
    if e.element then
        if e.element.name=="gp-platformCreatorGUI" then
            on_gui_fermed(e)
        end
    end
end

function platformCreatorGUI.create_platformCreatorGUI(player)
    if player.gui.screen["gp-platformCreatorGUI"] then
        player.gui.screen["gp-platformCreatorGUI"].destroy()
    end
    local list=get_all_planets(player)
    local platformcreatorgui = gui.add(player.gui.screen,
        {
            type = "frame",
            name = "gp-platformCreatorGUI",
            direction = "vertical",
            visible = true,
            style_mods = {
                horizontally_stretchable = true,
                horizontally_squashable=true
            },
            handler = { [defines.events.on_gui_closed] = on_gui_closed },
            children = {
                ----bar du haut
                {
                    type = "flow",
                    style_mods = { horizontally_squashable = true },
                    name = "titlebar",
                    children = {
                        {
                            type = "label",
                            style = "subheader_caption_label",
                            rich_text_setting = "enabled",
                            caption = {"gui-new-space-platform.title"},
                            name = "name_label",
                        },
                        {
                            type = "empty-widget",
                            style = "draggable_space_header",
                            style_mods = { height = 24, horizontally_stretchable = true, right_margin = 4 },
                            ignored_by_interaction = true,
                        },
                        {
                            type = "sprite-button",
                            style = "frame_action_button",
                            sprite = "utility/close",
                            name = "platformCreatorGUI-button_close",
                            hovered_sprite = "utility/close",
                            clicked_sprite = "utility/close",
                            tooltip = { "gui.close-instruction" },
                            handler = { [defines.events.on_gui_click] = on_gui_fermed },
                        },
                    },
                },

                ---milieu
                {
                    type="frame",
                    style="inside_shallow_frame_with_padding",
                    children={
                        {
                            type="flow",
                            direction="vertical",
                            children={
                                {
                                    type="table",
                                    column_count=2,
                                    style="bordered_table",
                                    children={
                                        {
                                            type="label",
                                            caption={"gui-new-space-platform.name"}
                                        },
                                        {
                                            type="textfield",
                                            name="gp_platform_name",
                                            icon_selector =true,
                                            text=game.backer_names[math.random(1,#game.backer_names)]
                                        },
                                        {
                                            type="label",
                                            caption={"gui-new-space-platform.planet"}
                                        },
                                        {
                                            type="drop-down",
                                            name="gp_planet_creation",
                                            items=list[1],
                                            selected_index=list[2]
                                        },
                                        {
                                            type="label",
                                            caption={"gui-new-space-platform.starter-pack"}
                                        },
                                        {
                                            type="choose-elem-button",
                                            name="gp_starterpack",
                                            elem_type="item",
                                            elem_value="space-platform-starter-pack",
                                            elem_filters={{filter = "type", type = "space-platform-starter-pack"}}
                                        },
                                    }
                                }
                            }
                        }
                    }
                },

                --bar du bas
                {
                    type="flow",
                    style="dialog_buttons_horizontal_flow",
                    direction="horizontal",
                    name = "bottombar",
                    style_mods={vertical_align="center"},
                    children={
                        {
                            type = "empty-widget",
                            style = "draggable_space",
                            style_mods = {vertical_align="center", vertically_stretchable=true, horizontally_stretchable = true, right_margin = 4 },
                            ignored_by_interaction = true,
                        },
                        {
                            type="button",
                            style="confirm_button",
                            caption={"gui-new-space-platform.create"},
                            handler = { [defines.events.on_gui_click] = on_create_platform },
                        }
                    }
                }
            }
        })
    platformcreatorgui.titlebar.drag_target = platformcreatorgui["gp-platformCreatorGUI"]
    platformcreatorgui.bottombar.drag_target = platformcreatorgui["gp-platformCreatorGUI"]
    platformcreatorgui["gp-platformCreatorGUI"].force_auto_center()
    player.opened = platformcreatorgui["gp-platformCreatorGUI"]
end

platformCreatorGUI.events = {
    [defines.events.on_gui_closed] = on_gui_closed,
}

gui.add_handlers({
    on_gui_fermed = on_gui_fermed,
    on_create_platform=on_create_platform
})

return platformCreatorGUI
