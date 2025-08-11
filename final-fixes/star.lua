local util_math = require("util.math")
local spacelocationfinalupdate=require("final-fixes.spacelocation")


local function star_color(temperature)
    local step = (300 - 100) / 4
    if temperature >= 100 + 0 * step and temperature < 100 + 1 * step then
        return { r = 1, g = util_math.map(temperature, 100 + 0 * step, 100 + 1 * step, 0, 1), b = 0, a = 1 }
    elseif temperature >= 100 + 1 * step and temperature < 100 + 2 * step then
        return { r = 1, g = 1, b = util_math.map(temperature, 100 + 1 * step, 100 + 2 * step, 0, 1), a = 1 }
    elseif temperature >= 100 + 2 * step and temperature < 100 + 3 * step then
        return { r = util_math.map(temperature, 100 + 2 * step, 100 + 3 * step, 1, 0), g = 1, b = 1, a = 1 }
    elseif temperature >= 100 + 3 * step and temperature < 100 + 4 * step then
        return { r = 0, g = util_math.map(temperature, 100 + 3 * step, 100 + 4 * step, 1, 0), b = 1, a = 1 }
    end
end

local function star_size(temperature)
    return util_math.map(temperature, 100, 300, 1, 12)
end






-- on créé les placeholder pour les space-location
for splocation_name, splocation in pairs(data.raw["space-location"]) do
    spacelocationfinalupdate.updateArbo(splocation)
end

data:extend({ {

    type = "space-location",
    name = "gpstar-calidus",
    factoriopedia_description=helpers.table_to_json({child={"nauvis","vulcanus","gleba","fulgora","aquilo","asuras","solar-system-edge"},connection={"vulcanus"}}),
    localised_description = "[fluid=fusion-plasma]",
    icons = {
        {
            icon = "__zzz-GalacticProtocol__/graphics/icons/starmap-star.png",
            tint = star_color(140),
            icon_size = 512,
        }
    },
    magnitude = star_size(140),
    starmap_icons = {
        {
            icon = "__zzz-GalacticProtocol__/graphics/icons/starmap-star.png",
            tint = star_color(140),
            icon_size = 512,
        }
    },
    order = "0",
    draw_orbit = false,
    gravity_pull = -10,
    solar_power_in_space = 100,
    distance = 0,
    orientation = 0,
    label_orientation = 0.15,
},
    {
        type = "space-connection",
        name = "gpstar-calidus-to-vulcanus",
        to = "gpstar-calidus",
        from = "vulcanus",
        order = "[d]",
        length = 1000, --20000,
        --need_spanwdef = true
        --asteroid_spawn_definitions =asteroid_spawn_definitions --asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
})




for name, prototype in pairs(data.raw["space-connection"]) do
    if name == "gpstar-calidus-to-vulcanus" then
        local from = data.raw["space-location"][prototype.from] or data.raw["planet"][prototype.from]
        local to = data.raw["space-location"][prototype.to] or data.raw["planet"][prototype.to]
        if (not prototype.icon) and (not prototype.icons) and from and (from.icon or from.icons[1].icon) and to and (to.icon or to.icons[1].icon) then
            local from_size = from.icon_size or 64
            local from_tint = from.tint or { r = 1, g = 1, b = 1, a = 1 }
            if from.icons then
                from_size = from.icons[1].icon_size or 64
                from_tint = from.icons[1].tint
            end

            local to_size = to.icon_size or 64
            local to_tint = to.tint or { r = 1, g = 1, b = 1, a = 1 }
            if to.icons then
                to_size = to.icons[1].icon_size or 64
                to_tint = to.icons[1].tint
            end
            prototype.icons =
            {
                { icon = "__space-age__/graphics/icons/planet-route.png" },
                { icon = from.icon or from.icons[1].icon,                tint = from_tint, icon_size = from_size, scale = 0.333 * (64 / (from_size)), shift = { -6, -6 } },
                { icon = to.icon or to.icons[1].icon,                    tint = to_tint,   icon_size = to_size,   scale = 0.333 * (64 / (to_size)),   shift = { 6, 6 } }
            }
        end

        if prototype.need_spanwdef and from and to then
            prototype.asteroid_spawn_definitions = asteroids.spawn_connection_inner_to_inner(prototype.belt, from, to)
        end
    end
end

if data.raw["utility-sprites"] and data.raw["utility-sprites"]["default"] then
  data.raw["utility-sprites"]["default"]["starmap_star"] = {
    type = "sprite",
    layers = {
         {
            filename = "__core__/graphics/empty.png",
            size = 64,
            scale = 1,
        }
    },
  }
end