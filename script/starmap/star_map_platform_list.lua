local mod_gui = require("__core__.lualib.mod-gui")
local gui = require("__flib__.gui")

local platformCreatorGUI=require("script.platformCreatorGUI")
local custom_tooltip =require("script.starmap.custom_star_map_tooltip")
local util_tooltip=require("util.tooltip")

local function open_star_platform(e)
    local play=game.players[e.player_index]
    platformCreatorGUI.create_platformCreatorGUI(play)
end

local function open_platform(e)
    local play=game.players[e.player_index]
    local platinx=e.element.tags.index
    play.centered_on=play.force.platforms[platinx].hub
end

local function platform_tooltip(e)
    local play=game.players[e.player_index]
    local bool = true
    if e.name~=196 then bool=false end
    if not e.element.tags.enabled then return end
    local platform=play.force.platforms[e.element.tags.index]
    custom_tooltip.create_tooltip_from_list(bool,play,platform,"space_ship")
end

local pltformlist={}

local function on_tick(e)
    if e.tick%60==3 then
        for _,player in pairs(game.players) do
            if mod_gui.get_frame_flow(player).platform_list then
               pltformlist.update_list(player)
            end
        end
    end
end

local function get_platform(force)
    local platforms={}
    for index,platform in pairs(force.platforms) do
        local data=pltformlist.get_state(platform)
        if not data.delete then
            table.insert(platforms,{
                type="button",
                caption=util_tooltip.platform_caption_list(data,platform),
                raise_hover_events=true,
                style = "platform_list_button",
                style_mods = {
                    horizontally_stretchable = true,
                    horizontally_squashable=true,
                    horizontal_align="left",
                },
                tags={index=index,enabled=data.enabled},
                handler = { [defines.events.on_gui_click] = open_platform,[defines.events.on_gui_hover]=platform_tooltip,[defines.events.on_gui_leave]=platform_tooltip },
                enabled = data.enabled,
                tooltip=data.tooltip
            })
        end
    end
    table.insert(platforms,{
        type="button",
        caption={"gui-surface-list.new-space-platform-button"},
        style_mods = {
            horizontally_stretchable = true,
            horizontally_squashable=true
        },
        handler = { [defines.events.on_gui_click] = open_star_platform },
    })

    return platforms
end

function pltformlist.get_state(platform)
    local data={enabled=true,tooltip=nil,delete=false}
    local state={
        [defines.space_platform_state.waiting_for_starter_pack]=true,
        [defines.space_platform_state.starter_pack_requested]=true,
        [defines.space_platform_state.starter_pack_on_the_way]=true,
    }
    if state[platform.state] then
        data.enabled=false
        data.tooltip={"gui-space-platforms.space-platform-not-created-yet"}
    else
        data.enabled=true
    end
    if platform.scheduled_for_deletion>0 then
        data.delete=true
    end
    return data
end

function pltformlist.update_list(player)
    -- Remove 
    if mod_gui.get_frame_flow(player).platform_list then
        mod_gui.get_frame_flow(player).platform_list.clear()
    end
    -- Create overlay
    local tooltip=gui.add(mod_gui.get_frame_flow(player).platform_list,
        get_platform(player.force)
    )
end

function pltformlist.create_list(player)
    -- Remove 
    if mod_gui.get_frame_flow(player).platform_list then
        mod_gui.get_frame_flow(player).platform_list.destroy()
    end
    -- Create overlay
    local frame=mod_gui.get_frame_flow(player)
    local tooltip=gui.add(mod_gui.get_frame_flow(player),{
        type = "frame",
        name = "platform_list",
        caption = "Platform List" ,
        direction = "vertical",
        style_mods={width=200},
        children = get_platform(player.force)
    })
end

function pltformlist.destroy_list(player)
    -- Remove 
    if mod_gui.get_frame_flow(player).platform_list then
        mod_gui.get_frame_flow(player).platform_list.destroy()
    end

end

pltformlist.events={
    [defines.events.on_tick]=on_tick,
}

gui.add_handlers({
    open_star_platform=open_star_platform,
    open_platform=open_platform,
    platform_tooltip=platform_tooltip,
})

return pltformlist