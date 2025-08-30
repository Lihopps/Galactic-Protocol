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
    local mgs=table.deepcopy(planet.map_gen_settings)
    for name,_ in pairs(planet.map_gen_settings.autoplace_controls) do
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
    planet.map_gen_settings=mgs
    --tweak enemy

    --tweak surface condition
    if planet.surface_properties then
        for key, value in pairs(planet.surface_properties) do
            planet.surface_properties[key] = util_math.map(gen:random(), 0, 1, 0, value * 2)
        end
    end
end

return planet_gen_settings
