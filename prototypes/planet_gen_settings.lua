local util_math = require("util.math")
local planet_gen_settings = {}

function planet_gen_settings.tweak_planet(gen, planet)
    --tweak content/ressource
    --data.raw.ressource
    local all_resource = {}
    for k, v in pairs(data.raw.resource) do
        table.insert(all_resource, v.name)
    end
    local limit = 0
    local mgs = table.deepcopy(planet.map_gen_settings)
    for name, _ in pairs(planet.map_gen_settings.autoplace_controls) do
        if gen:random() < 0.8 then
            local new_name = all_resource[gen:random(1, #all_resource)]
            if data.raw["autoplace-control"][new_name:gsub("-", "_")] then
                limit = limit + 1
                mgs.autoplace_controls[name:gsub("-", "_")] = nil
                mgs.autoplace_settings["entity"]["settings"][name:gsub("_", "-")] = nil

                local spawn_data = {
                    frequency = util_math.map(gen:random(), 0, 1, 0, 10),
                    size = util_math.map(gen:random(), 0, 1, 0, 10),
                    richness = util_math.map(gen:random(), 0, 1, 0, 10)
                }

                mgs.autoplace_settings["entity"]["settings"][new_name:gsub("_", "-")] = spawn_data
                mgs.autoplace_controls[new_name:gsub("-", "_")] = spawn_data
            end
        end
        if limit >= 3 then
            break
        end
    end
    planet.map_gen_settings = mgs
    --tweak enemy

    --tweak surface condition
    if planet.surface_properties then
        for key, value in pairs(planet.surface_properties) do
            planet.surface_properties[key] = util_math.map(gen:random(), 0, 1, 0, value * 2)
        end
    end
end

function planet_gen_settings.planet_size()
    -- add tile prop for planet size
    for name, tile in pairs(data.raw.tile) do
        if name == "out-of-map" then
            tile.autoplace = { probability_expression = "if(distance < planet_size, -1000, 1)" }
        elseif name == "empty-space" then
            tile.autoplace = { probability_expression = "if(distance < planet_size+5, -1000, 1)" }
        else
            if tile.autoplace and tile.autoplace.probability_expression then
                tile.autoplace.probability_expression = "if(distance < planet_size, " ..
                    tile.autoplace.probability_expression .. ", -1000)"
            end
        end
    end

    for name, planet in pairs(data.raw.planet) do
        local map_settings = planet.map_gen_settings
        if not map_settings then
            log("skipping planet with no mapgen settings: " .. name)
            goto continue
        end

        map_settings.autoplace_settings.tile.settings["out-of-map"] = {}
        map_settings.autoplace_settings.tile.settings["empty-space"] = {}
        local planet_scale = planet.surface_properties.size_surface or 500
        map_settings.property_expression_names["planet_size"] = planet_scale

        if not map_settings.territory_settings then goto continue end
        local expr_name = map_settings.territory_settings.territory_index_expression
        if not expr_name then goto continue end

        local new_expr_name = expr_name .. "_with_radius"

        local new_expr = data.raw["noise-expression"][new_expr_name]
        if not new_expr then
            data:extend {
                {
                    type = "noise-expression",
                    name = new_expr_name,
                    expression = expr_name .. " - (distance >= planet_size-32)"
                }
            }
        end

        map_settings.territory_settings.territory_index_expression = new_expr_name


        ::continue::
    end
end

return planet_gen_settings
