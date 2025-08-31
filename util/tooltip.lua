local util_format = require("util.format")
local util_math = require("util.math")
local gui = require("__flib__.gui")
local format = require("__flib__.format")

local util_tooltip = {}

function util_tooltip.contains(planet)
    local entities = { "" }
    for entity, _ in pairs(planet.map_gen_settings.autoplace_settings["entity"].settings) do
        table.insert(entities, "[entity=" .. entity .. "]")
    end


    local fluids = { "" }
    local fluid = {}
    for tile, _ in pairs(planet.map_gen_settings.autoplace_settings["tile"].settings) do
        if prototypes.tile[tile].fluid then
            if not fluid[prototypes.tile[tile].fluid.name] then
                fluid[prototypes.tile[tile].fluid.name] = true
                table.insert(fluids, "[fluid=" .. prototypes.tile[tile].fluid.name .. "]")
            end
        end
    end


    local enemies = { "" }
    local enemy = {}
    for name, dat in pairs(prototypes.autoplace_control) do
        if dat.category == "enemy" then
            if planet.map_gen_settings.autoplace_controls[dat.name] then
                enemy[dat.name] = true
            end
        end
    end
    for typ, dat in pairs(prototypes.entity) do
        if dat.autoplace_specification then
            if enemy[dat.autoplace_specification.control] then
                table.insert(enemies, "[entity=" .. dat.name .. "]")
            end
        end
    end
    if planet.map_gen_settings.territory_settings then
        for _, unit in pairs(planet.map_gen_settings.territory_settings.units) do
            table.insert(enemies, "[entity=" .. unit .. "]")
        end
    end



    return { "", entities, enemies, fluids }
end

function util_tooltip.make_corps_Tooltip(planet)
    local tooltip = {}
    if planet.surface_properties then
        for name, value in pairs(planet.surface_properties) do
            local val = { "surface-property-unit." .. name, tostring(math.floor(value)) } or tostring(math.floor(value))
            if not string.find(name, "planet-str", 0, true) then
                if string.find(name, "day-night-cycle", 0, true) then
                    val = util_format.seconds_to_readable_times(value / 60)
                end
                table.insert(tooltip, {
                    type = "label",
                    caption = { "", { "surface-property-name." .. name }, " : ", val }
                })
            end
        end
        if planet.surface_properties["gravity"] and planet.surface_properties["pressure"] then
            table.insert(tooltip,
                {
                    type = "label",
                    caption = { "", { "gui-space-locations.robot-energy-usage" }, " : ", { "", "x ", tostring(100 * planet.surface_properties["gravity"] / (planet.surface_properties["pressure"])) } }
                })
        end
        -- if planet.lightning_properties then
        --     table.insert(tooltip, {
        --         name = { "description.mean-lightning-power" },
        --         value = {"description.mean-lightning-power-unit", tostring(1000/34.12969288)}
        --     })
        -- end
        if planet.map_gen_settings then
            table.insert(tooltip, {
                type = "label",
                caption = { "", { "gui-space-locations.contains" }, " : ", "\n", util_tooltip.contains(planet) }
            })
        end

        if planet.solar_power_in_space then
            table.insert(tooltip, {
                type = "label",
                caption = { "", { "surface-property-name.solar-power-in-space" }, " : ", { "surface-property-unit.solar-power-in-space", tostring(planet.solar_power_in_space) } }
            })
        end
        return tooltip
    elseif prototypes.mod_data["gptree"].data[planet.name].field then
        for type, fluid in pairs(prototypes.mod_data["gptree"].data[planet.name].field) do
            table.insert(tooltip, {
                type = "label",
                caption = {"",{"gui."..type},"[fluid="..fluid.."]",{"fluid-name."..fluid}}
            })
        end
        return tooltip
    end
    return nil
end

function util_tooltip.update_travel_gui(gui_data, platform)
    local travel = {}
    if platform.space_location then
        table.insert(travel, {
            type = "sprite-button",
            sprite = "space-location/" .. platform.space_location.name
        })
        table.insert(travel, {
            type = "label",
            caption = { "?", platform.space_location.localised_name, platform.space_location.name }
        })
    elseif platform.space_connection then
        local from = platform.last_visited_space_location
        local to = (platform.space_connection.from ~= platform.last_visited_space_location and platform.space_connection.from) or
        platform.space_connection.to
        local distance = (from == platform.space_connection.from and platform.distance) or 1 - platform.distance
        local display_distance = util_math.map(distance, 0, 1, 0, platform.space_connection.length)
        table.insert(travel, {
            type = "sprite-button",
            sprite = "space-location/" .. from.name
        })
        table.insert(travel, {
            type = "progressbar",
            style = "production_progressbar",
            value = distance,
            caption = { "si-unit-kilometer", util_format.en_to_fr(format.number(display_distance, false, 0)) }
        })
        table.insert(travel, {
            type = "sprite-button",
            sprite = "space-location/" .. to.name
        })
    end
    if gui_data then
        gui_data.platform_data.travel_data.clear()
        gui_data.platform_data.platform_speed.caption = { "", { "description.speed" }, " : ", { "si-unit-kilometer-per-second", format.number(platform.speed * 60, false, 5) } }
        gui_data.platform_data.platform_damage.caption = { "", { "description.damage" }, " : ", format.number(
        util_math.sum_array(platform.damaged_tiles, "damage"), true, 3) }
        gui.add(gui_data.platform_data.travel_data, travel)
        return
    end
    return travel
end

function util_tooltip.make_platform_Tooltip(platform)
    local tooltip = {}
    local travel = util_tooltip.update_travel_gui(nil, platform)

    table.insert(tooltip, {
        type = "flow",
        name = "platform_data",
        direction = "vertical",
        children = {
            {
                type = "flow",
                name = "travel_data",
                direction = "horizontal",
                style_mods = { vertical_align = "center" },
                children = travel
            },
            {
                type = "label",
                name = "platform_speed",
                caption = { "", "speed :", platform.speed }
            },
            {
                type = "label",
                caption = { "", "weight :", { "tons", platform.weight / 1000, platform.weight / 1000 } }
            },
            {
                type = "label",
                name = "platform_damage",
                caption = { "", { "description.damage" }, " : ", format.number(util_math.sum_array(platform.damaged_tiles, "damage"), true, 3) }
            }
        }
    })
    if platform.hub then
        table.insert(tooltip, {
            type = "camera",
            style_mods = { size = 400 },
            position = platform.hub.position,
            surface_index = platform.hub.surface.index,
            zoom = 0.09
        })
    end

    return tooltip
end


function util_tooltip.platform_caption_list(data,platform)
    local caption={""}
    if not data.enabled then
        table.insert(caption,"[img=utility/warning_white]")
    end
    table.insert(caption,"  [space-location="..platform.last_visited_space_location.name.."]  ")
    if platform.space_connection then
        table.insert(caption,"⇨")
        table.insert(caption,"  [space-location="..platform.space_connection.to.name.."]  ")
    end
    table.insert(caption,platform.name)

    return caption
end

return util_tooltip
